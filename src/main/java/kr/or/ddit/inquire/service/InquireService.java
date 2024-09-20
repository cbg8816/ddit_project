package kr.or.ddit.inquire.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.InquireVO;

public interface InquireService {

	public void insertInquire(InquireVO inquire);

	public List<InquireVO> selectInquireList(PaginationInfo paging);

	public List<InquireVO> selectInquireListMember(PaginationInfo paging);

	public InquireVO selectInquire(String inqNo);

	public void updateInquire(InquireVO inquire);

	public void deleteInquire(String inqNo);
}
