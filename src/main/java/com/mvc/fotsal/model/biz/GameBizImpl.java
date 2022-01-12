package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dao.GameDao;
import com.mvc.fotsal.model.dto.GameAskDto;
import com.mvc.fotsal.model.dto.GameDto;
import com.mvc.fotsal.model.dto.MercenaryDto;
import com.mvc.fotsal.model.dto.UserDto;
import com.mvc.fotsal.paging.GameAskPaging;
import com.mvc.fotsal.paging.GamePaging;
import com.mvc.fotsal.paging.GameSearch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class GameBizImpl implements GameBiz{
    @Autowired
    private GameDao gameDao;

    @Override
    public List<GameDto> GameList(GameSearch gameSearch) {
        return gameDao.GameList(gameSearch);
    }

    @Override
    public int listCount(GameSearch gameSearch) {
        return gameDao.listCount(gameSearch);
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
    public int CommentListCount(int game_no){
        return gameDao.CommentListCount(game_no);
    }

    @Override
    public int CommentInsert(GameAskDto gameAskDto){
        return gameDao.CommentInsert(gameAskDto);
    }

    @Override
    public int Rp_Comment_Insert(GameAskDto gameAskDto){
        return gameDao.Rp_Comment_Insert(gameAskDto);
    }

    @Override
    public int Rp_Status_Update(GameAskDto gameAskDto){
        return gameDao.Rp_Status_Update(gameAskDto);
    }

    @Override
    public List<String> list_user_id(Map<String, Object> dblist){
        return gameDao.list_user_id(dblist);
    }

    @Override
    public List<String> list_ask_status(Map<String, Object> dblist){
        return gameDao.list_ask_status(dblist);
    }

    @Override
    public List<Integer> list_ask_no(Map<String, Object> dblist){
        return gameDao.list_ask_no(dblist);
    }

    @Override
    public List<Integer> list_ask_gpno(Map<String, Object> dblist){
        return gameDao.list_ask_gpno(dblist);
    }

    @Override
    public List<Integer> list_ask_gpsq(Map<String, Object> dblist){
        return gameDao.list_ask_gpsq(dblist);
    }

    @Override
    public int Comment_Delete(GameAskDto gameAskDto){
        return gameDao.Comment_Delete(gameAskDto);
    }

    @Override
    public int GameInsert(GameDto gameDto) {
        return gameDao.GameInsert(gameDto);
    }

    @Override
    public int GameUpdate(GameDto gameDto) {
        return gameDao.GameUpdate(gameDto);
    }

    @Override
    public int GameDelete(int game_no) {
        return gameDao.GameDelete(game_no);
    }

    @Override
    public String FindPhone(String user_id){
        return gameDao.FindPhone(user_id);
    }

	@Override
	public int ApplyInsert(int user_no, int game_no) {
		
		return gameDao.ApplyInsert(user_no, game_no);
	}

	@Override
	public List<MercenaryDto> mDto(int game_no) {
		return gameDao.ApplyList(game_no);
	}

    @Override
    public UserDto selectinfo(String user_id) {
        return gameDao.selectinfo(user_id);
    }

	@Override
	public List<GameDto> getGameList() {
		return gameDao.getGameList();
	}
}
