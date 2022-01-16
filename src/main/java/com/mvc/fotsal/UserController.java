package com.mvc.fotsal;

import java.sql.SQLException; 
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

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
    public String loginForm(Model model,HttpSession session) {
		logger.info("LOGIN PAGE");
		
        String naverAuthUrl = naverloginbo.getAuthorizationUrl(session);
        model.addAttribute("naverUrl", naverAuthUrl);
        
		return "loginform";
	}
	
	@RequestMapping("/provision1.do")
	public String provision1() {
		return "provision1";
	}
	
	@RequestMapping("/provision2.do")
	public String provision2() {
		return "provision2";
	}
	
	@RequestMapping("/provision3.do")
	public String provision3() {
		return "provision3";
	}
	
	@RequestMapping("/provision4.do")
	public String provision4() {
		return "provision4";
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
		dto.setUser_addr(addr1+","+addr2);
		

		if(dto.getUser_conchk()==null) {
			String conchk="";
			dto.setUser_conchk(conchk);
		}
		
		
		if(biz.insert(dto)>0) {
			return "redirect:loginform.do";
		}else{
			if(dto.getUser_conchk()!=null) {
				return "redirect:kakaoLogin.do";
			}
			
			return "redirect:registerform.do";
		}
	}
	
	//네이버 회원가입
		@RequestMapping("/register2.do")
		public String userInsert(UserDto dto,@RequestParam("myaddr1") String addr1,
				@RequestParam("myaddr2") String addr2) {
			
			dto.setUser_phone(dto.getUser_phone().replace("-", ""));
			dto.setUser_pw(passwordEncoder.encode(dto.getUser_pw()));
			dto.setUser_addr(addr1+","+addr2);
			String conchk="NAVER";
			dto.setUser_conchk(conchk);
			
			if(biz.insert(dto)>0) {
				return "redirect:loginform.do";
			}else {
				return "redirect:userNaverLoginPro.do";
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
    	
    	UserDto dto = biz.selectOne(user_id);
    	System.out.println(dto.getUser_addr());
    	String[] addr = dto.getUser_addr().split(",");
    	model.addAttribute("myaddr1", addr[0]);
    	model.addAttribute("myaddr2", addr[1]);
    	
    	model.addAttribute("login", dto);
    	
    	return "user_update";
    }
    
    //사용자 정보 업데이트
    @RequestMapping("/updateres.do")
    public String updateRes(UserDto dto, @RequestParam("myaddr1") String addr1, @RequestParam("myaddr2") String addr2) {
    	logger.info("UPDATE RES");
    	dto.setUser_addr(addr1+","+addr2);
    	
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
    public String delete(String user_id, HttpSession session) {
    	logger.info("DELETE");
    	int res = biz.delete(user_id);
    	if(res>0) {
    		logger.info("회원정보 삭제 완료");
    		session.removeAttribute(user_id);
    		session.invalidate();
    		return "redirect:index.jsp";
    	} else {
    		logger.info("회원정보 삭제 실패");
    		return "redirect:user_info.do?user_id="+user_id;
    	}
    }
    
    //네이버 로그인api
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
		
		System.out.println(apiJson);
		
		Map<String, Object> naverConnectionCheck = biz.naverConnectionCheck(apiJson);
		
		if(naverConnectionCheck == null) { //일치하는 이메일 없으면 가입
			
			model.addAttribute("user_email",apiJson.get("email"));
			model.addAttribute("user_id",apiJson.get("nickname"));
			model.addAttribute("user_pw",apiJson.get("id"));
			model.addAttribute("user_phone",apiJson.get("mobile"));
			model.addAttribute("user_gender",apiJson.get("gender"));
			model.addAttribute("user_name",apiJson.get("name"));
			model.addAttribute("user_birthdate",apiJson.get("birthyear")+"-"+apiJson.get("birthday"));
			return "setNaverRegister";
		}else if(naverConnectionCheck.get("USER_CONCHK") == null && naverConnectionCheck.get("USER_EMAIL") != null) { //이메일 가입 되어있고 네이버 연동 안되어 있을시
			biz.setNaverConnection(apiJson);
			UserDto dto = biz.userNaverLoginPro(apiJson);
			session.setAttribute("login", dto);
		}else if(naverConnectionCheck.get("USER_CONCHK")=="KAKAO" && naverConnectionCheck.get("USER_EMAIL") != null) {
			JOptionPane.showMessageDialog(null, "이미 카카오 아이디로 가입되어있습니다");
			return "redirect:loginform.do";
		}else { //모두 연동 되어있을시
			UserDto dto = biz.userNaverLoginPro(apiJson);
			session.setAttribute("login", dto);
		}

        return "redirect:index.jsp";
    }
    
    //카카오 로그인 API
    @RequestMapping(value="kakaoLogin.do")
    public String kakaoLogin(Model model, @RequestParam("code") String code, HttpSession session) {
    	System.out.println("kakaoLogin");	
        String access_Token = kakao.getAccessToken(code);
        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);
        
        Map<String, Object> loginApi = (Map<String, Object>) userInfo;
        
        
        if(loginApi.get("gender").equals("male")) {
        	loginApi.replace("gender", "M");
        }else {
            loginApi.replace("gender", "F");
        }
        
        System.out.println(loginApi);
        
        Map<String, Object> kakaoConnectionCheck = biz.kakaoConnectionCheck(loginApi);
        
        
        
        if(kakaoConnectionCheck == null) { //일치하는 이메일 없으면 가입
        	
        	model.addAttribute("user_id",loginApi.get("nickname"));
        	model.addAttribute("user_pw",loginApi.get("nickname"));
        	model.addAttribute("user_email",loginApi.get("email"));
        	model.addAttribute("user_nickname",loginApi.get("nickname"));
        	model.addAttribute("user_gender",loginApi.get("gender"));
        	return "setKakaoRegister";
        } else if(kakaoConnectionCheck.get("USER_CONCHK") == null && kakaoConnectionCheck.get("USER_EMAIL") != null) { //이메일 가입 되어있고 카카오 연동 안되어 있을시
        	biz.setKakaoConnection(loginApi);
        	UserDto dto = biz.userKakaoLoginPro(loginApi);
        	session.setAttribute("login", dto);
        }else if(kakaoConnectionCheck.get("USER_CONCHK") == "NAVER" && kakaoConnectionCheck.get("USER_EMAIL") != null) {
			JOptionPane.showMessageDialog(null, "이미 카카오 아이디로 가입되어있습니다");
			return "redirect:loginform.do";
		} else { //모두 연동 되어있을시
        	UserDto dto = biz.userKakaoLoginPro(loginApi);
        	session.setAttribute("login", dto);
        }
        
        return "redirect:index.jsp";
    }
    
    //카카오 로그아웃
    @RequestMapping(value="/logout")
    public String kakaoLogout(HttpSession session) {
    	System.out.println("kakao Logout");
        kakao.kakaoLogout((String)session.getAttribute("access_Token"));
        session.removeAttribute("access_Token");
        session.removeAttribute("userId");
        return "redirect:loginform.do";
    }

    //관리자 페이지
    @RequestMapping("/admin.do")
	public String memberList(Model model) {
		logger.info("MEMBER LIST");
		model.addAttribute("list", biz.selectList());
		return "adminmain";
	}
    
    //관리자 회원정보 상세보기
    @RequestMapping("/admindetail.do")
    public String detail(Model model, String user_id) {
    	logger.info("ASELECT ONE");
    	model.addAttribute("aDto", biz.aselectOne(user_id));
    	
    	return "admindetail";
    }
    
    //관리자 회원정보 수정
    @RequestMapping("/aupdateform.do")
    public String update(Model model, String user_id) {
    	logger.info("AUPDATE FORM");
    	
    	UserDto dto = biz.BselectOne(user_id);
    	System.out.println(dto.getUser_addr());
    	String[] addr = dto.getUser_addr().split(",");
    	model.addAttribute("myaddr3", addr[0]);
    	model.addAttribute("myaddr4", addr[1]);
    	
    	model.addAttribute("aDto", dto);
    	
    	return "adminupdate";
    }
    
    //관리자 회원정보 업데이트
    @RequestMapping("/aupdateres.do")
    public String aupdateRes(UserDto dto, @RequestParam("myaddr3") String addr3, @RequestParam("myaddr4") String addr4) {
    	logger.info("AUPDATE RES");
    	dto.setUser_addr(addr3+","+addr4);
    	System.out.println("등급: " + dto.getUser_role());
    	
    	int res = biz.Bupdate(dto);
    	if(res>0) {
    		return "redirect:admindetail.do?user_id="+dto.getUser_id();
    	} else {
    		return "redirect:aupdateform.do?user_id="+dto.getUser_id();
    	}

    }
    
    //관리자 회원 탈퇴
    @RequestMapping("/adelete.do")
    public String adelete(String user_id) {
    	logger.info("ADELETE");
    	
    	int res = biz.Bdelete(user_id);
    	if(res>0) {
    		logger.info("회원정보 삭제 완료");
    		return "redirect:admin.do";
    	} else {
    		logger.info("회원정보 삭제 실패");
    		return "redirect:user_info.do?user_id="+user_id;
    	}
    }
    
    
}
    
