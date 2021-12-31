package com.mvc.fotsal;

import com.mvc.fotsal.model.biz.GameBiz;
import com.mvc.fotsal.model.biz.StadiumBiz;
import com.mvc.fotsal.model.biz.UserBiz;
import com.mvc.fotsal.model.dto.StadiumDto;
import com.mvc.fotsal.model.dto.UserDto;
import com.mvc.fotsal.paging.StadiumPageMaker;
import com.mvc.fotsal.paging.StadiumPaging;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class StadiumController {
    private static final Logger logger = LoggerFactory.getLogger(StadiumController.class);

    @Autowired
    private GameBiz gameBiz;

    @Autowired
    private StadiumBiz stadiumBiz;

    @RequestMapping("/stadiumlist.do")
    public String StadiumList(Model model, HttpServletRequest request, StadiumPaging stadiumPaging){
        logger.info("Move to Stadium List Page");

        model.addAttribute("gamedto", gameBiz.GameDetail(100));

        //세션
        HttpSession session = request.getSession();
        UserDto login = (UserDto) session.getAttribute("dto");
        UserDto userDto = stadiumBiz.selectuser(login);
        model.addAttribute("userDto", userDto);

        //리스트 구현
        model.addAttribute("list", stadiumBiz.list(stadiumPaging));

        //페이징 구현
        StadiumPageMaker stadiumPageMaker = new StadiumPageMaker();
        stadiumPageMaker.setStadiumPaging(stadiumPaging);
        stadiumPageMaker.setTotalCount(stadiumBiz.listCount());
        model.addAttribute("pageMaker", stadiumPageMaker);

        return "stadiumlist";
    }

    @RequestMapping("/stadiuminsertform.do")
    public String StadiumInsertPage(Model model, HttpServletRequest request){
        logger.info("Move to Stadium Insert Page");

        //세션
        HttpSession session = request.getSession();
        UserDto login = (UserDto) session.getAttribute("dto");
        UserDto userDto = stadiumBiz.selectuser(login);
        model.addAttribute("userDto", userDto);

        return "stadium_insert";
    }

    @RequestMapping("/stadiuminsert.do")
    public String StadiumInsert(Model model, StadiumDto stadiumDto){
        logger.info("Insert Stadium");

        int res = stadiumBiz.insert(stadiumDto);

        if(res > 0){
            logger.info("insert Success");
            return "redirect:stadiumlist.do";
        }else{
            logger.info("insert Fail");
            return "redirect:stadiumlist.do";
        }
    }

    @RequestMapping("/stadiumdetail.do")
    public String StadiumDetail(Model model, HttpServletRequest request,int stadium_no){
        logger.info("Move to Stadium Detail Page");

        //세션
        HttpSession session = request.getSession();
        UserDto login = (UserDto) session.getAttribute("dto");
        UserDto userDto = stadiumBiz.selectuser(login);
        model.addAttribute("userDto", userDto);

        //디테일
        model.addAttribute("detail", stadiumBiz.detail(stadium_no));

        return "stadiumdetail";
    }

    @RequestMapping("/stadiumupdateform.do")
    public String StadiumUpdatePage(Model model, HttpServletRequest request, int stadium_no){
        logger.info("Move to Stadium Update Page");

        //세션
        HttpSession session = request.getSession();
        UserDto login = (UserDto) session.getAttribute("dto");
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
}
