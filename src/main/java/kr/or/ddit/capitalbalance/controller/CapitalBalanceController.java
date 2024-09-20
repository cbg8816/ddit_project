package kr.or.ddit.capitalbalance.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("/capitalBalance/capitalCurrent.do")
public class CapitalBalanceController {

	@GetMapping
	public String capitalBalanceRetrieveCont() {

		return "tiles:capitalBalance/capitalCurrent";
	}

}
