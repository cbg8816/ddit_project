package kr.or.ddit.confirm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.ConfirmVO;

@Mapper
public interface ConfirmOrdersMapper {

	/**
	 * 페이징을 위한 조건에 맞는 토탈 레코드 수
	 * @return
	 */
	public int confirmTotalrecord(PaginationInfo paging);

	/**
	 * 상태가 미승인인 발주 리스트 조회
	 * @param paging
	 * @return List<ConfirmVO>
	 */
	public List<ConfirmVO> needConfirmOrdersList(PaginationInfo paging);

	/**
	 * 결재 승인 시 발주 상태 변경을 위함
	 * @param orderApplyNo
	 * @return
	 */
	public int updateOrderState(String orderApplyNo);

}
