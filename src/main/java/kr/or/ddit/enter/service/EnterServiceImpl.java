package kr.or.ddit.enter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.enter.dao.EnterMapper;
import kr.or.ddit.vo.EnterVO;

@Service
public class EnterServiceImpl implements EnterService {

	@Autowired
	private EnterMapper dao;
	
	@Override
	public void createEnter(EnterVO enter) {
		dao.insert(enter);
	}

	@Override
	public EnterVO retrieveEnter(String enterNo) {
		EnterVO enter = dao.selectByPrimaryKey(enterNo);
		return enter;
	}

	@Override
	public List<EnterVO> retrieveEnterList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectAll(paging);
	}

	@Override
	public void modifyEnter(EnterVO enter) {
		dao.updateByPrimaryKey(enter);
	}

	@Override
	public void deleteEnter(String enterNo) {
		dao.deleteByPrimaryKey(enterNo);
	}

}
