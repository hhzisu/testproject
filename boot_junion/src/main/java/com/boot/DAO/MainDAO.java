package com.boot.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.DTO.ComNoticeAttachDTO;
import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.CompanyAttachDTO;


@Mapper
public interface MainDAO {
	public ArrayList<ComNoticeDTO> mainNotice(); // main 신입 개발자 채용 공고 가져오기
	public ArrayList<ComNoticeDTO> mainNewCareer(); // main 신입 top5 가져오기
	public ArrayList<ComNoticeDTO> mainCareerhit(); // main 경력 인기 top5 가져오기
	public ArrayList<ComNoticeDTO> mainTodayhit(); // main 오늘 뜬 인기 top5 가져오기
	public ArrayList<ComNoticeDTO> mainRecommendCom(); // main 추천 기업 가져오기
	
	public List<ComNoticeAttachDTO> mainRegistFileList(int notice_num); // main 공고 사진 들고오기
	public List<CompanyAttachDTO> mainComFileList(String com_email); // main 기업 사진 들고오기
}
