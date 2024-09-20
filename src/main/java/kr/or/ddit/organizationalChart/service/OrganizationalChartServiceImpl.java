package kr.or.ddit.organizationalChart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.department.dao.DepartmentMapper;
import kr.or.ddit.vo.DepartmentVO;

@Service
public class OrganizationalChartServiceImpl implements OrganizationalChartService {

	@Autowired
	public DepartmentMapper dao;

	@Override
	public DepartmentVO retrieveEmpNotice(String depId) {
		return dao.selectDepartment(depId);
	}


}
