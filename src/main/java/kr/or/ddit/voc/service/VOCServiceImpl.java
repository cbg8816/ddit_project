package kr.or.ddit.voc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.inquire.dao.InquireDAO;
import kr.or.ddit.vo.InquireVO;

@Service
public class VOCServiceImpl implements VOCService {
	@Autowired
	private InquireDAO dao;

	@Override
	public List<InquireVO> selectVOCList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecordVOC(paging);
		paging.setTotalRecord(totalRecord);

		return dao.selectVOCList(paging);
	}

}
