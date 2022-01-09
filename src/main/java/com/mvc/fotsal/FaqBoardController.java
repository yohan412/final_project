package com.mvc.fotsal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvc.fotsal.model.biz.FaqBoardBiz;
import com.mvc.fotsal.model.dto.FaqBoardDto;
import com.mvc.fotsal.model.dto.UserDto;
import com.mvc.fotsal.paging.FaqSearch;
import com.mvc.fotsal.paging.FaqpageMaker;


@Controller
public class FaqBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(FaqBoardController.class);
	
	@Autowired
	private FaqBoardBiz biz;
	
	@RequestMapping(value="/faqlist.do", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("STLP") FaqSearch STLP) {	
		logger.info("Select FaqBoard List, move page faqboard.jsp");
		model.addAttribute("list",biz.selectList(STLP));
		
		FaqpageMaker pageMaker = new FaqpageMaker();
		pageMaker.setTLP(STLP);
		pageMaker.setTotalCount(biz.listCount(STLP));
		
		model.addAttribute("pageMaker", pageMaker);
		
		System.out.println(STLP.toString());
		
		return "faqboard";
	}
	
	@RequestMapping("/faqdetail.do")
	public String detail(Model model, int faq_no) {
		logger.info("SELECT ONE");
		
		model.addAttribute("faq_dto", biz.selectOne(faq_no));
		
		return "faqdetail";
	}
	
	@RequestMapping("/faq.do")
	public String faq() {
		return "faqinsert";
	}
	
	@RequestMapping("faqinsert.do")
	public String insert(FaqBoardDto dto, HttpServletRequest request) {
		UserDto user = (UserDto) request.getSession().getAttribute("login");
		logger.info("INSERT FAQ");
		dto.setUser_id(user.getUser_id());
		
		int res = biz.insert(dto);
		
		if(res>0) {
			logger.info("FAQ INSERT 성공");
			 return "redirect:faqlist.do";
		}else {
			logger.info("FAQ INSERT 실패");
			return "redirect:faq.do";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
