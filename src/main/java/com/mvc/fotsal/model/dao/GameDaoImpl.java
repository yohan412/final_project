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
    public int Gameinsert() {
        return 0;
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
