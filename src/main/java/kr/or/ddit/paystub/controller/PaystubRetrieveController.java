package kr.or.ddit.paystub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.paystub.service.PaystubService;
import kr.or.ddit.vo.PaystubVO;

@Controller
@RequestMapping("/paystub")
public class PaystubRetrieveController {

	@Autowired
	private PaystubService service;

	@GetMapping("paystubList.do")
	public String list (
		@RequestParam(required = false, defaultValue = "1") int page
		, @ModelAttribute("condition") SimpleCondition simpleCondition
		, Model model
	) {

		PaginationInfo paging = new PaginationInfo(10,5);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		List<PaystubVO> paystubList = service.retrievePaystubList(paging);
		model.addAttribute("paystubList", paystubList);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:paystub/paystubList";
	}

	@GetMapping("empPaystubList.do")
	public String myList (
			@RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam("what") String empId
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model
			) {

		PaginationInfo paging = new PaginationInfo(10,5);
		paging.setPage(page);
		paging.setEmpId(empId);
		paging.setSimpleCondition(simpleCondition);

		List<PaystubVO> paystubList = service.retrieveEmpPaystubList(paging);
		model.addAttribute("paystubList", paystubList);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:paystub/empPaystubList";
	}

	@GetMapping("empPaystubDetail.do")
	public String detail(Model model, @RequestParam("what") String paystubId) {
		PaystubVO paystub = service.retrievePaystub(paystubId);
		model.addAttribute("paystub", paystub);

		return "tiles:paystub/empPaystubDetail";

	}

	@GetMapping("paystubDetail.do")
	public String myDetail(Model model, @RequestParam("what") String paystubId) {
		PaystubVO paystub = service.retrievePaystub(paystubId);
		model.addAttribute("paystub", paystub);

		return "pms/paystub/paystubDetail";

	}
}
