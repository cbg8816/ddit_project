package kr.or.ddit.housekeeping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.LostitemVO;
import kr.or.ddit.vo.RentalVO;


@Mapper
public interface RentalMapper {

	/**
	 * 대여물품 작성
	 * @param rental
	 * @return
	 */
	public int insertRenal (RentalVO rental);


	/**
	 * 대여물품 전체 조회
	 * @param paging
	 * @return
	 */
	public List<RentalVO> RentalList(PaginationInfo paging);


	/**
	 * 대여물품 상제조회
	 * @param hkrNo
	 * @return
	 */
	public RentalVO seletRental(int hkrNo);


	/**
	 * 대여물품 정보 수정
	 * @param rental
	 * @return
	 */
	public int updateRental(RentalVO rental);


	/**
	 * 재고 갯수 차감
	 * @param rental
	 * @return
	 */
	public int updaterentalprod(RentalVO rental);

	/**
	 * HKR_RETURN 반납완료로 수정
	 * @param rental
	 * @return
	 */
	public int updateYn(RentalVO rental);

	/**
	 * 반납 갯수+
	 * @param rental
	 * @return
	 */
	public int updateprod(RentalVO rental);


	/**
	 * 페이징
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);

	/** 대여중 리스트
	 * @param paging
	 * @return
	 */
	public List<RentalVO> seletRetalIncomplete(PaginationInfo paging);
	/** 반납완료 리스트
	 * @param paging
	 * @return
	 */
	public List<RentalVO> seletRetalComplete(PaginationInfo paging);
	
	/** 대여중 카운터
	 * @return
	 */
	public int seletRentalIncompletecount();
	/** 반납완료 카운터
	 * @return
	 */
	public int seletRentalCompletecount();

}
