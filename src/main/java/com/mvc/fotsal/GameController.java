package com.mvc.fotsal;

import com.mvc.fotsal.model.biz.GameBiz;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GameController {
    private static final Logger logger = LoggerFactory.getLogger(GameController.class);

    @Autowired
    private GameBiz gameBiz;

    @RequestMapping("/gamelist.do")
    public String GameListPage(){
        logger.info("Move to GameList Page");

        return "gamelist";
    }

    @RequestMapping("/gamedetail.do")
    public String GameDetailPage(){
    	logger.info("Move to GameDetail Page");

        return "gamedetail";
    }

    @RequestMapping("/gameinsert.do")
    public String GameInsertPage(){
        logger.info("Move to GameInsert Page");

        return "gameinsert";
    }

}
