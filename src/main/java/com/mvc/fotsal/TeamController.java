package com.mvc.fotsal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.fotsal.model.biz.TeamBiz;

@Controller
public class TeamController {
	private static final Logger logger = LoggerFactory.getLogger(TeamController.class);

	@Autowired
	private TeamBiz biz;
	
	@RequestMapping("/teamlist.do")
	public String teamList(Model model) { // 팀 게시판(리스트)
		logger.info("Select Team List, move page teamboard.jsp");
		model.addAttribute("list",biz.selectList());
		
		return "teamboard";
	}
	
	@RequestMapping("/team_detail.do")
	public String detail(Model model, int team_no) { // 팀 자세히보기
		logger.info("move page team_detail.jsp");
		model.addAttribute("dto", biz.selectOne(team_no));
		
		return "team_detail";
	}
	
	@RequestMapping("/team.do")
	public String insertForm() { // 팀 등록 페이지
		logger.info("insert form to team.jsp");
		
		return "team";
	}

}
