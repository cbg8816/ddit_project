package kr.or.ddit.todayreport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.todayreport.dao.TodayReportMapper;
import kr.or.ddit.vo.ExtraChargeSumVO;
import kr.or.ddit.vo.TodayReportPaymentVO;
import kr.or.ddit.vo.TodayReportRoomAndExtVO;
import kr.or.ddit.vo.TodayReportRoomVO;
import kr.or.ddit.vo.TodayReportVO;

@Service
public class TodayReportServiceImpl implements TodayReportService{

	@Autowired
	private TodayReportMapper mapper;

	@Override
	public TodayReportVO showTodayReportRoom(String today) {

		return mapper.selectTodayReportRoom(today);
	}

	@Override
	public TodayReportPaymentVO showTodayReportTotalPay(String today) {
		return mapper.selectTodayReportTotalPay(today);
	}

	@Override
	public List<ExtraChargeSumVO> showTodayReportExtraCharge(String today) {
		return mapper.selectTodayReportExtraCharge(today);
	}

}
