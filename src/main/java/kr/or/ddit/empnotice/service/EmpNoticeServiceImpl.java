package kr.or.ddit.empnotice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.empnotice.dao.EmpNoticeMapper;
import kr.or.ddit.vo.EmpNoticeVO;
import kr.or.ddit.vo.EmpVO;

@Service
public class EmpNoticeServiceImpl implements EmpNoticeService {
	@Autowired
	private EmpNoticeMapper dao;

	@Override
	public List<EmpNoticeVO> retrieveEmpNoticeList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectEmpNoticeList(paging);
	}

	@Override
	public EmpNoticeVO retrieveEmpNotice(String empnotiNo) {
		return dao.selectEmpNotice(empnotiNo);
	}

	@Override
	public void createEmpNotice(EmpNoticeVO empNotice) {
		dao.insertEmpNotice(empNotice);
	}

	@Override
	public void modifyEmpNotice(EmpNoticeVO empNotice) {
		dao.updateEmpNotice(empNotice);
	}

	@Override
	public void removeEmpNotice(String empnotiNo) {
		dao.deleteEmpNotice(empnotiNo);
	}



	@Override
	public EmpVO empList(String empId) {
		return dao.empallList(empId);
	}

}
