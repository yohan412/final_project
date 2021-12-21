package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dao.GameDao;
import com.mvc.fotsal.model.dto.GameAskDto;
import com.mvc.fotsal.model.dto.GameDto;
import com.mvc.fotsal.paging.GameAskPaging;
import com.mvc.fotsal.paging.GamePaging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class GameBizImpl implements GameBiz{
    @Autowired
    private GameDao gameDao;

    @Override
    public List<GameDto> GameList(GamePaging gamePaging) {

        return gameDao.GameList(gamePaging);
    }

    @Override
    public int listCount() {

        return gameDao.listCount();
    }

    @Override
    public List<Integer> DdayChk(GamePaging gamePaging){

        return gameDao.Ddaychk(gamePaging);
    }

    @Override
    public List<String> GameTime(){

        return gameDao.GameTime();
    }

    @Override
    public List<Integer> GameMercenary(GamePaging gamePaging){

        return gameDao.GameMercenary(gamePaging);
    }

    @Override
    public GameDto GameDetail(int game_no) {
        return gameDao.GameDetail(game_no);
    }

    @Override
    public int DdayChk_per(int game_no) {
        return gameDao.DdayChk_per(game_no);
    }

    @Override
    public String GameTime_per(int game_no){
        return gameDao.GameTime_per(game_no);
    }

    @Override
    public int GameMercenary_per(int game_no){
        return gameDao.GameMercenary_per(game_no);
    }

    @Override
    public List<GameAskDto> CommentList(Map<String, Object> dblist){
        return gameDao.CommentList(dblist);
    }

    @Override
    public int CommentInsert(GameAskDto gameAskDto){
        return gameDao.CommentInsert(gameAskDto);
    }

    @Override
    public int GameInsert(GameDto gameDto) {
        return gameDao.GameInsert(gameDto);
    }

    @Override
    public int GameUpdate() {
        return gameDao.GameUpdate();
    }

    @Override
    public int GameDelete() {
        return gameDao.GameDelete();
    }
}
