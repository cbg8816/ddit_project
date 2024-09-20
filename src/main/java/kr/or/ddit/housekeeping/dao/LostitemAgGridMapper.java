package kr.or.ddit.housekeeping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.LostitemVO;

@Mapper
public interface LostitemAgGridMapper {


	/*
	/**
	 * 분실물,보관 물품 전체조회
	 * @param paging
	 * @return

	public List<LostitemVO> LostList(PaginationInfo paging);
*/
	/**
	 * 분실물및보관물품 추가 작성
	 * @param lostitem
	 * @return
	 */
	public Integer insertLostitem (LostitemVO lostitem);

	/**
	 * 전체 리스트
	 * @return
	 */
	public List<LostitemVO> LostListNonpage();



	/**
	 * 물품 정보 상세 조회
	 * @param hksNo
	 * @return
	 */
	public LostitemVO seletLostitem(int hksNo);

/*
	/**
	 * 페이징
	 * @param paging
	 * @return

	public int selectTotalRecord(PaginationInfo paging);
*/

	/**
	 * 물품 정보 수정
	 * @param lostitem
	 * @return
	 */
	public int updateLostitem (LostitemVO lostitem);


	/**
	 * 삭제
	 * @param hksNo
	 * @return
	 */
	public int deletelostitem(int hksNo);

}
