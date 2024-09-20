package kr.or.ddit.organizationalChart.controller;

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
import kr.or.ddit.department.dao.DepartmentMapper;
import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.EmpVO;

@Controller
@RequestMapping("/organizationalChart")
public class OrganizationalChartController {
	@Autowired
	public EmpService service;

	@Autowired
	public DepartmentMapper deptDAO;

	@ModelAttribute("deptList")
	public List<DepartmentVO> addAttributeD(){
		return deptDAO.selectDepartmentList();
	}



	@GetMapping("organizationalChartList.do")
	public String chart(
		@RequestParam(required = false, defaultValue = "1") int page
		, @ModelAttribute("condition") SimpleCondition simpleCondition
		, Model model
	) {

		PaginationInfo paging = new PaginationInfo(1000000,2);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		List<EmpVO> empList = service.retrieveEmpList(paging);
		model.addAttribute("empList", empList);

		// json으로 변환
//		List<EmpVO> empList = service.retrieveEmpList(paging);
//
//        ObjectMapper objectMapper = new ObjectMapper();
//        String empjson = objectMapper.writeValueAsString(empList);
//
//		model.addAttribute("empjson", empjson);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);
		return "tiles:organizationalChart/organizationalChart";
	}

	@GetMapping("organizationalChartDetail.do")
	public String detail(Model model, @RequestParam("what") String empId){
		EmpVO emp = service.retrieveEmp(empId);
		model.addAttribute("emp", emp);

		return "pms/organizationalChart/organizationalChartDetail";

	}
}
