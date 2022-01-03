package com.mvc.fotsal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.fotsal.model.biz.QnaBoardBiz;
import com.mvc.fotsal.model.dto.QnaBoardDto;
import com.mvc.fotsal.model.dto.TeamDto;
import com.mvc.fotsal.model.dto.UserDto;

@Controller
public class QnaBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnaBoardController.class);
	
	@Autowired
	private QnaBoardBiz biz;
	
	@RequestMapping("/qnalist.do")
	public String list(Model model) {	// qnaboard
		logger.info("Select QnaBoard List, move page qnaboard.jsp");
		model.addAttribute("list",biz.selectList());
		return "qnaboard";

	}

	@RequestMapping("/qnadetail.do")
	public String detail(Model model, int qna_no) {
		logger.info("SELECT ONE");
		model.addAttribute("dto", biz.selectOne(qna_no));
		System.out.println(qna_no);
		
		return "qnadetail";
	}
	
	@RequestMapping("/qna.do")
	public String qna() {
		
		return "qnainsert";
	}
	
	@RequestMapping("/qnainsert.do")
	public String insert(QnaBoardDto dto, HttpServletRequest request) {
		UserDto user = (UserDto) request.getSession().getAttribute("login");
		logger.info("INSERT QNA");
		dto.setUser_id(user.getUser_id());
		int res = biz.insert(dto);
		
		System.out.println(dto.getQna_type());
		System.out.println(dto.getQna_title());
		System.out.println(dto.getQna_content());
		System.out.println(dto.getQna_reg());
		System.out.println(dto.getQna_gpno());
		System.out.println(dto.getQna_gpsq());
		System.out.println(dto.getQna_no());
		
		
		if(res>0) {
			logger.info("QNA INSERT 성공");
			return "redirect:qnalist.do";
		} else {
			logger.info("QNA INSERT 실패");
			return "redirect:qna.do";
		}
	}
	
	@RequestMapping("/qnaupdateForm.do")
	public String updateForm(Model model, int qna_no) {
		logger.info("UPDATE FORM");

		
		model.addAttribute("dto", biz.selectOne(qna_no));
		
		return "qnaupdateForm";
	}
	
	@RequestMapping(value="/qnaupdateResult.do")
	public String updateRes(QnaBoardDto dto) { // 팀 수정하기
		int res = biz.update(dto);

		if(res>0) {
			logger.info("qna 수정완료");
			return "redirect:qnadetail.do?qna_no="+dto.getQna_no();
		}else {
			logger.info("qna 수정실패");
			return "redirect:qnaupdateForm.do?qna_no="+dto.getQna_no();
		}
		
	}
	
	@RequestMapping("/delete.do")
	public String delete(int qna_no) {
		logger.info("DELETE");
		
		int res = biz.delete(qna_no);
		if(res>0) {
			return "redirect:qnalist.do";
		}else {
			return "redirect:qnadetail.do?qna_no"+qna_no;
		}
		
	}
	

}
