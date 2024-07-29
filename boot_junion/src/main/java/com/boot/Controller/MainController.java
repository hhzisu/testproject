package com.boot.Controller;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.DTO.ComNoticeAttachDTO;
import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.CompanyAttachDTO;
import com.boot.Service.MainService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping("/main")
	public String main(Model model, ComNoticeDTO comNoticeDTO) {
		log.info("main!!!!!!");
//		String user_email ="tls123";
//		int user_type = 1;

//		HttpSession session = request.getSession();
//		LoginDTO dto = (LoginDTO) session.getAttribute("user_email");
//		return "login_ok";
		
		ArrayList<ComNoticeDTO> mainNotice = service.mainNotice();
		model.addAttribute("mainNotice", mainNotice);
		
		ArrayList<ComNoticeDTO> mainNewCareer = service.mainNewCareer();
		model.addAttribute("mainNewCareer", mainNewCareer);
		
		ArrayList<ComNoticeDTO> mainCareerhit = service.mainCareerhit();
		model.addAttribute("mainCareerhit", mainCareerhit);
		
		ArrayList<ComNoticeDTO> mainTodayhit = service.mainTodayhit();
		model.addAttribute("mainTodayhit", mainTodayhit);

		ArrayList<ComNoticeDTO> mainRecommendCom = service.mainRecommendCom();
		model.addAttribute("mainRecommendCom", mainRecommendCom);
		
		return "main";
	};
	
//	이미지파일을 받아서 화면에 출력(byte 배열타입)
	@GetMapping("/mainDisplay")
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("@# display fileName=>"+fileName);
		
//		업로드 파일경로+이름
		File file = new File("C:\\devv\\upload\\"+fileName);
		log.info("@# file=>"+file);
		
		ResponseEntity<byte[]> result=null;
		HttpHeaders headers=new HttpHeaders();
		
		try {
//			파일타입을 헤더에 추가
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
//			파일정보를 byte 배열로 복사+헤더정보+http상태 정상을 결과에 저장
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@GetMapping(value = "/mainRegistFileList")
	public ResponseEntity<List<ComNoticeAttachDTO>> mainRegistFileList(@RequestParam HashMap<String, String> param) {
		log.info("@# mainRegistFileList()");
		log.info("@# param=>"+param);
		log.info("@# param=>"+param.get("notice_num"));
		
		return new ResponseEntity<>(service.mainRegistFileList(Integer.parseInt(param.get("notice_num"))), HttpStatus.OK);
	}
	
	@GetMapping(value = "/mainComFileList")
	public ResponseEntity<List<CompanyAttachDTO>> mainComFileList(@RequestParam HashMap<String, String> param) {
		log.info("@# mainComFileList()");
		log.info("@# param=>"+param);
		log.info("@# param=>"+param.get("com_email"));
		
		return new ResponseEntity<>(service.mainComFileList(param.get("com_email")), HttpStatus.OK);
	}
	
}
