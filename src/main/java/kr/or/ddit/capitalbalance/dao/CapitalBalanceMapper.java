package kr.or.ddit.capitalbalance.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CapitalBalanceVO;

@Mapper
public interface CapitalBalanceMapper {

	/**
	 * 자금 수지 현황 조회
	 * 카드매출 / 현금매출
	 * @return List<CapitalBalanceVO>
	 */
	public List<CapitalBalanceVO> selectCapitalBalance();

}
