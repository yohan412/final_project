package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dto.GameAskDto;
import com.mvc.fotsal.model.dto.GameDto;
import com.mvc.fotsal.paging.GameAskPaging;
import com.mvc.fotsal.paging.GamePaging;

import java.util.List;
import java.util.Map;

public interface GameBiz {
    public List<GameDto> GameList(GamePaging gamePaging);
    public int listCount();
    public List<String> GameTime();
    public List<Integer> DdayChk(GamePaging gamePaging);
    public List<Integer> GameMercenary(GamePaging gamePaging);
    public GameDto GameDetail(int game_no);
    public int DdayChk_per(int game_no);
    public String GameTime_per(int game_no);
    public int GameMercenary_per(int game_no);
    public List<GameAskDto> CommentList(Map<String, Object> dblist);
    public int CommentInsert(GameAskDto gameAskDto);
    public int GameInsert(GameDto gameDto);
    public int GameUpdate();
    public int GameDelete();
}
