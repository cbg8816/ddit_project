package kr.or.ddit.attencance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.attencance.dao.AttencanceDAO;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AttencanceDetailVO;
import kr.or.ddit.vo.AttencanceVO;

@Service
public class AttencanceServiceImple implements AttencanceService {

	@Autowired
	private AttencanceDAO dao;

	@Override
	public List<AttencanceVO> retrieveAttencanceList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectAttencanceList(paging);
	}

	@Override
	public AttencanceVO retrieveAttencance(String atteId) {
		return dao.selectAttencance(atteId);
	}


	@Override
	public void createattvo(AttencanceDetailVO attvo) {
		dao.insertattvo(attvo);
	}



}
