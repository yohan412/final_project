package com.mvc.fotsal;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.fotsal.message.messageApp;
import com.mvc.fotsal.model.biz.UserBiz;
import com.mvc.fotsal.model.dto.UserDto;

@Controller
public class UserController {

	private Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserBiz biz;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
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
			if(passwordEncoder.matches(dto.getUser_pw(), res.getUser_pw())) {
				 session.setAttribute("login", res);
				 check=true;
			 }
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
	public String userInsert(UserDto dto,@RequestParam("mybirthyy") String yy,
									@RequestParam("mybirthmm") String mm,
									@RequestParam("mybirthdd") String dd,
									@RequestParam("myaddr1") String addr1,
									@RequestParam("myaddr2") String addr2) {
		
		dto.setUser_pw(passwordEncoder.encode(dto.getUser_pw()));
		dto.setUser_birthdate(yy+"-"+mm+"-"+dd);
		dto.setUser_addr(addr1+" "+addr2);
		
		
		if(biz.insert(dto)>0) {
			return "redirect:loginform.do";
		}else {
			return "redirect:registerform.do";
		}
	}
	

	@RequestMapping("/idChk.do")
	public String idChk(Model model,String user_id) {
		logger.info("ID CHECK");
		
		int res=biz.idChk(user_id);
		
		boolean idnotused=true;
        
        //중복되는 경우가 있을경우
        if(res>0){ 
           idnotused=false;
        }
        
        model.addAttribute("idnotused",idnotused);
		
		return "idChk";
	}
	
	@RequestMapping("/phonechk")
	public String phoneChk(String user_phone) {
		logger.info("PHONE CHECK");
		
		String ran = messageApp.sendsms(user_phone);
		
		
		
		return null;
	}
	
}
