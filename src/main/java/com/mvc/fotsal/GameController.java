package com.mvc.fotsal;

import com.mvc.fotsal.model.biz.GameBiz;
import com.mvc.fotsal.model.dto.GamePageMaker;
import com.mvc.fotsal.model.dto.GamePaging;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GameController {
    private static final Logger logger = LoggerFactory.getLogger(GameController.class);

    @Autowired
    private GameBiz gameBiz;

    @RequestMapping("/gamelist.do")
    public String GameListPage(Model model, GamePaging gamePaging){
        logger.info("Move to GameList Page");

        model.addAttribute("gamelist", gameBiz.GameList(gamePaging));   //리스트 모델 추가

        GamePageMaker gamePageMaker = new GamePageMaker();                          //페이징 선언
        gamePageMaker.setGamePaging(gamePaging);
        gamePageMaker.setTotalCount(gameBiz.listCount());

        model.addAttribute("gamepagemaker", gamePageMaker);             //페이징 지정

        model.addAttribute("ddaychk", gameBiz.DdayChk(gamePaging));

        return "gamelist";
    }

    @RequestMapping("/gamedetail.do")
    public String GameDetailPage(Model model, int game_no){
    	logger.info("Move to GameDetail Page");
        model.addAttribute("gamedto", gameBiz.GameDetail(game_no));
        return "gamedetail";
    }

    @RequestMapping("/gameinsert.do")
    public String GameInsertPage(){
        logger.info("Move to GameInsert Page");

        return "gameinsert";

    }

}
