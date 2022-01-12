package com.mvc.fotsal;

import com.mvc.fotsal.model.biz.GameBiz;
import com.mvc.fotsal.model.biz.MercenaryBiz;
import com.mvc.fotsal.model.biz.StadiumBiz;
import com.mvc.fotsal.model.biz.UserBiz;
import com.mvc.fotsal.model.dto.GameAskDto;
import com.mvc.fotsal.model.dto.GameDto;
import com.mvc.fotsal.model.dto.MercenaryDto;
import com.mvc.fotsal.model.dto.UserDto;
import com.mvc.fotsal.paging.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.*;

import com.mvc.fotsal.message.gamemessageApp;

@Controller
public class GameController {
    private static final Logger logger = LoggerFactory.getLogger(GameController.class);

    @Autowired
    private GameBiz gameBiz;

    @Autowired
    private UserBiz userBiz;
    
    @Autowired
    private MercenaryBiz mBiz;

    @RequestMapping(value = "/gamelist.do", method = RequestMethod.GET)
    public String GameListPage(Model model, GamePaging gamePaging, @ModelAttribute("gameSearch") GameSearch gameSearch, HttpServletRequest request){
        logger.info("Move to GameList Page");

        model.addAttribute("gamelist", gameBiz.GameList(gameSearch));   //리스트 모델 추가

        GamePageMaker gamePageMaker = new GamePageMaker();                          //페이징 선언
        gamePageMaker.setGamePaging(gameSearch);
        gamePageMaker.setTotalCount(gameBiz.listCount(gameSearch));

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

        //세션
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("login");
        
        
        model.addAttribute("userDto", userDto);

        return "gamelist";
    }
    @RequestMapping("/getgamelist.do")
    public String getgamelist(HttpServletRequest request,Model model) {
    	
    	
    	
    	return "ajaxgamelist";
    }

