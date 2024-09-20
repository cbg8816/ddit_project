package kr.or.ddit.introduce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/web")
@Controller
public class intorduceController {
	@GetMapping("/introduce")
	public String introduce() {
		return "wiles:introduce/introduce";
	}

	@GetMapping("/road")
	public String road() {
		return "wiles:introduce/road";
	}

	@GetMapping("room/roomGuide")
	public String roomInfo() {
		return "wiles:introduce/roominfo";
	}

	@GetMapping("room/roomStandard")
	public String roomStandard() {
		return "wiles:introduce/roomStandard";
	}

	@GetMapping("room/roomDeluxe")
	public String roomDeluxe() {
		return "wiles:introduce/roomDeluxe";
	}

	@GetMapping("room/roomSuperior")
	public String roomSuperior() {
		return "wiles:introduce/roomSuperior";
	}

	@GetMapping("room/roomExecutive")
	public String roomExecutive() {
		return "wiles:introduce/roomExecutive";
	}

	@GetMapping("room/roomSweet")
	public String roomSweet() {
		return "wiles:introduce/roomSweet";
	}

	@GetMapping("/facility")
	public String facility() {
		return "wiles:introduce/facility";
	}

	@GetMapping("/facility/dining")
	public String dining() {
		return "wiles:introduce/dining";
	}

	@GetMapping("/facility/fitness")
	public String fitness() {
		return "wiles:introduce/fitness";
	}

	@GetMapping("/facility/indoorPool")
	public String indoorPool() {
		return "wiles:introduce/indoorPool";
	}

	@GetMapping("/facility/outdoorPool")
	public String outdoorPool() {
		return "wiles:introduce/outdoorPool";
	}

	@GetMapping("/facility/banquet")
	public String banquet() {
		return "wiles:introduce/banquet";
	}

	@GetMapping("/tour")
	public String tour() {
		return "wiles:introduce/tour";
	}

	@GetMapping("/reservation")
	public String reservation() {
		return "wiles:introduce/reservation";
	}

	@GetMapping("/reservationGuide")
	public String reservationGuide() {
		return "wiles:introduce/reservationGuide";
	}

	@GetMapping("/check")
	public String check() {
		return "wiles:introduce/check";
	}

	@GetMapping("/payDetail")
	public String payDetail() {
		return "wiles:introduce/payDetail";
	}

	@GetMapping("/payComplate")
	public String payComplate() {
		return "wiles:introduce/payComplate";
	}

	@GetMapping("/faq")
	public String faq() {
		return "wiles:introduce/faq";
	}

	@GetMapping("/membership")
	public String membership() {
		return "wiles:introduce/membership";
	}
}
