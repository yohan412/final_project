package com.mvc.fotsal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.fotsal.model.biz.FaqBoardBiz;


@Controller
public class FaqBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(FaqBoardController.class);
	
	@Autowired
	private FaqBoardBiz biz;
	
	@RequestMapping("/faqlist.do")
	public String list(Model model) {	
		logger.info("Select FaqBoard List, move page faqboard.jsp");
		model.addAttribute("list",biz.selectList());
		return "faqboard";
	}
	
}
