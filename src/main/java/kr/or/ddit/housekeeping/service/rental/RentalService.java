package kr.or.ddit.housekeeping.service.rental;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.BrokenRoomVO;
import kr.or.ddit.vo.LostitemVO;
import kr.or.ddit.vo.RentalVO;


public interface RentalService {

	/**
	 *  리스트
	 * @return
	 */
	public List<RentalVO> readRentalList(PaginationInfo paging);

	/**
	 * 대여물품 상세조회
	 * @param hkbNo
	 * @return
	 */
	public RentalVO readRental(int hkrNo);

	/**
	 * 대여물품 추가 등록
	 * @param rental
	 */
	public void createRental(RentalVO rental);


	/**
	 * 대여물품 정보 수정
	 * @param rental
	 */
	public void modifyRental(RentalVO rental);

	public void modifyRentalfinish(RentalVO rental);

	/**대여중 리스트
	 * @param paging
	 * @return
	 */
	public List<RentalVO> RetalIncompleteList(PaginationInfo paging);
	/**반납완료 리스트
	 * @param paging
	 * @return
	 */
	public List<RentalVO> RetalCompleteList(PaginationInfo paging);
	
	/** 대여중 카운터
	 * @return
	 */
	public int RetalIncompletecount();
	
	/**반납완료 카운터
	 * @return
	 */
	public int Retalcompletecount();
	
}
