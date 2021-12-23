package com.mvc.fotsal.model.dao;

import com.mvc.fotsal.model.dto.GameAskDto;
import com.mvc.fotsal.model.dto.GameDto;
import com.mvc.fotsal.paging.GameAskPaging;
import com.mvc.fotsal.paging.GamePaging;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class GameDaoImpl implements GameDao{
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<GameDto> GameList(GamePaging gamePaging) {
        List<GameDto> list = new ArrayList<GameDto>();

        try{
            list = sqlSessionTemplate.selectList(NAMESPACE + "GameList", gamePaging);
        }catch (Exception e){
            System.out.println("[ERROR] : GameList");
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public int listCount() {
        int listcount = 0;

        try{
            listcount = sqlSessionTemplate.selectOne(NAMESPACE + "ListCount");
        }catch (Exception e){
            System.out.println("[ERROR] : listCount");
            e.printStackTrace();
        }

        return listcount;
    }

    @Override
    public List<Integer> Ddaychk(GamePaging gamePaging){
        List<Integer> ddaychk = new ArrayList<Integer>();

        try{
            ddaychk = sqlSessionTemplate.selectList(NAMESPACE + "ddaychk", gamePaging);
        }catch (Exception e){
            System.out.println("[ERROR] : DdayChk");
            e.printStackTrace();
        }
        return ddaychk;
    }

    @Override
    public List<String> GameTime(){
        List<String> GameTime = new ArrayList<String >();

        try{
            GameTime = sqlSessionTemplate.selectList(NAMESPACE + "gametime");
        }catch (Exception e){
            System.out.println("[ERROR]: GameTime");
            e.printStackTrace();
        }
        return GameTime;
    }

    @Override
    public List<Integer> GameMercenary(GamePaging gamePaging){
        List<Integer> GameMercenary = new ArrayList<Integer>();

        try{
            GameMercenary = sqlSessionTemplate.selectList(NAMESPACE + "gamemercenary", gamePaging);
        }catch (Exception e){
            System.out.println("[ERROR]: GameMercenary");
            e.printStackTrace();
        }

        return GameMercenary;
    }

    @Override
    public GameDto GameDetail(int game_no) {
        GameDto gameDto = null;

        try{
            gameDto = sqlSessionTemplate.selectOne(NAMESPACE + "GameDetail", game_no);
        }catch (Exception e){
            System.out.println("[ERROR] : GameDetail");
            e.printStackTrace();
        }
        return gameDto;
    }

    @Override
    public int DdayChk_per(int game_no){
        int res = 0;

        try{
            res = sqlSessionTemplate.selectOne(NAMESPACE + "ddaychk_per", game_no);
        }catch (Exception e){
            System.out.println("[ERROR]: DdayChk_per");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public String GameTime_per(int game_no){
        String res = null;

        try{
            res = sqlSessionTemplate.selectOne(NAMESPACE + "gametime_per", game_no);
        }catch (Exception e){
            System.out.println("[ERROR]: GameTime_per");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public int GameMercenary_per(int game_no){
        int res = 0;

        try{
            res = sqlSessionTemplate.selectOne(NAMESPACE + "gamemercenary_per", game_no);
        }catch (Exception e){
            System.out.println("[ERROR]: GameMercenary_per");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public List<GameAskDto> CommentList(Map<String, Object> dblist){
        List<GameAskDto> list = new ArrayList<GameAskDto>();

        try{
            list = sqlSessionTemplate.selectList(NAMESPACE + "commentlist", dblist);
        }catch (Exception e){
            System.out.println("[ERROR]: CommentList");
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public int CommentListCount(int game_no){
        int listcount = 0;

        try{
            listcount = sqlSessionTemplate.selectOne(NAMESPACE + "CommentListCount", game_no);
        }catch (Exception e){
            System.out.println("[ERROR]: CommentListCount");
            e.printStackTrace();
        }

        return listcount;
    }

    @Override
    public int CommentInsert(GameAskDto gameAskDto){
        int res = 0;

        try{
            res = sqlSessionTemplate.insert(NAMESPACE + "commentinsert", gameAskDto);
        }catch (Exception e){
            System.out.println("[ERROR]: CommentInsert");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public int Rp_Comment_Insert(GameAskDto gameAskDto){
        int res = 0;

        try{
            res = sqlSessionTemplate.insert(NAMESPACE + "rpcommentinsert", gameAskDto);
        }catch (Exception e){
            System.out.println("[ERROR]: Rp_Comment_Insert");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public int Rp_Status_Update(GameAskDto gameAskDto){
        int res = 0;

        try{
            res = sqlSessionTemplate.update(NAMESPACE + "rpstatusupdate", gameAskDto);
        }catch (Exception e){
            System.out.println("[ERROR]: Rp_Status_Update");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public List<String> list_user_id(Map<String, Object> dblist){
        List<String> res = new ArrayList<String>();

        try{
            res = sqlSessionTemplate.selectList(NAMESPACE + "user_id", dblist);
        }catch (Exception e){
            System.out.println("[ERROR]: list_user_id");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public List<String> list_ask_status(Map<String, Object> dblist){
        List<String> res = new ArrayList<String>();

        try{
            res = sqlSessionTemplate.selectList(NAMESPACE + "ask_status", dblist);
        }catch (Exception e){
            System.out.println("[ERROR]: list_ask_status");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public List<Integer> list_ask_no(Map<String, Object> dblist){
        List<Integer> res = new ArrayList<Integer>();

        try{
            res = sqlSessionTemplate.selectList(NAMESPACE + "ask_no", dblist);
        }catch (Exception e){
            System.out.println("[ERROR]: list_ask_no");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public List<Integer> list_ask_gpno(Map<String, Object> dblist){
        List<Integer> res = new ArrayList<Integer>();

        try{
            res = sqlSessionTemplate.selectList(NAMESPACE + "ask_gpno", dblist);
        }catch (Exception e){
            System.out.println("[ERROR]: list_ask_gpno");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public List<Integer> list_ask_gpsq(Map<String, Object> dblist){
        List<Integer> res = new ArrayList<Integer>();

        try{
            res = sqlSessionTemplate.selectList(NAMESPACE + "ask_gpsq", dblist);
        }catch (Exception e){
            System.out.println("[ERROR]: list_ask_gpsq");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public int Comment_Delete(GameAskDto gameAskDto){
        int res = 0;

        try{
            res = sqlSessionTemplate.delete(NAMESPACE + "deletecomment", gameAskDto);
        }catch (Exception e){
            System.out.println("[ERROR]: Comment_Delete");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public int GameInsert(GameDto gameDto) {
        int res = 0;

        try {
            res = sqlSessionTemplate.insert(NAMESPACE + "gameinsert", gameDto);
        }catch (Exception e){
            System.out.println("[ERROR]: GameInsert");
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public int GameUpdate() {
        return 0;
    }

    @Override
    public int GameDelete() {
        return 0;
    }
}
