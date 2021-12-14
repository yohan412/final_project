package com.mvc.fotsal.model.dao;

import com.mvc.fotsal.model.dto.GameDto;
import com.mvc.fotsal.model.dto.GamePaging;

import java.util.List;

public interface GameDao {
    String NAMESPACE = "GameBoard.";

    public List<GameDto> GameList(GamePaging gamePaging);
    public int listCount();
    public List<GameDto> Ddaychk(GamePaging gamePaging);
    public GameDto GameDetail(int game_no);
    public int Gameinsert();
    public int GameUpdate();
    public int GameDelete();
}
