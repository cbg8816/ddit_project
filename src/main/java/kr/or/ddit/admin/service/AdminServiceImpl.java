package kr.or.ddit.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.admin.dao.AdminDAO;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO dao;

	@Override
	public List<AdminVO> selectnList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);

		return dao.selectnList(paging);
	}

}
