package kr.or.ddit.paystub.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.PaystubVO;

@Mapper
public interface PaystubMapper {
	/**
	 * 페이징 할때 급여관리 전체 레코드 수
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);

	/**
	 * 급여관리 전체 리스트
	 * @param paging
	 * @return
	 */
	public List<PaystubVO> selectPaystubList(PaginationInfo paging);
	/**
	 * 급여관리 상세보기
	 * @param paystubId
	 * @return
	 */
	public PaystubVO selectPaystub(String paystubId);
	/**
	 * 급여관리 등록
	 * @param paystubId
	 * @return
	 */
	public int insertPaystub(PaystubVO paystubId);
	/**
	 * 급여관리 다중 등록
	 * @param paystubList
	 * @return
	 */
	public int insertPaystubList(List<PaystubVO> paystubList);

//	public int updatePaystub(PaystubVO paystubId);
//	public int deletePaystub(String paystubId);


	/**
	 * 사원 본인의 급여리스트
	 * @param paging
	 * @return
	 */
	public List<PaystubVO> selectEmpPaystubList(PaginationInfo paging);

	public PaystubVO selectPaystubListBasic();

}