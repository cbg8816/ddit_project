package kr.or.ddit.housekeeping.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.BrokenRoomVO;
import kr.or.ddit.vo.HousekeepingVO;
import kr.or.ddit.vo.LostitemVO;




public interface HousekeepingService {

	/**
	 * 리스트
	 * @return
	 */
	public List<HousekeepingVO> readKeepingList(PaginationInfo paging);

	/**
	 * 하우스키핑 상세조회
	 * @param hkbNo
	 * @return
	 */
	public HousekeepingVO readKeeping(int hkpNo);

	/**
	 * 하우스키핑 추가 등록
	 * @param rental
	 */
	public void createKeeping(HousekeepingVO keeping);


	/**
	 * 하우스키핑 정보 수정
	 * @param rental
	 */
	public void modifyKeeping(HousekeepingVO keeping);


	/**미완료 리스트
	 * @param paging
	 * @return
	 */
	public List<HousekeepingVO> KeepingIncompleteList(PaginationInfo paging);
	/**완료 리스트
	 * @param paging
	 * @return
	 */
	public List<HousekeepingVO> KeepingCompleteList(PaginationInfo paging);
	
	/** 미완료 카운터
	 * @return
	 */
	public int keepingIncompletecount();
	
	/**완료 카운터
	 * @return
	 */
	public int keepingcompletecount();
}
