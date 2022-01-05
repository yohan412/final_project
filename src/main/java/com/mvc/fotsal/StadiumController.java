package com.mvc.fotsal;

import com.mvc.fotsal.model.biz.GameBiz;
import com.mvc.fotsal.model.biz.ReviewBiz;
import com.mvc.fotsal.model.biz.StadiumBiz;
import com.mvc.fotsal.model.biz.UserBiz;
import com.mvc.fotsal.model.dto.PicDto;
import com.mvc.fotsal.model.dto.ReviewDto;
import com.mvc.fotsal.model.dto.StadiumDto;
import com.mvc.fotsal.model.dto.UserDto;
import com.mvc.fotsal.paging.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class StadiumController {
    private static final Logger logger = LoggerFactory.getLogger(StadiumController.class);

    @Autowired
    private GameBiz gameBiz;

    @Autowired
    private StadiumBiz stadiumBiz;
    @Autowired
    private ReviewBiz reviewBiz;

    @RequestMapping("/stadiumlist.do")
    public String StadiumList(Model model, HttpServletRequest request, StadiumPaging stadiumPaging, @ModelAttribute("stadiumSearch") StadiumSearch stadiumSearch){
        logger.info("Move to Stadium List Page");

        //세션
        HttpSession session = request.getSession();
        UserDto login = (UserDto) session.getAttribute("login");
        UserDto userDto = stadiumBiz.selectuser(login);
        model.addAttribute("userDto", userDto);

        //리스트 구현
        model.addAttribute("list", stadiumBiz.list(stadiumSearch));

        //페이징 구현
        StadiumPageMaker stadiumPageMaker = new StadiumPageMaker();
        stadiumPageMaker.setStadiumPaging(stadiumSearch);
        stadiumPageMaker.setTotalCount(stadiumBiz.listCount(stadiumSearch));
        model.addAttribute("pageMaker", stadiumPageMaker);

        return "stadiumlist";
    }

    @RequestMapping("/stadiuminsertform.do")
    public String StadiumInsertPage(Model model, HttpServletRequest request){
        logger.info("Move to Stadium Insert Page");

        //세션
        HttpSession session = request.getSession();
        UserDto login = (UserDto) session.getAttribute("login");
        UserDto userDto = stadiumBiz.selectuser(login);
        model.addAttribute("userDto", userDto);

        return "stadium_insert";
    }

    @RequestMapping("/stadiuminsert.do")
    public String StadiumInsert(Model model, MultipartHttpServletRequest mtf, StadiumDto stadiumDto){
        logger.info("Insert Stadium");

        int res = stadiumBiz.insert(stadiumDto);

        if(res > 0){
            String uploadPath = mtf.getRealPath("resources\\upload");

            List<MultipartFile> fileList = mtf.getFiles("upload_file");

            for(MultipartFile mf : fileList){
                String originFileName   = mf.getOriginalFilename();     //원본 파일 명
                long fileSize           = mf.getSize();                 //파일 크기

                String FileName = System.currentTimeMillis() + originFileName;

                String safeFile = uploadPath + "\\" + FileName;
                try{
                    mf.transferTo(new File(safeFile));

                    PicDto picDto = new PicDto(stadiumBiz.FindNo(stadiumDto), originFileName, FileName);

                    stadiumBiz.insert_img(picDto);

                }catch (IllegalStateException e){
                    e.printStackTrace();
                }catch (IOException e){
                    e.printStackTrace();
                }
            }

            logger.info("insert Success");
            return "redirect:stadiumlist.do";
        }else{
            logger.info("insert Fail");
            return "redirect:stadiumlist.do";
        }
    }

    @RequestMapping("/stadiumdetail.do")
    public String StadiumDetail(Model model, HttpServletRequest request, int stadium_no, ReviewPaging reviewPaging){
        logger.info("Move to Stadium Detail Page");

        //세션
        HttpSession session = request.getSession();
        UserDto login = (UserDto) session.getAttribute("login");
        UserDto userDto = stadiumBiz.selectuser(login);
        model.addAttribute("userDto", userDto);

        //디테일
        model.addAttribute("detail", stadiumBiz.detail(stadium_no));

        //리뷰 관련
        Map<String, Object> reviewmap = new HashMap<String, Object>();
        reviewmap.put("reviewPaging", reviewPaging);
        reviewmap.put("stadium_no", stadium_no);
        //리뷰 리스트
        model.addAttribute("review", reviewBiz.reviewlist(reviewmap));

        //리뷰 페이징 구현
        ReviewPageMaker reviewPageMaker = new ReviewPageMaker();
        reviewPageMaker.setReviewPaging(reviewPaging);
        reviewPageMaker.setTotalCount(reviewBiz.listcount());
        model.addAttribute("reviewpagemaker", reviewPageMaker);


        return "stadiumdetail";
    }

    @RequestMapping("/stadiumupdateform.do")
    public String StadiumUpdatePage(Model model, HttpServletRequest request, int stadium_no){
        logger.info("Move to Stadium Update Page");

        //세션
        HttpSession session = request.getSession();
        UserDto login = (UserDto) session.getAttribute("login");
        UserDto userDto = stadiumBiz.selectuser(login);
        model.addAttribute("userDto", userDto);

        //디테일
        model.addAttribute("detail", stadiumBiz.detail(stadium_no));

        return "stadium_update";
    }

    @RequestMapping("/stadiumupdate.do")
    public String StadiumUpdate(Model model, HttpServletRequest request, StadiumDto stadiumDto){
        logger.info("Update Stadium");

        int res = stadiumBiz.update(stadiumDto);

        if(res > 0){
            logger.info("Update Success");
            return "redirect:stadiumdetail.do?stadium_no=" + stadiumDto.getStadium_no();
        }else{
            logger.info("Update Fail");
            return "redirect:stadiumupdateform.do?stadium_no=" + stadiumDto.getStadium_no();
        }
    }

    @RequestMapping("/stadiumdelete.do")
    public String StadiumDelete(Model model, int stadium_no){
        logger.info("Delete Stadium");

        int res = stadiumBiz.delete(stadium_no);

        if(res > 0){
            logger.info("Delete Success");
            return "redirect:stadiumlist.do";
        }else{
            logger.info("Delete Fail");
            return "redirect:stadiumdetail.do?stadium_no=" + stadium_no;
        }
    }

    @RequestMapping("/review_insert.do")
    public String Stadium_Review_insert(Model model, ReviewDto reviewDto){
        logger.info("Insert Review");

        int res = reviewBiz.insert(reviewDto);

        if(res > 0){
            logger.info("Review Insert Success");
            return "redirect:stadiumdetail.do?stadium_no=" + reviewDto.getStadium_no();
        }else{
            logger.info("Review Insert Fail");
            return "redirect:stadiumdetail.do?stadium_no=" + reviewDto.getStadium_no();
        }
    }

    @RequestMapping("review_delete.do")
    public String Stadium_Review_Delete(Model model, int review_no, int stadium_no){
        logger.info("Delete Review");

        int res = reviewBiz.delete(review_no);

        if(res > 0){
            logger.info("Review Delete Success");
            return "redirect:stadiumdetail.do?stadium_no=" + stadium_no;
        }else{
            logger.info("Review Delete Fail");
            return "redirect:stadiumdetail.do?stadium_no=" + stadium_no;
        }
    }

    @RequestMapping(value = "/review_update.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Boolean> Stadium_Review_Update(Model model, @RequestBody ReviewDto reviewDto){
        logger.info("Update Review");

        int res = reviewBiz.update(reviewDto);

        boolean check = false;

        if(res > 0){
            logger.info("Review Update Success");
            check = true;
        }else{
            logger.info("Review Update Fail");
        }

        Map<String, Boolean> map = new HashMap<String, Boolean>();
        map.put("check", check);

        return map;
    }

}
