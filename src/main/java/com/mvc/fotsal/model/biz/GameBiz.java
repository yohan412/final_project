package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dto.GameDto;
import com.mvc.fotsal.model.dto.GamePaging;

import java.util.List;

public interface GameBiz {
    public List<GameDto> GameList(GamePaging gamePaging);
    public int listCount();
    public List<Integer> DdayChk(GamePaging gamePaging);
    public GameDto GameDetail(int game_no);
    public int Gameinsert();
    public int GameUpdate();
    public int GameDelete();
}
