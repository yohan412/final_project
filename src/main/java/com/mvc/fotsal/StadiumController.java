package com.mvc.fotsal;

import com.mvc.fotsal.model.biz.GameBiz;
import com.mvc.fotsal.model.biz.StadiumBiz;
import com.mvc.fotsal.model.biz.UserBiz;
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
    public String StadiumInsert(Model model, HttpServletRequest request){
        logger.info("Move to Stadium Insert Page");

        //세션
        HttpSession session = request.getSession();
        UserDto login = (UserDto) session.getAttribute("login");
        UserDto userDto = stadiumBiz.selectuser(login);
        model.addAttribute("userDto", userDto);

        return "stadium_insert";
    }
}
