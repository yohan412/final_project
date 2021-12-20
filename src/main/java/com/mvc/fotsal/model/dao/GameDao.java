package com.mvc.fotsal.model.dao;

import com.mvc.fotsal.model.dto.GameDto;
import com.mvc.fotsal.model.dto.GamePaging;

import java.util.List;

public interface GameDao {
    String NAMESPACE = "GameBoard.";

    public List<GameDto> GameList(GamePaging gamePaging);
    public int listCount();
    public List<String> GameTime();
    public List<Integer> Ddaychk(GamePaging gamePaging);
    public List<Integer> GameMercenary(GamePaging gamePaging);
    public GameDto GameDetail(int game_no);
    public int DdayChk_per(int game_no);
    public String GameTime_per(int game_no);
    public int GameMercenary_per(int game_no);
    public int GameInsert(GameDto gameDto);
    public int GameUpdate();
    public int GameDelete();
}
