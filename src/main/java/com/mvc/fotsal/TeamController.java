package com.mvc.fotsal;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mvc.fotsal.message.messageApp;
import com.mvc.fotsal.model.biz.MercenaryBiz;
import com.mvc.fotsal.model.biz.TeamBiz;
import com.mvc.fotsal.model.dto.PicDto;
import com.mvc.fotsal.model.dto.TeamDto;
import com.mvc.fotsal.model.dto.UserDto;
import com.mvc.fotsal.paging.TeamPageMaker;
import com.mvc.fotsal.paging.TeamSearch;

@Controller
public class TeamController {
	private static final Logger logger = LoggerFactory.getLogger(TeamController.class);

	@Autowired
	private TeamBiz biz;
	
	@Autowired
	private MercenaryBiz mBiz;
	
	@RequestMapping(value="/team.do")
	public String insertForm() { // 팀 등록 페이지
		logger.info("move page team.jsp");
		
		return "team";
	}
	
	@RequestMapping(value="/team_inviteMsg.do")
	@ResponseBody
	public void team_inviteMsg(Model model,@RequestParam("user_phone")String user_phone, @RequestParam("user_no")int user_no, @RequestParam("team_no")int team_no, @RequestParam("user_name")String user_name) {
		logger.info("문자 user phone : "+user_phone);
		logger.info("문자 user_no : "+ user_no);
		logger.info("문자 team_no : "+ team_no);
		logger.info("문자 user_name : "+ user_name);
		
		model.addAttribute("inviteMsg", biz.applyInsert(user_no, team_no));
		
		messageApp.team_inviteMsg(user_name, user_phone);
		
	}
	
	@RequestMapping(value="/send_invite.do")
	@ResponseBody
	public void send_invite(Model model, @RequestParam("user_id")String user_id, @RequestParam("writer_id")String writer_id) {
		UserDto applyer = biz.selectInfo(user_id); // 지원자
		UserDto writer = biz.selectInfo(writer_id); // 팀장
		System.out.println("지원자 phone: "+ applyer.getUser_phone());
		System.out.println("팀장 phone: "+ writer.getUser_phone());
		
		messageApp.send_invite(applyer.getUser_phone(), writer.getUser_phone());
	}
	
	@RequestMapping(value="/teamInsert.do")
	public String team_insert(MultipartHttpServletRequest mtf,TeamDto dto) {
		logger.info("팀 등록서 작성중");
		int res = biz.insert(dto);

		
		String uploadpath = mtf.getRealPath("resources\\upload"); //upload폴더에 실제 경로 설정
		System.out.println(uploadpath);
		
		if(res>0) {
			logger.info("팀 등록서 작성완료");
			
			//========================파일 업로드==============================
			logger.info("파일 업로드 작업중");
			
			
			List<MultipartFile> fileList = mtf.getFiles("upload_file");
			
			for (MultipartFile mf : fileList) {
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            long fileSize = mf.getSize(); // 파일 사이즈

	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);
	            
	            String FileName = System.currentTimeMillis() + originFileName;
	            String safeFile = uploadpath+"\\"+FileName;
	            System.out.println(dto.getUser_no()+dto.getTeam_name());
	            System.out.println(biz.findno(dto));
	            try {
	                mf.transferTo(new File(safeFile));
	                
	                PicDto pic = new PicDto(biz.findno(dto), originFileName, FileName);
	                
	                biz.teampic(pic);
	                
	            } catch (IllegalStateException e) {
	                e.printStackTrace();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
			//===============================================================
			
			return "redirect:teamlist.do";
		}else {
			logger.info("팀 등록서 작성실패");
			return "redirect:team.do";
		}
	}
	
	@RequestMapping(value="/teamlist.do", method = RequestMethod.GET)
	public String teamList(Model model, @ModelAttribute("STLP") TeamSearch STLP, HttpServletRequest request) { // 팀 게시판(리스트)
		logger.info("Select Team List, move page teamboard.jsp");
		
		model.addAttribute("list",biz.selectList(STLP));
		
		TeamPageMaker pageMaker = new TeamPageMaker();
		pageMaker.setTLP(STLP);
		pageMaker.setTotalCount(biz.listCount(STLP)); // 최대 리스트 갯수 카운트
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("page", request.getParameter("page"));
		model.addAttribute("STLP", STLP);
		
		System.out.println(STLP.toString());
		
		
		return "teamboard";
	}
	
	@RequestMapping("/team_serch_id.do")
    @ResponseBody
    public int team_id_search(@RequestParam("user_id")String user_id){
        int user_no = biz.selectid(user_id);

        System.out.println(user_no);

        return user_no;

    }
	
	@RequestMapping(value="/team_detail.do")
	public String detail(Model model, int team_no) { // 팀 자세히보기
		logger.info("move page team_detail.jsp");
		model.addAttribute("teamDto", biz.selectOne(team_no));
		
		model.addAttribute("uDto", biz.uDto(team_no));

		return "team_detail";
	}
	
	@RequestMapping(value="/team_updateForm.do")
	public String update(Model model, int team_no) { //팀 수정 폼 페이지
		logger.info("move page team_updateForm.jsp");
		
		model.addAttribute("teamDto", biz.selectOne(team_no));

		return "team_updateForm";
	}
	
	
	
	@RequestMapping(value="/team_updateResult.do")
	   public String updateRes(TeamDto dto, MultipartHttpServletRequest mtf) { // 팀 수정하기
	      
	      int res = biz.update(dto);
	      
	      String uploadpath = mtf.getRealPath("resources\\upload"); //upload폴더에 실제 경로 설정
	      System.out.println(uploadpath);
	      
	      if(res>0) {
	         
	         //========================파일 업로드==============================
	         logger.info("파일 업로드 작업중");
	         
	         
	         List<MultipartFile> fileList = mtf.getFiles("upload_file");
	         
	         for (MultipartFile mf : fileList) {
	               String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	               long fileSize = mf.getSize(); // 파일 사이즈

	               System.out.println("originFileName : " + originFileName);
	               System.out.println("fileSize : " + fileSize);
	               
	               String FileName = System.currentTimeMillis() + originFileName;
	               String safeFile = uploadpath+"\\"+FileName;
	               System.out.println(dto.getUser_no()+dto.getTeam_name());
	               System.out.println(biz.findno(dto));
	               try {
	                   mf.transferTo(new File(safeFile));
	                   
	                   PicDto pic = new PicDto(dto.getTeam_no() ,originFileName, FileName);
	                   
	                   biz.updatePic(pic);
	                   
	               } catch (IllegalStateException e) {
	                   e.printStackTrace();
	               } catch (IOException e) {
	                   e.printStackTrace();
	               }
	           }
	         //===============================================================
	         
	         logger.info("팀 등록서 수정완료");
	         return "redirect:team_detail.do?team_no="+dto.getTeam_no();
	      }else {
	         logger.info("팀 등록서 수정실패");
	         return "redirect:team_updateForm.do?team_no="+dto.getTeam_no();
	      }
	      
	   }
		
	@RequestMapping(value="Team_referer.do") // 이전페이지로 이동
	public String referer(HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		
		return "redirect:"+referer;
	}
	
	
	@RequestMapping(value="/team_delete.do")
	public String delete(int team_no) {
		logger.info("delete to team");
		int res = biz.delete(team_no);
		
		if(res>0) {
			logger.info("팀 삭제 완료");
			return "redirect:teamlist.do";
		}else {
			logger.info("팀 삭제 실패");
			return "redirect:team_detail.do?team_no="+team_no;
		}
		
	}
	
}
