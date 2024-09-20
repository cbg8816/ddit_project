package kr.or.ddit.housekeeping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SingleUIController {

	@GetMapping("/lostItemAggrid")
	public String lostitemAGgrid() {
		return "tiles:lostitem/lostitemList";
	}

	@GetMapping("/brokenRoomAggrid")
	public String brokenAgGrid() {
		return "tiles:brokenroom/brokenList";
	}

}
