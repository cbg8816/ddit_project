package kr.or.ddit.payment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.RoomTypeChargePaymentVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;

@Mapper
public interface PaymentMapper {

	/**
	 * 룸 타입 리스트 조회
	 * @param String 타입의 year
	 * @return List<RoomtypeVO>
	 */
	public List<RoomtypeDefaultVO> selectRoomTypeList();

	/**
	 * 전년도 : 금년도 객실 타입, 월별 기준 매출 통계
	 * @param String 타입의 year
	 * @return List<RoomTypeChargePaymentVO>
	 */
	public List<RoomTypeChargePaymentVO> selectYearMonthRoomTypeCharges(String year);

	/**
	 * 전년도 : 금년도 객실 타입 기준 매출 통계
	 * @param year
	 * @return
	 */
	public List<RoomTypeChargePaymentVO> selectYearRoomTypeCharges(String year);

}
