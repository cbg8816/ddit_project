package kr.or.ddit.inquire.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.InquireVO;

@Mapper
public interface InquireDAO {

	public int insertInquire(InquireVO inquire);

	public int selectTotalRecord(PaginationInfo paging);

	public int selectTotalRecordMember(PaginationInfo paging);

	public List<InquireVO> selectInquireList(PaginationInfo paging);

	public List<InquireVO> selectInquireListMember(PaginationInfo paging);

	public InquireVO selectInquire(String inqNo);

	public int updateInquire(InquireVO inquire);

	public int deleteInquire(String inqNo);

	/**
	 * VOC DAO
	 * @return
	 */
	public List<InquireVO> selectVOCList(PaginationInfo paging);

	public int selectTotalRecordVOC(PaginationInfo paging);
}