    @RequestMapping("/gamedetail.do")
    public String GameDetailPage(Model model, int game_no, GameAskPaging gameAskPaging, HttpServletRequest request){
    	logger.info("Move to GameDetail Page");
        model.addAttribute("gamedto", gameBiz.GameDetail(game_no));
        
        

        GameAskPageMaker gameAskPageMaker = new GameAskPageMaker();
        gameAskPageMaker.setGameAskPaging(gameAskPaging);
        gameAskPageMaker.setTotalCount(gameBiz.CommentListCount(game_no));
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

        model.addAttribute("commentlist", commentlist);

        model.addAttribute("user_id", gameBiz.list_user_id(dblist));
        model.addAttribute("ask_status", gameBiz.list_ask_status(dblist));
        model.addAttribute("ask_no", gameBiz.list_ask_no(dblist));
        model.addAttribute("ask_gpno", gameBiz.list_ask_gpno(dblist));
        model.addAttribute("ask_gpsq", gameBiz.list_ask_gpsq(dblist));

        //세션
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("login");

        model.addAttribute("mDto", gameBiz.mDto(game_no));
        model.addAttribute("userDto", userDto);
        System.out.println(game_no);
        

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

    @RequestMapping(value = "/gamedetail_rp_comment_insert.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Boolean> Detail_rp_Comment_Insert(@RequestBody GameAskDto gameAskDto){
        logger.info("Insert rp Comment");

        Map<String, Boolean> map = new HashMap<String, Boolean>();
        boolean check = false;

        int res = gameBiz.Rp_Comment_Insert(gameAskDto);

        logger.info("res: " + res);

        if(res > 0){
            logger.info("Insert Success");
            check = true;
        }

        map.put("check", check);
        return map;
    }

    @RequestMapping(value = "/rp_comment_update.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Boolean> Detail_rp_Comment_Update(@RequestBody GameAskDto gameAskDto){
        logger.info("Update Comment");

        Map<String, Boolean> map = new HashMap<String, Boolean>();
        boolean check = false;

        int res = gameBiz.Rp_Status_Update(gameAskDto);

        if(res > 0){
            logger.info("Update Success");
            check = true;
        }

        map.put("check", check);

        return map;
    }

    @RequestMapping(value = "/comment_delete.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Boolean> Comment_Delete(@RequestBody GameAskDto gameAskDto){
        logger.info("Delete Comment");

        Map<String, Boolean> map = new HashMap<String, Boolean>();
        boolean check = false;

        int res = gameBiz.Comment_Delete(gameAskDto);

        if(res > 0){
            logger.info("Delete Success");
            check = true;
        }

        map.put("check", true);

        return map;
    }

    @RequestMapping("/gameinsertform.do")
    public String GameInsertPage(Model model, HttpServletRequest request){
        logger.info("Move to GameInsert Page");

        //세션
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("login");

        model.addAttribute("userDto", userDto);

        return "gameinsert";
    }

    @RequestMapping(value = "/gameinsert.do")
    public String GameInsert(Model model, GameDto gameDto, HttpServletRequest request){
        logger.info("Insert Game");

        String date = request.getParameter("date");
        logger.info("date " + date);

        SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");
        Date ssdate;
		try {
			ssdate = sdf.parse(date);
            gameDto.setGame_date(ssdate);
        } catch (ParseException e) {
            e.printStackTrace();
        }


        int res = gameBiz.GameInsert(gameDto);

        if(res > 0){
            logger.info("Insert Success");
            return "redirect:gamedetail.do?game_no=" + gameDto.getGame_no();
        }else{
            logger.info("Insert Fail");
            return "redirect:gamelist.do";
        }

    }

    @RequestMapping(value = "/gameupdateform.do")
    public String GameUpdatePage(Model model, int game_no, HttpServletRequest request){
        logger.info("Move to Game Update Page");

        //세션
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("login");

        model.addAttribute("userDto", userDto);

        //수정할 경기 내용
        model.addAttribute("gameDto", gameBiz.GameDetail(game_no));

        return "gameupdate";
    }

    @RequestMapping(value = "/gameupdate.do")
    public String GameUpdate(Model model, GameDto gameDto, HttpServletRequest request){
        logger.info("Update Game");

        //세션
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("login");

        model.addAttribute("userDto", userDto);

        int game_no = Integer.parseInt(request.getParameter("game_no"));

        String date = request.getParameter("date");
        logger.info("date " + date);

        SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");
        Date ssdate;
        try {
            ssdate = sdf.parse(date);
            gameDto.setGame_date(ssdate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        int res = gameBiz.GameUpdate(gameDto);

        if(res > 0){
            logger.info("Update Success");
            return "redirect:gamedetail.do?game_no=" + game_no;
        }else{
            logger.info("Update Fail");
            return "redirect:gameuploadform.do?game_no="+ game_no;
        }

    }

    @RequestMapping("/gamedelete.do")
    public String GameDelete(int game_no){
        logger.info("Delete Game");

        int res = gameBiz.GameDelete(game_no);

        if(res > 0){
            logger.info("Delete Success");
            return "redirect:gamelist.do";
        }else{
            logger.info("Delete Fail");
            return "redirect:gamedetail.do?game_no" + game_no;
        }
    }

    @RequestMapping("/gamesupport.do")
    @ResponseBody
    public void GameSupport(Model model, @RequestParam("userno")int user_no, @RequestParam("gameno")int game_no, HttpServletRequest request, @RequestParam("username")String username, @RequestParam("userphone")String userphone){
        logger.info("Game Support SMS");
        System.out.println(game_no);
        System.out.println(user_no);
        
        model.addAttribute("mDto", gameBiz.ApplyInsert(user_no, game_no));
        System.out.println(username);
        System.out.println(userphone);

        gamemessageApp.sendsms(username, userphone);                          //문자 보내기 기능
    }

    @RequestMapping("/sendtomer.do")
    @ResponseBody
    public void SendToMer(Model model, @RequestParam("mer_user_id")String mergency_user_id, @RequestParam("author_id")String author_id){
        UserDto mergency = gameBiz.selectinfo(mergency_user_id);    //용병 지원자
        UserDto author = gameBiz.selectinfo(author_id);             //글 작성자

        gamemessageApp.sendmer(mergency.getUser_phone(), author.getUser_phone());
    }

}
