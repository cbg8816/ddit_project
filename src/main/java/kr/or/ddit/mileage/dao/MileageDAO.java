package kr.or.ddit.mileage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.MileageVO;

/**
 * 마일리지 DAO
 *
 */
@Mapper
public interface MileageDAO {

	/**
	 * 회원 마이페이지 마일리지 내역 조회 DAO
	 * @param paging
	 * @return
	 */
	public List<MileageVO> selectListMileageMember(PaginationInfo paging);

	/**
	 * 회원 마이페이지 마일리지 내역 총 개수 조회 DAO
	 * @param paging
	 * @return
	 */
	public int selectTotalRecordMember(String memId);

	/**
	 * 회원 마이페이지 적립 마일리지 조회 DAO
	 * @param memId
	 * @return
	 */
	public int selectMileageEarn(String memId);

	/**
	 * 회원 마이페이지 사용 마일리지 조회 DAO
	 * @param memId
	 * @return
	 */
	public int selectMileageUse(String memId);

	/**
	 * 회원 마이페이지 총 마일리지 조회 DAO
	 * @param memId
	 * @return
	 */
	public int selectMileageTotal(String memId);
}
