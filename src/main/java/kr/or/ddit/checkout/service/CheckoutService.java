package kr.or.ddit.checkout.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.CheckoutVO;
import kr.or.ddit.vo.ExtcrgTypeVO;
import kr.or.ddit.vo.ExtrachargesVO;

public interface CheckoutService {
	public List<CheckoutVO> selectCheckoutList(PaginationInfo paging);

	public List<CheckoutVO> selectCheckoutSysList(PaginationInfo paging);

	public List<CheckoutVO> selectCheckoutDetail(String payId);

	// 기타요금 목록
	public List<ExtcrgTypeVO> selectExtList();

	// 기타요금 가격
	public int selectExtPrice(String etId);

	// 고객별 기타요금 조회
	public List<ExtrachargesVO> selectExt(String payId);

	// 고객별 기타요금 추가
	public void insertExt(ExtrachargesVO extVO);

	// 고객별 기타요금 삭제
	public void deleteExt(ExtrachargesVO extVO);

	// 고객별 기타요금 수정
	public void updateExt(ExtrachargesVO extVO);

	// 고객별 기타요금 합계
	public int selectTotal(String payId);

	// 고객별 기타요금 결제
	public void updatePay(ExtrachargesVO extVO);

	// 고객별 결제 완료 TREV_ST = 'OUT', 고객별 결제 완료 PAY_CM = 'Y'
	public void updatePayOk(String trevId);

	// 고객별 결제 완료 ROOM_ST = '2'
	public void updatePayOk3(String roomId);
}
