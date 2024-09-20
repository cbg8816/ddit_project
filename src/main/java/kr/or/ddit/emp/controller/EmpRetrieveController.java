package kr.or.ddit.emp.controller;

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
import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.vo.EmpVO;

@Controller
@RequestMapping("/emp")
public class EmpRetrieveController {
	@Autowired
	public EmpService service;

	@GetMapping("empList.do")
	public String list (
		@RequestParam(required = false, defaultValue = "1") int page
		, @ModelAttribute("condition") SimpleCondition simpleCondition
		, Model model
	) {

		PaginationInfo paging = new PaginationInfo(10,5);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		List<EmpVO> empList = service.retrieveEmpList(paging);
		model.addAttribute("empList", empList);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:emp/empList";
	}

	@GetMapping("empDetail.do")
	public String detail(Model model, @RequestParam("what") String empId){
		EmpVO emp = service.retrieveEmp(empId);
		model.addAttribute("emp", emp);

		return "tiles:emp/empDetail";
	}

	@GetMapping("empExList.do")
	public String exEmp(
		@RequestParam(required = false, defaultValue = "1") int page
		, @ModelAttribute("condition") SimpleCondition simpleCondition
		, Model model
	) {
		PaginationInfo paging = new PaginationInfo(10,2);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		List<EmpVO> empList = service.retrieveEmpExList(paging);
		model.addAttribute("empList", empList);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:emp/empExList";
	}
}
