package com.boot.Service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.DAO.MainDAO;
import com.boot.DTO.ComNoticeAttachDTO;
import com.boot.DTO.ComNoticeDTO;
import com.boot.DTO.CompanyAttachDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("MainService")
public class MainServiceImpl implements MainService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<ComNoticeDTO> mainNotice() {
		log.info("@# MainServiceImpl mainNotice()");
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		
		return dao.mainNotice();
	}

	@Override
	public ArrayList<ComNoticeDTO> mainNewCareer() {
		log.info("@# MainServiceImpl mainNewCareer()");
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		
		return dao.mainNewCareer();
	}

	@Override
	public ArrayList<ComNoticeDTO> mainCareerhit() {
		log.info("@# MainServiceImpl mainCareerhit()");
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		
		return dao.mainCareerhit();
	}

	@Override
	public ArrayList<ComNoticeDTO> mainTodayhit() {
		log.info("@# MainServiceImpl mainTodayhit()");
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		
		return dao.mainTodayhit();
	}

	@Override
	public ArrayList<ComNoticeDTO> mainRecommendCom() {
		log.info("@# MainServiceImpl mainRecommendCom()");
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		
		return dao.mainRecommendCom();
	}

	@Override
	public List<ComNoticeAttachDTO> mainRegistFileList(int notice_num) {
		log.info("@# MainServiceImpl mainRegistFileList()");
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		
		return dao.mainRegistFileList(notice_num);
	}

	@Override
	public List<CompanyAttachDTO> mainComFileList(String com_email) {
		log.info("@# MainServiceImpl mainRegistFileList()");
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		
		return dao.mainComFileList(com_email);
	}
	
}
