package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dao.GameDao;
import com.mvc.fotsal.model.dto.GameDto;
import com.mvc.fotsal.model.dto.GamePaging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public GameDto GameDetail(int game_no) {
        return gameDao.GameDetail(game_no);
    }

    @Override
    public int Gameinsert() {
        return gameDao.Gameinsert();
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
