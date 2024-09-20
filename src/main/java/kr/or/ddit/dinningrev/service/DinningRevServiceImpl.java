package kr.or.ddit.dinningrev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.dinningrev.dao.DinningRevDAO;
import kr.or.ddit.vo.DinningRevVO;

@Service
public class DinningRevServiceImpl implements DinningRevService {

	@Autowired
	private DinningRevDAO dao;

	@Override
	public void insertDinRev(DinningRevVO dinRev) {
		dao.insertMember(dinRev);
		dao.insertTotalRev(dinRev);
		dao.insertDinRev(dinRev);
	}

	@Override
	public List<DinningRevVO> selectDinRevList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectDinRevList(paging);
	}

	@Override
	public DinningRevVO selectDinRev(String what) {
		return dao.selectDinRev(what);
	}

	@Override
	public void updateDinRev(DinningRevVO dinRev) {
		dao.updateDinRev(dinRev);
		dao.updateTotalRev(dinRev);
	}

}
