package kr.or.ddit.attencance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.attencance.service.AttencanceService;
import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.vo.AttencanceVO;

@Controller
@RequestMapping("/attencance")
public class AttencanceRetrieveController {

	@Autowired
	public AttencanceService service;

	@GetMapping("attencanceList.do")
	public String list (
		@RequestParam(required = false, defaultValue = "1") int page
		, @ModelAttribute("condition") SimpleCondition simpleCondition
		, Model model
	) {

		PaginationInfo paging = new PaginationInfo(10,5);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		List<AttencanceVO> attList = service.retrieveAttencanceList(paging);
		model.addAttribute("attList", attList);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);


		return "tiles:attencance/attencanceList";
	}

	@GetMapping("attencanceDetail.do")
	public String detail(Model model, @RequestParam("what") String atteId){
		AttencanceVO att = service.retrieveAttencance(atteId);
		model.addAttribute("att", att);

		return "pms/attencance/attencanceDetail";
	}
}
