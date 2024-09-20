package kr.or.ddit.party.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.party.service.PartyserviceService;

@Controller
@RequestMapping("/partyservice/partyinsert.do")
public class PartyserviceInsertController {

	@Autowired
	private PartyserviceService service;

	@GetMapping
	public String formUI() {
		return "tiles:partyservice/partyinsert";
	}

//	@PostMapping
//	public String formDataProcess(
//

}
