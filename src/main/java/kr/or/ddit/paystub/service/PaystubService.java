package kr.or.ddit.paystub.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.PaystubVO;

public interface PaystubService {
	/**
	 * 급여 전체 리스트
	 * @param paging
	 * @return
	 */
	public List<PaystubVO> retrievePaystubList(PaginationInfo paging);

	/**
	 * 급여 상세보기
	 * @param paystubId
	 * @return
	 */
	public PaystubVO retrievePaystub(String paystubId);

	/**
	 * 급여 등록
	 * @param paystubId
	 */
	public void createPaystub(PaystubVO paystubId);

	/**
	 * 급여 다중 등록
	 * @param paystubList
	 */
	public void createPaystubList(List<PaystubVO> paystubList);
//	public void modifyPaystub(PaystubVO paystubId);
//
//	public void removePaystub(String paystubId);

	/**
	 * 사원 본인의 급여리스트
	 * @param paging
	 * @return
	 */
	public List<PaystubVO> retrieveEmpPaystubList(PaginationInfo paging);

	public PaystubVO retrievePaystubListBasic();


}
