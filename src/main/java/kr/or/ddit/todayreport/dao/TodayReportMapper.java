package kr.or.ddit.todayreport.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ExtraChargeSumVO;
import kr.or.ddit.vo.TodayReportPaymentVO;
import kr.or.ddit.vo.TodayReportRoomAndExtVO;
import kr.or.ddit.vo.TodayReportRoomVO;
import kr.or.ddit.vo.TodayReportVO;

@Mapper
public interface TodayReportMapper {

	/**
	 * 영업일보 중 1. 객실 판매 현황을 보여주기 위한 mapper
	 * @param today
	 * @return TodayReportVO
	 */
	public TodayReportVO selectTodayReportRoom(String today);

	/**
	 * 영업일보 중 2. 일일객실 판매내역을 보여주기 위한 mapper
	 * @param today
	 * @return TodayReportVO 중 일일 객실 판매 내역에 해당하는 부분
	 */
	public TodayReportPaymentVO selectTodayReportTotalPay(String today);

	/**
	 * 영업일보 중 3. 추가요금 내역을 보여주기 위한 mapper
	 * @param today TodayReportVO 중 추가 요금 내역에 해당하는 부분
	 * @return
	 */
	public List<ExtraChargeSumVO> selectTodayReportExtraCharge(String today);

}
