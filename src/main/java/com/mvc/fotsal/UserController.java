package com.mvc.fotsal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.fotsal.model.biz.UserBiz;

@Controller
public class UserController {

	private Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserBiz biz;
	
	@RequestMapping("/loginform.do")
	public String loginForm() {
		
		return "mvclogin";
	}
	
	
	
}
