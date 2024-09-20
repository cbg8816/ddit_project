package kr.or.ddit.payment.controller;

import java.util.ArrayList;
import java.util.Calendar;
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

import kr.or.ddit.payment.service.PaymentService;
import kr.or.ddit.vo.YearPaymentVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/payment/roomCharge.do")
public class RoomTypeChargeController {

	@Autowired
	private PaymentService service;

	@GetMapping
	public String paymentRetrieveController(Model model) {
		Calendar now = Calendar.getInstance();
		int nowYear = now.get(Calendar.YEAR);
		int lastYear = now.get(Calendar.YEAR)-1;

		model.addAttribute("nowYear", nowYear);
		model.addAttribute("lastYear", lastYear);
		model.addAttribute("condition", "year");

		return "tiles:payment/roomCharge";
	}


	@PostMapping
	@ResponseBody
	public YearPaymentVO showPaymentChart(@RequestBody Map<String, String> data
			, YearPaymentVO yearPaymentVO) {

		List<String> roomTypeList = service.viewRoomTypeList();

		String condition = data.get("condition");

		yearPaymentVO.setCondition(condition);
		yearPaymentVO.setRoomTypeList(roomTypeList);

		if(condition.equals("year")) {
			int[] lastYearpayment = service.viewYearRoomTypeCharges(data.get("firstYear"));
			int[] thisYearpayment = service.viewYearRoomTypeCharges(data.get("secondYear"));

			yearPaymentVO.setLastYearPayment(lastYearpayment);
			yearPaymentVO.setThisYearPayment(thisYearpayment);

		}else if(condition.equals("month-total")) {

			List<Integer> monthTotalList = service.viewYearMonthTotalRoomTypeCharges(data.get("singleYear"));

			yearPaymentVO.setMonthTotalList(monthTotalList);

		}else if(condition.equals("month-room")) {
			List<int[]> monthEachList = new ArrayList<>();

			try {
				monthEachList = service.viewYearMontEachdRoomTypeCharges(data.get("singleYear"));
				log.info("eachRoom : {}", monthEachList);
				yearPaymentVO.setMonthEachList(monthEachList);

			}catch (IndexOutOfBoundsException e) {
				monthEachList.add(new int[0]);
			}


		}

		return yearPaymentVO;
	}

}
