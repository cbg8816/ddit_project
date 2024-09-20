package kr.or.ddit.party.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.party.service.PartyserviceService;
import kr.or.ddit.vo.PartyserviceVO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
@RequestMapping("/Partyservice/partyList.do")
public class PartyServiceController {
	@Autowired
	private PartyserviceService service;

	@GetMapping
	public String PartyList(@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model) {
		PaginationInfo paging = new PaginationInfo();
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		List<PartyserviceVO> partyList = service.readPartyserviceList(paging);
		model.addAttribute("partyList", partyList);
		DefaultPaginationRenderer rederer = new DefaultPaginationRenderer();
		String pagingHTML = rederer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:partyservice/partyList";
	}

	@GetMapping("/partydetail.do")
	@ResponseBody
	public PartyserviceVO detail(@RequestParam("what") String partyNo) {
		PartyserviceVO party = service.readPartyservice(partyNo);
		return party;
	}




}
