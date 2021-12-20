package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dto.GameDto;
import com.mvc.fotsal.model.dto.GamePaging;

import java.util.List;

public interface GameBiz {
    public List<GameDto> GameList(GamePaging gamePaging);
    public int listCount();
    public List<Integer> DdayChk(GamePaging gamePaging);
    public List<String> GameTime();
    public GameDto GameDetail(int game_no);
    public int DdayChk_per(int game_no);
    public String GameTime_per(int game_no);
    public int GameInsert(GameDto gameDto);
    public int GameUpdate();
    public int GameDelete();
}
