package kr.or.ddit.checkout.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.CheckoutVO;

/**
 * 퇴실/정산 DAO
 *
 */
@Mapper
public interface CheckoutDAO {
	/**
	 * 퇴실/정산 목록
	 * @return
	 */
	public List<CheckoutVO> selectCheckoutList(PaginationInfo paging);

	/**
	 * 퇴실/정산 목록 총 개수
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);

	/**
	 * 퇴실 예정자 목록
	 * @return
	 */
	public List<CheckoutVO> selectCheckoutSysList(PaginationInfo paging);

	/**
	 * 퇴실 예정자 목록 총 개수
	 * @return
	 */
	public int selectTotalRecordSys(PaginationInfo paging);

	/**
	 * 퇴실자 / 예정자 상세조회
	 * @param payId
	 * @return
	 */
	public List<CheckoutVO> selectCheckoutDetail(String payId);

	/**
	 * 고객별 결제 완료 TREV_ST = 'OUT'
	 * @param trevId
	 * @return
	 */
	public int updatePayOk(String trevId);

	/**
	 * 고객별 결제 완료 PAY_CM = 'Y'
	 * @param trevId
	 * @return
	 */
	public int updatePayOk2(String trevId);

	/**
	 * 고객별 결제 완료 ROOM_ST = '2'
	 * @param roomId
	 * @return
	 */
	public int updatePayOk3(String roomId);
}
