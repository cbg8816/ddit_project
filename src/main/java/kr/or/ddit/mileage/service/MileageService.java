package kr.or.ddit.mileage.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.MileageVO;

/**
 * 마일리지 Service
 *
 */
public interface MileageService {

	/**
	 * 회원 마이페이지 마일리지 내역 조회 Service
	 * @param paging
	 * @return
	 */
	public List<MileageVO> selectListMileageMember(PaginationInfo paging);

	/**
	 * 회원 마이페이지 적립 마일리지 조회 Service
	 * @param memId
	 * @return
	 */
	public int selectMileageEarn(String memId);

	/**
	 * 회원 마이페이지 사용 마일리지 조회 Service
	 * @param memId
	 * @return
	 */
	public int selectMileageUse(String memId);

	/**
	 * 회원 마이페이지 총 마일리지 조회 Service
	 * @param memId
	 * @return
	 */
	public int selectMileageTotal(String memId);
}
