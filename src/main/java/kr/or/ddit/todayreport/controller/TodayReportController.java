package kr.or.ddit.todayreport.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.todayreport.service.TodayReportService;
import kr.or.ddit.vo.ExtraChargeSumVO;
import kr.or.ddit.vo.TodayReportPaymentVO;
import kr.or.ddit.vo.TodayReportRoomAndExtVO;
import kr.or.ddit.vo.TodayReportRoomVO;
import kr.or.ddit.vo.TodayReportVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/todayReport/todayReport.do")
public class TodayReportController {

	@Autowired
	private TodayReportService service;

	@GetMapping
	public String todayReportRetrieveController(Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar now = Calendar.getInstance();

		String today = sdf.format(now.getTime());

		//객실 판매 현황
		TodayReportVO todayReportVO = service.showTodayReportRoom(today);
		TodayReportPaymentVO todayReportPayment = service.showTodayReportTotalPay(today);
		List<ExtraChargeSumVO> todayReportExtList = service.showTodayReportExtraCharge(today);

		model.addAttribute("today", today);
		model.addAttribute("room", todayReportVO);
		model.addAttribute("payment", todayReportPayment);
		model.addAttribute("extList", todayReportExtList);

		return "tiles:todayReport/todayReport";
	}

	@PostMapping
	public String todayReportChange(@RequestParam String today, Model model){

		TodayReportVO todayReportVO = service.showTodayReportRoom(today);
		TodayReportPaymentVO todayReportPayment = service.showTodayReportTotalPay(today);
		List<ExtraChargeSumVO> todayReportExtList = service.showTodayReportExtraCharge(today);

		model.addAttribute("today", today);
		model.addAttribute("room", todayReportVO);
		model.addAttribute("payment", todayReportPayment);
		model.addAttribute("extList", todayReportExtList);

		return "tiles:todayReport/todayReport";
	}

}
