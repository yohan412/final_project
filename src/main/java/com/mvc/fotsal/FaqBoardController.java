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
	public String list(Model model, @ModelAttribute("STLP") FaqSearch STLP, HttpServletRequest request) {	
		logger.info("Select FaqBoard List, move page faqboard.jsp");
		model.addAttribute("list",biz.selectList(STLP));
		
		FaqpageMaker pageMaker = new FaqpageMaker();
		pageMaker.setTLP(STLP);
		pageMaker.setTotalCount(biz.listCount(STLP));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("page", request.getParameter("page"));
		
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
	
	@RequestMapping(value="/faqupdateForm.do")
	public String updateForm(Model model, int faq_no) {
		logger.info("UPDATE FORM");
		System.out.println(faq_no);
		model.addAttribute("dto", biz.selectOne(faq_no));
		
		return "faqupdateForm";
	}
	
	@RequestMapping(value="/faqupdateResult.do")
	public String updateRes(FaqBoardDto dto) {
		int res = biz.update(dto);
		
		if(res>0) {
			logger.info("faq 수정");
			return "redirect:faqdetail.do?faq_no="+dto.getFaq_no();
		}else {
			logger.info("faq 수정실패");
			return "redirect:faqupdateForm.do?faq_no="+dto.getFaq_no();
		}
	}
	
	@RequestMapping("/faqdelete.do")
	public String delete(int faq_no) {
		logger.info("DELETE");
		
		int res = biz.delete(faq_no);
		System.out.println(faq_no);
		if(res>0) {
			return "redirect:faqlist.do";
		}else {
			return "redirect:faqdetail.do?faq_no"+faq_no;
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
