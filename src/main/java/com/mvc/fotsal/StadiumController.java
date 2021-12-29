package com.mvc.fotsal;

import com.mvc.fotsal.model.biz.GameBiz;
import com.mvc.fotsal.model.biz.StadiumBiz;
import com.mvc.fotsal.model.biz.UserBiz;
import com.mvc.fotsal.model.dto.StadiumDto;
import com.mvc.fotsal.model.dto.UserDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
    public String StadiumList(Model model, HttpServletRequest request){
        logger.info("Move to Stadium List Page");

        model.addAttribute("gamedto", gameBiz.GameDetail(100));

        //세션
        HttpSession session = request.getSession();
        UserDto login = (UserDto) session.getAttribute("login");
        UserDto userDto = stadiumBiz.selectuser(login);
        model.addAttribute("userDto", userDto);

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
    public String StadiumDetail(Model model, HttpServletRequest request){
        logger.info("Move to Stadium Detail Page");

        //세션
        HttpSession session = request.getSession();
        UserDto login = (UserDto) session.getAttribute("login");
        UserDto userDto = stadiumBiz.selectuser(login);
        model.addAttribute("userDto", userDto);

        return "stadiumdetail";
    }
}
