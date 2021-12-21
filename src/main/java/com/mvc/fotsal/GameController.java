package com.mvc.fotsal;

import com.mvc.fotsal.model.biz.GameBiz;
import com.mvc.fotsal.model.dto.GameAskDto;
import com.mvc.fotsal.model.dto.GameDto;
import com.mvc.fotsal.paging.GameAskPageMaker;
import com.mvc.fotsal.paging.GameAskPaging;
import com.mvc.fotsal.paging.GamePageMaker;
import com.mvc.fotsal.paging.GamePaging;
import org.apache.http.HttpRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalTime;
import java.util.*;

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

        //경기 종료 시간 구간
        List<String> gametime = gameBiz.GameTime();
        List<String> endtime = new ArrayList<String>();

        for(int a = 0; a < gametime.size(); a++){
            String starttime = gametime.get(a);
            List<String> timearr = Arrays.asList(starttime.split(":"));

            int hh = Integer.parseInt(timearr.get(0));
            String mm = timearr.get(1);

            hh = hh + 1;

            String time = hh + ":" +mm;

            endtime.add(time);
        }
        model.addAttribute("endtime", endtime);

        //용병 모집 상태 구간
        List<Integer>   Dday        =   gameBiz.DdayChk(gamePaging);
        List<Integer>   merce       =   gameBiz.GameMercenary(gamePaging);
        List<String>    statuses    =   new ArrayList<String>();

        LocalTime time = LocalTime.now();
        int thh = time.getHour();

        for(int a = 0; a < Dday.size(); a++){
            int day = Dday.get(a);
            int mercesta= merce.get(a);
            String starttime = gametime.get(a);

            List<String> timearr = Arrays.asList(starttime.split(":"));

            int hh = Integer.parseInt(timearr.get(0));

            if(mercesta == 0){
                statuses.add("모집안함");
            }
            else{
                if(day == 0){
                    if(hh > thh){
                        statuses.add("급구");
                    }
                    else {
                        statuses.add("모집종료");
                    }
                }
                else if(day == 1 || day == 2){
                    statuses.add("급구");
                }
                else if(day >= 3){
                    statuses.add("모집중");
                }
                else if(day <= -1){
                    statuses.add("종료");
                }
            }
        }

        model.addAttribute("statuses", statuses);

        return "gamelist";
    }

    @RequestMapping("/gamedetail.do")
    public String GameDetailPage(Model model, int game_no, GameAskPaging gameAskPaging, HttpServletRequest request){
    	logger.info("Move to GameDetail Page");
        model.addAttribute("gamedto", gameBiz.GameDetail(game_no));

        GameAskPageMaker gameAskPageMaker = new GameAskPageMaker();
        model.addAttribute("gameaskpagemaker", gameAskPageMaker);

        //D-day 모델 지정
        int DdayChk = gameBiz.DdayChk_per(game_no);
        model.addAttribute("ddaychk", DdayChk);

        //경기 종료 시간
        String starttime = gameBiz.GameTime_per(game_no);    //경기 시작 시간
        String endtime   = null;

        List<String> starttimearr = Arrays.asList(starttime.split(":"));

        int hh = Integer.parseInt(starttimearr.get(0));
        String mm = starttimearr.get(1);

        int shh = hh + 1;

        endtime = shh + ":" + mm;

        model.addAttribute("endtime", endtime);

        //용병 모집 관련
        int Dday = gameBiz.DdayChk_per(game_no);
        int merce = gameBiz.GameMercenary_per(game_no);
        String status = null;

        LocalTime time = LocalTime.now();
        int thh = time.getHour();

        if(merce == 0){
            status = "모집안함";
        }
        else{
            if (Dday == 0){
                if(hh > thh){
                    status = "급구";
                }
                else {
                    status = "모집종료";
                }
            }
            else if(Dday == 1 || Dday == 2){
                status = "급구";
            }
            else if(Dday >= 3){
                status = "모집중";
            }
            else if(Dday <= -1){
                status = "종료";
            }
        }

        model.addAttribute("status", status);

        //댓글 구현
        Map<String, Object> dblist = new HashMap<String, Object>();

        dblist.put("game_no", game_no);
        dblist.put("gameAskDto", gameAskPaging);

        List<GameAskDto> commentlist = gameBiz.CommentList(dblist);

        /*HttpSession session = request.getSession();*/

        model.addAttribute("commentlist", commentlist);

        return "gamedetail";
    }

    @RequestMapping(value = "/gamedetail_comment_insert.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Boolean> Detail_Comment_Insert(@RequestBody GameAskDto gameAskDto){
        logger.info("Insert Comment");

        Map<String, Boolean> map = new HashMap<String, Boolean>();
        boolean check = false;

        int res = gameBiz.CommentInsert(gameAskDto);
        logger.info("res: " + res);

        if(res > 0){
            logger.info("Insert Success");
            check = true;
        }
        map.put("check", check);

        return map;
    }

    @RequestMapping("/gameinsertform.do")
    public String GameInsertPage(){
        logger.info("Move to GameInsert Page");

        return "gameinsert";
    }

    @RequestMapping(value = "/gameinsert.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Boolean> GameInsert(Model model, @RequestBody GameDto gameDto){
        logger.info("Insert Game");

        Map<String, Boolean> map = new HashMap<String, Boolean>();
        boolean check = false;

        int res = gameBiz.GameInsert(gameDto);
        logger.info("res: " + res);

        if(res > 0){
            logger.info("Insert Success");
            check = true;
        }
        map.put("check", check);

        return map;
    }

}
