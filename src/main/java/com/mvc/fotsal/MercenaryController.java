package com.mvc.fotsal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mvc.fotsal.model.biz.MercenaryBiz;
import com.mvc.fotsal.model.dto.MercenaryDto;

@Controller
public class MercenaryController {
	
	private static final Logger logger = LoggerFactory.getLogger(MercenaryController.class);
	
	@Autowired
	private MercenaryBiz biz;
	
	@RequestMapping(value="/mercenary.do") //용병 지원 페이지
	public String mercenary() {
		logger.info("move page mercenary.jsp");
		return "mercenary";
	}
	
	@RequestMapping(value="/mercenaryList.do")
	public String mList(Model model,MercenaryDto mDto) {
		logger.info("Select Mercenary List, move page gamedetail.jsp");
		
		model.addAttribute("mList",biz.selectList(mDto));
		
		return "gamedetail";
	}
	
	
	@RequestMapping(value="/mercenaryInsert.do")
	public String mercenary_insert(MercenaryDto dto) {
		logger.info("용병지원서 작성중");
		int res = biz.insert(dto);
		
		if(res>0) {
			logger.info("용병 지원서 작성완료");
			return "redirect:index.do";
		} else {
			logger.info("용병 지원서 작성실패");
			return "redirect:mercenary.do";
		}
		
	}
	
	@RequestMapping(value="/mercenary_detail.do") // 용병 지원 자세히보기
	public String mercenaryDetail(Model model,@RequestParam("user_no")int user_no) {
		logger.info("move page mercenary_detail.jsp");
		model.addAttribute("mDto", biz.selectOne(user_no));
		
		
		
		return "mercenary_detail";
	}
	
	@RequestMapping(value="/mercenary_updateForm.do") // 용병지원서 수정
	public String mercenaryUpdate(Model model, int user_no) {
		logger.info("move page mercenary_updateForm.jsp");
		
		model.addAttribute("mDto", biz.selectOne(user_no));
		
		return "mercenary_updateForm";
	}
	
	@RequestMapping(value="/mercenary_updateResult.do")
	public String updateRes(MercenaryDto dto) { // 팀 수정하기
		
		int res = biz.update(dto);

		if(res>0) {
			logger.info("용병 지원서 수정완료");
			return "redirect:mercenary_detail.do?user_no="+dto.getUser_no();
		}else {
			logger.info("용병 지원서 수정실패");
			return "redirect:mercenary_updateForm.do?user_no"+dto.getUser_no();
		}
		
	}
	
	@RequestMapping(value="/mercenaryDelete.do")
	public String delete(int user_no, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		int res = biz.delete(user_no);
		
		if(res>0) {
		return "redirect:"+referer;
		}else {
			return "redirect:mercenaryDetail.do?user_no"+user_no;
		}
	}
	
	@RequestMapping(value="/referer.do") // 이전페이지 이동하기
	public String referer(HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		
		return "redirect:"+referer;
	}
	
	@RequestMapping(value="/index.do") // 메인페이지로 이동하기
	public String mainPage() {
		logger.info("move page index.jsp");
		return "index";
	}
}
