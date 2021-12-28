package com.mvc.fotsal;

import java.io.File;
import java.io.IOException;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mvc.fotsal.model.biz.TeamBiz;
import com.mvc.fotsal.model.dto.PicDto;
import com.mvc.fotsal.model.dto.TeamDto;

@Controller
public class TeamController {
	private static final Logger logger = LoggerFactory.getLogger(TeamController.class);

	@Autowired
	private TeamBiz biz;
	
	
	@RequestMapping(value="/team.do")
	public String insertForm() { // 팀 등록 페이지
		logger.info("move page team.jsp");
		
		return "team";
	}
	
	@RequestMapping(value="/teamInsert.do")
	public String team_insert(MultipartHttpServletRequest mtf,TeamDto dto) {
		logger.info("팀 등록서 작성중");
		int res = biz.insert(dto);
		
		if(res>0) {
			logger.info("팀 등록서 작성완료");
			
			//========================파일 업로드==============================
			logger.info("파일 업로드 작업중");
			
			String uploadpath = mtf.getRealPath("resources\\upload"); //upload폴더에 실제 경로 설정
			System.out.println(uploadpath);
			
			List<MultipartFile> fileList = mtf.getFiles("upload_file");
			
			for (MultipartFile mf : fileList) {
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            long fileSize = mf.getSize(); // 파일 사이즈

	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);

	            String safeFile = uploadpath +"\\"+ System.currentTimeMillis() + originFileName;
	            try {
	                mf.transferTo(new File(safeFile));
	                
	                PicDto pic = new PicDto(biz.findno(dto), originFileName, safeFile);
	                
	                System.out.println(pic);
	                
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
	
	@RequestMapping(value="/teamlist.do")
	public String teamList(Model model) { // 팀 게시판(리스트)
		logger.info("Select Team List, move page teamboard.jsp");
		
		model.addAttribute("list",biz.selectList());
		/*List<TeamDto> list = biz.selectList();
		for(TeamDto dto : list) {
			System.out.println(dto.toString());
			}*/
		return "teamboard";
	}
	
	
	@RequestMapping(value="/team_detail.do")
	public String detail(Model model, int team_no) { // 팀 자세히보기
		logger.info("move page team_detail.jsp");
		model.addAttribute("teamDto", biz.selectOne(team_no));
		
		return "team_detail";
	}
	
	@RequestMapping(value="/team_updateForm.do")
	public String update(Model model, int team_no) { //팀 수정 폼 페이지
		logger.info("move page team_updateForm.jsp");
		
		model.addAttribute("teamDto", biz.selectOne(team_no));

		return "team_updateForm";
	}
	
	@RequestMapping(value="/team_updateResult.do")
	public String updateRes(TeamDto dto) { // 팀 수정하기
		
		int res = biz.update(dto);

		if(res>0) {
			logger.info("팀 등록서 수정완료");
			return "redirect:team_detail.do?team_no="+dto.getTeam_no();
		}else {
			logger.info("팀 등록서 수정실패");
			return "redirect:team_updateForm.do?team_no="+dto.getTeam_no();
		}
		
	}
	
	@RequestMapping(value="/team_delete.do")
	public String delete(int team_no) {
		logger.info("delete to team");
		int res = biz.delete(team_no);
		
		if(res>0) {
			return "redirect:teamlist.do";
		}else {
			return "redirect:team_detail.do?team_no="+team_no;
		}
		
	}
	
}
