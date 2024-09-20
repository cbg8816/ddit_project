package kr.or.ddit.workshift.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.WorkshiftVO;
import kr.or.ddit.workshift.service.WorkshiftService;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@Controller
@RequestMapping("/workshift/workshiftInsert")
public class WorkshiftInsertController {

	@Autowired
	private WorkshiftService service;

	@GetMapping()
	public String empUI() {
		return "tiles:workshift/workshiftInsert";
	}

	@GetMapping(value = "/empList", produces = "application/json;charset=UTF-8")
	public void empList(
			Model model
			, HttpSession session
	) {
		 EmpVO empvo = (EmpVO) session.getAttribute("empvo");
		 String depid = empvo.getDepId();
		 log.info("depid >> {} ",depid);

		List<EmpVO> empList = service.selectDepEmpList(depid);
		model.addAttribute("eList", empList);

//		return "tiles:workshift/workshiftInsert";

	}

	@RequestMapping(value = "/empWorkshift",  produces = "application/json;charset=UTF-8")
	public void empWorkshiftList(
			@RequestParam String what
			, @RequestParam(required = false) String dal
			, Model model
	) {

		List<WorkshiftVO> ewList = service.selectEmpWorkshiftList(what, dal);
		model.addAttribute("ewList", ewList);

	}

	@PostMapping(value = "/updateWorkshift",  produces = "application/json;charset=UTF-8")
	@ResponseBody
	public void modifyWorkshift(
			@RequestBody List<WorkshiftVO> workshiftList
	) {
		log.info("체킁 workshiftList >>>>>> {}", workshiftList);

		service.updateWorkshift(workshiftList);
	}


}
