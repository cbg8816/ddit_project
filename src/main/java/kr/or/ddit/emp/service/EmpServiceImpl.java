package kr.or.ddit.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.emp.dao.EmpMapper;
import kr.or.ddit.vo.EmpVO;

@Service
public class EmpServiceImpl implements EmpService {

	@Autowired
	private EmpMapper dao;

	@Override
	public List<EmpVO> retrieveEmpList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectEmpList(paging);
	}

	@Override
	public EmpVO retrieveEmp(String empId) {
		return dao.selectEmp(empId);
	}

	@Override
	public void createEmp(EmpVO emp) {
		dao.insertEmp(emp);
		dao.insertAttencance(emp);
	}

	@Override
	public void modifyEmp(EmpVO emp) {
		dao.updateEmp(emp);
	}

	@Override
	public void removeEmp(String empId) {
		dao.deleteEmp(empId);
	}

	@Override
	public List<EmpVO> retrieveEmpExList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectEmpExList(paging);
	}

}
