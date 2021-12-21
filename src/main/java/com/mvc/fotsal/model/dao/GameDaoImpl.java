package com.mvc.fotsal.model.dao;

import com.mvc.fotsal.model.dto.GameDto;
import com.mvc.fotsal.model.dto.GamePaging;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

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
