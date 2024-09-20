package kr.or.ddit.inquire.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.inquire.dao.InquireDAO;
import kr.or.ddit.member.exception.UserNotFoundException;
import kr.or.ddit.vo.InquireVO;

@Service
public class InquireServiceImpl implements InquireService {
	@Autowired
	private InquireDAO inquireDAO;

	@Override
	public void insertInquire(InquireVO inquire) {
		inquireDAO.insertInquire(inquire);
	}

	@Override
	public List<InquireVO> selectInquireList(PaginationInfo paging) {
		int totalRecord = inquireDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);

		return inquireDAO.selectInquireList(paging);
	}

	@Override
	public List<InquireVO> selectInquireListMember(PaginationInfo paging) {
		int totalRecord = inquireDAO.selectTotalRecordMember(paging);
		paging.setTotalRecord(totalRecord);

		return inquireDAO.selectInquireListMember(paging);
	}

	@Override
	public InquireVO selectInquire(String inqNo) {
		InquireVO inquire = new InquireVO();
		inquire = inquireDAO.selectInquire(inqNo);

		if(inquire == null) {
			throw new UserNotFoundException(inqNo);
		}

		return inquire;
	}

	@Override
	public void updateInquire(InquireVO inquire) {
		inquireDAO.updateInquire(inquire);
	}

	@Override
	public void deleteInquire(String inqNo) {
		inquireDAO.deleteInquire(inqNo);
	}

}
