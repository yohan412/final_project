package com.mvc.fotsal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.fotsal.model.biz.QnaBoardBiz;

@Controller
public class QnaBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnaBoardController.class);
	
	@Autowired
	private QnaBoardBiz biz;
	
	@RequestMapping("/qnalist.do")
	public String list(Model model) {	// qnaboard 게시판 리스트
		logger.info("Select QnaBoard List, move page qnaboard.jsp");
		model.addAttribute("list",biz.selectList());
		return "qnaboard";
	}
	
}
