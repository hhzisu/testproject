package com.boot.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.CompanyInfoDTO;
import com.boot.DTO.JoinDTO;

public interface CompanyInfoService {
	//하진 : 기업 마이페이지 메인 메소드
	public ArrayList<ComNoticeDTO> getEndNotice(String com_email);//마감된 공고를 가져오는 메소드
	
	//하진 : 기업 정보 관리 관련 메소드
	public CompanyInfoDTO companyInfo(String email);//기업 정보 관리 페이지 뿌려질 내용
	public CompanyInfoDTO InfoMini(String email);//기업 기본정보 수정 페이지 이동
	public void modify_Info(HashMap<String, String> param);//기업 정보 수정(기본)
	public void comPWchange(HashMap<String, String> param);//기업 마이페이지, 비밀번호 변경 팝업 값으로 비밀번호 변경
	public CompanyInfoDTO companyInfoUpdate(String com_email);//기업 상세정보 수정 페이지 이동
	public void modify_Detail(HashMap<String, String> param);//기업 정보 수정(상세)
	
//	누가 만들었나요??
	public ArrayList<CompanyInfoDTO> comList();//기업목록
	public ArrayList<CompanyInfoDTO> comListByNum(String comScrapArrStr);//기업목록
	public CompanyInfoDTO comInfoByNum(int com_num);//기업정보조회
	
	public void modify_Detail(CompanyInfoDTO companyInfoDTO);// 파일 업로드??

}
