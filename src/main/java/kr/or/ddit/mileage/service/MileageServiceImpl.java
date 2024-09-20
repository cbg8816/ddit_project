package kr.or.ddit.mileage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.mileage.dao.MileageDAO;
import kr.or.ddit.vo.MileageVO;

@Service
public class MileageServiceImpl implements MileageService {
	@Autowired
	private MileageDAO dao;

	@Override
	public List<MileageVO> selectListMileageMember(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecordMember(paging.getMemId());
		paging.setTotalRecord(totalRecord);

		return dao.selectListMileageMember(paging);
	}

	@Override
	public int selectMileageEarn(String memId) {
		return dao.selectMileageEarn(memId);
	}

	@Override
	public int selectMileageUse(String memId) {
		return dao.selectMileageUse(memId);
	}

	@Override
	public int selectMileageTotal(String memId) {
		return dao.selectMileageTotal(memId);
	}

}
