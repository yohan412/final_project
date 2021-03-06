package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dto.GameAskDto;
import com.mvc.fotsal.model.dto.GameDto;
import com.mvc.fotsal.model.dto.MercenaryDto;
import com.mvc.fotsal.model.dto.UserDto;
import com.mvc.fotsal.paging.GameAskPaging;
import com.mvc.fotsal.paging.GamePaging;
import com.mvc.fotsal.paging.GameSearch;

import java.util.List;
import java.util.Map;

public interface GameBiz {
    public List<GameDto> GameList(GameSearch gameSearch);
    public List<GameDto> getGameList();
    public int listCount(GameSearch gameSearch);
    public List<String> GameTime();
    public List<Integer> DdayChk(GamePaging gamePaging);
    public List<Integer> GameMercenary(GamePaging gamePaging);
    public GameDto GameDetail(int game_no);
    public int DdayChk_per(int game_no);
    public String GameTime_per(int game_no);
    public int GameMercenary_per(int game_no);
    public List<GameAskDto> CommentList(Map<String, Object> dblist);
    public int CommentListCount(int game_no);
    public int CommentInsert(GameAskDto gameAskDto);
    public int Rp_Comment_Insert(GameAskDto gameAskDto);
    public int Rp_Status_Update(GameAskDto gameAskDto);
    public List<String> list_user_id(Map<String, Object> dblist);
    public List<String> list_ask_status(Map<String, Object> dblist);
    public List<Integer> list_ask_no(Map<String, Object> dblist);
    public List<Integer> list_ask_gpno(Map<String, Object> dblist);
    public List<Integer> list_ask_gpsq(Map<String, Object> dblist);
    public int Comment_Delete(GameAskDto gameAskDto);
    public int GameInsert(GameDto gameDto);
    public int GameUpdate(GameDto gameDto);
    public int GameDelete(int game_no);
    public String FindPhone(String user_id);
    public int ApplyInsert(int user_no, int game_no);
    public List<MercenaryDto> mDto(int game_no);
    public UserDto selectinfo(String user_id);
}
