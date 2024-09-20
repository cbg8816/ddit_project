package kr.or.ddit.housekeeping.service.lostitem;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.BrokenRoomVO;
import kr.or.ddit.vo.LostitemVO;

public interface LostitemService {

	/**
	 * 리스트 조회
	 * @param paging
	 * @return
	 */
	public List<LostitemVO> readLostitemList(PaginationInfo paging);

	/**
	 * 상세조회
	 * @param hksNo
	 * @return
	 */
	public LostitemVO readLostitem(int hksNo);

	/**
	 * 등록
	 * @param lostitem
	 */
	public void createLostitem(LostitemVO lostitem);

	/**
	 * 수정
	 * @param lostitem
	 */
	public void modifyLostitem(LostitemVO lostitem);
	
	/**완료 처리
	 * @param lostitem
	 */
	public void modifyLostitemYN(LostitemVO lostitem);

	/**미완료 리스트
	 * @param paging
	 * @return
	 */
	public List<LostitemVO> LostitemIncompleteList(PaginationInfo paging);
	/**완료 리스트
	 * @param paging
	 * @return
	 */
	public List<LostitemVO> LostitemCompleteList(PaginationInfo paging);
	
	/** 미완료 카운터
	 * @return
	 */
	public int LostitemIncompletecount();
	
	/**완료 카운터
	 * @return
	 */
	public int Lostitemcompletecount();
	
}
