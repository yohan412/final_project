package com.mvc.fotsal;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.fotsal.model.biz.UserBiz;
import com.mvc.fotsal.model.dto.UserDto;

@Controller
public class UserController {

	private Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserBiz biz;
	
	@RequestMapping("/loginform.do")
	public String loginForm() {
		logger.info("LOGIN PAGE");
		
		return "loginform";
	}
	
	//로그인
	@RequestMapping(value="/ajaxlogin.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> ajaxLogin(HttpSession session, @RequestBody UserDto dto) {
		logger.info("LOGIN");
		
		UserDto res = biz.login(dto);
		
		boolean check = false;
		if(res != null) {
			session.setAttribute("login", res);
			check=true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
		return map;
	}
	
	//로그아웃
	@RequestMapping(value="/logout", method = RequestMethod.POST)
	public String logout(HttpSession session) {
		session.invalidate();
		logger.info("Logout success");
		
		return "redirect:/";
	}
	
	@RequestMapping("/registerform.do")
	public String registerForm() {
		logger.info("REGISTER FORM");
		
		return "registerform";
	}
	
	//회원가입
	@RequestMapping("/register.do")
	public String userInsert(UserDto dto) {
		
		if(biz.insert(dto)>0) {
			return "redirect:loginform.do";
		}else {
			return "redirect:registerform.do";
		}
	}
	
	@RequestMapping("/idChk.do")
	public String idChk(String myid) {
		logger.info("ID CHECK");
		
		int res=biz.idChk(myid);
		
		boolean idnotused=true;
        
        //중복되는 경우가 있을경우
        if(res>0){ 
           idnotused=false;
        }
		
		return "idChk";
	}
	
	
}
