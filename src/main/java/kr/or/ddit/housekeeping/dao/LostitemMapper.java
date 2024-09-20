package kr.or.ddit.housekeeping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.LostitemVO;

@Mapper
public interface LostitemMapper {

	/**
	 * 등록
	 * @param lostitem
	 * @return
	 */
	public int insertLostitem(LostitemVO lostitem);

	/**
	 * 리스트 조회
	 * @param paging
	 * @return
	 */
	public List<LostitemVO> lostitemList(PaginationInfo paging);

	/**
	 * 상세조회
	 * @param hksNo
	 * @return
	 */
	public LostitemVO selectLostitem(int hksNo);

	/**
	 * 업데이트
	 * @param lostitem
	 * @return
	 */
	public int updateLostitem(LostitemVO lostitem);

	
	/** 완료 처리
	 * @param lostitem
	 * @return
	 */
	public int updateLostitemYN(LostitemVO lostitem);

	/**
	 * 페이지 설정
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);

	/** 미완료 리스트
	 * @param paging
	 * @return
	 */
	public List<LostitemVO> seletLostitemIncomplete(PaginationInfo paging);
	/** 완료 리스트
	 * @param paging
	 * @return
	 */
	public List<LostitemVO> seletLostitemComplete(PaginationInfo paging);
	
	/** 미완료 카운터
	 * @return
	 */
	public int seletLostitemIncompletecount();
	/** 완료 카운터
	 * @return
	 */
	public int seletLostitemcompletecount();
}
