package com.mvc.fotsal;

import java.sql.SQLException; 
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
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

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.mvc.fotsal.KakaoLogin.KakaoAPI;
import com.mvc.fotsal.NaverLogin.NaverLoginBO;
import com.mvc.fotsal.message.messageApp;
import com.mvc.fotsal.model.biz.UserBiz;
import com.mvc.fotsal.model.dto.UserDto;

@Controller
public class UserController {

	private Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserBiz biz;
	
	@Autowired
    private KakaoAPI kakao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("/loginform.do") // 로그인페이지 이동
	public String loginForm() {
		logger.info("LOGIN PAGE");
		
		return "loginform";
	}
	
	@Autowired
	private NaverLoginBO naverloginbo;
	
	//로그인
	@RequestMapping(value="/ajaxlogin.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> ajaxLogin(HttpSession session, @RequestBody UserDto dto) {
		logger.info("LOGIN");
		
		UserDto res = biz.login(dto);
		
		boolean check = false;
		if(res != null) {
			if(passwordEncoder.matches(dto.getUser_pw(),res.getUser_pw())) {
				session.setAttribute("login", res);
				 check=true;
			}
		} 
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
		return map;
	}
	
	//로그아웃
	@RequestMapping(value="/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("Logout success");
		session.invalidate();
		
		return "redirect:/index.jsp";
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
		
		System.out.println(dto.getUser_pw());
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
	
	@RequestMapping("/phonechk.do")
	@ResponseBody
	public String phoneChk(@RequestParam("user_phone")String user_phone) {
		logger.info("PHONE CHECK :"+user_phone);
		
		String ran = messageApp.sendsms(user_phone);
		
		return ran;
	}
	 
	@RequestMapping("/find_id_form.do")
	public String find_id_form() {
		logger.info("FIND ID FORM");
		
		return "find_id_form";
	}
	
	@RequestMapping("/find_id.do")
	public String find_id(UserDto dto,@RequestParam("mybirthyy") String yy,
								@RequestParam("mybirthmm") String mm,
								@RequestParam("mybirthdd") String dd,Model model) {
		
		logger.info("FIND ID");
		dto.setUser_birthdate(yy+"-"+mm+"-"+dd);
		
		UserDto res = biz.findId(dto);
		
		logger.info(res.getUser_id());
		model.addAttribute("user_id",res.getUser_id());
		
		return "find_id";
	}
	
	@RequestMapping("/change_pw_form.do")
	public String change_pw_form() {
		logger.info("CHANGE PW FORM");
		
		return "change_pw_form";
	}
	
	@RequestMapping("/change_pw.do")
	public String change_pw(UserDto dto,@RequestParam("mybirthyy") String yy,
									@RequestParam("mybirthmm") String mm,
									@RequestParam("mybirthdd") String dd,Model model) {
		logger.info("CHANGE PW");
		
		dto.setUser_birthdate(yy+"-"+mm+"-"+dd);
		int res=biz.changePw(dto);
		
		if(res>0) {
			model.addAttribute("user_id",dto.getUser_id());
			return "change_pw_input";
		}else {
			return "redirect:change_pw_form.do";
		}
		
	}
	
	@RequestMapping("/change_pw_input.do")
	public String chage_pw_input(UserDto dto,Model model) {
		logger.info("CHANGE_PW_INPUT");
		
		dto.setUser_pw(passwordEncoder.encode(dto.getUser_pw()));
		int res = biz.changePwInput(dto);
		
		if(res>0) {
			return "redirect:loginform.do";
		}else {
			model.addAttribute("user_id",dto.getUser_id());
			return "change_pw_input";
		}
	}
	
	//사용자 정보 상세조회
    @RequestMapping("/user_info.do")
    public String mypage(Model model, String user_id) {
        logger.info("USER_INFO");
        model.addAttribute("login", biz.selectOne(user_id));
        
        return "user_info";
    }
    
    //사용자 정보 수정페이지
    @RequestMapping("/updateform.do")
    public String user_update(Model model, String user_id) {
    	logger.info("UPDATE FORM");
    	
    	model.addAttribute("login", biz.selectOne(user_id));
    	return "user_update";
    }
    
    //사용자 정보 업데이트
    @RequestMapping("/updateres.do")
    public String updateRes(UserDto dto) {
    	logger.info("UPDATE RES");
    	
    	int res = biz.update(dto);
    	if(res>0) {
			logger.info("사용자정보 수정완료");
    		return "redirect:user_info.do?user_id="+dto.getUser_id();
    	} else {
			logger.info("사용자정보 수정실패");
    		return "redirect:updateform.do?user_id="+dto.getUser_id();
    	}
    	
    }

    //사용자 정보 삭제
    @RequestMapping("user_delete.do")
    public String delete(String user_id) {
    	logger.info("DELETE");
    	
    	int res = biz.delete(user_id);
    	if(res>0) {
    		logger.info("회원정보 삭제 완료");
    		return "redirect:loginform.do";
    	} else {
    		logger.info("회원정보 삭제 실패");
    		return "redirect:user_info.do?user_id="+user_id;
    	}
    }
    
    
    @RequestMapping(value="/userNaverLoginPro.do",  method = {RequestMethod.GET,RequestMethod.POST})
	public String userNaverLoginPro(Model model,@RequestParam Map<String,Object> paramMap, @RequestParam String code, @RequestParam String state,HttpSession session) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();

		OAuth2AccessToken oauthToken;
		oauthToken = naverloginbo.getAccessToken(session, code, state);
		//로그인 사용자 정보를 읽어온다.
		String apiResult = naverloginbo.getUserProfile(oauthToken);
		System.out.println("apiResult =>"+apiResult);
		ObjectMapper objectMapper =new ObjectMapper();
		Map<String, Object> apiJson = (Map<String, Object>) objectMapper.readValue(apiResult, Map.class).get("response");
		
		Map<String, Object> naverConnectionCheck = biz.naverConnectionCheck(apiJson);
		
		if(naverConnectionCheck == null) { //일치하는 이메일 없으면 가입
			
			model.addAttribute("user_email",apiJson.get("email"));
			model.addAttribute("user_id",apiJson.get("id"));
			model.addAttribute("user_pw",apiJson.get("id"));
			model.addAttribute("user_phone",apiJson.get("mobile"));
			model.addAttribute("user_gender",apiJson.get("gender"));
			model.addAttribute("user_name",apiJson.get("name"));
			model.addAttribute("user_birthdate",apiJson.get("birthyear")+"-"+apiJson.get("birthday"));
			return "user/setNaverRegister";
		}else if(naverConnectionCheck.get("USER_CONCHK") == null && naverConnectionCheck.get("USER_EMAIL") != null) { //이메일 가입 되어있고 네이버 연동 안되어 있을시
			biz.setNaverConnection(apiJson);
			Map<String, Object> loginCheck = biz.userNaverLoginPro(apiJson);
			session.setAttribute("userInfo", loginCheck);
		}else { //모두 연동 되어있을시
			Map<String, Object> loginCheck = biz.userNaverLoginPro(apiJson);
			session.setAttribute("userInfo", loginCheck);
		}

		return "redirect:usermain.do";
	}
    
    //카카오 로그인 API
    @RequestMapping(value="kakaoLogin.do")
    public String login(@RequestParam("code") String code, HttpSession session) {
    	System.out.println("kakaoLogin");	
        String access_Token = kakao.getAccessToken(code);
        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);
        
        //클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            session.setAttribute("userId", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
        }
        return "index";
    }



    
    
    
    
    
    
    
}
    
