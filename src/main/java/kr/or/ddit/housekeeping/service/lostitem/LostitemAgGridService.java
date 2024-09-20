package kr.or.ddit.housekeeping.service.lostitem;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.LostitemVO;

public interface LostitemAgGridService {

	/**
	 * 분실물 전체조회
	 * @param paging
	 * @return
	 */
//	public List<HousekeepingLostitemVO> readLostitemList(PaginationInfo paging);

	/**
	 * ag-grid 적용 리스트
	 * @return
	 */
	public List<LostitemVO> readLostitemList();

	/**
	 * 분실물 상세조회
	 * @param hkrNo
	 * @return
	 */
	public LostitemVO readlostitem(int hksNo);

	/**
	 * 분실물 추가 등록
	 * @param lostitem
	 */
	public void createLostitem(LostitemVO lostitem);


	/**
	 * 분실물 정보 수정
	 * @param lostitem
	 */
	public void modifyLostitem(LostitemVO lostitem);

	public void removelostitem(int hksNo);


}
