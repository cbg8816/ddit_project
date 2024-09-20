package kr.or.ddit.workshift.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.WorkshiftVO;
import kr.or.ddit.workshift.dao.WorkshiftDAO;
import kr.or.ddit.workshift.service.WorkshiftService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/workshift")
public class WorkshiftReadController {

	@Autowired
	private WorkshiftService service;

	@Autowired
	private WorkshiftDAO dao;

	@GetMapping("/workshiftList.do")
	public String list(
//			@RequestParam(required = false, defaultValue = "1") int page
			Model model
			, @RequestParam(required = false) String dal
			, HttpSession session
	) {
		 EmpVO empvo = (EmpVO) session.getAttribute("empvo");
		 String depid = empvo.getDepId();
		 log.info("depid >> {} ",depid);


		List<EmpVO> empList = service.selecteEmpWorkshiftList(dal, depid);
		List<WorkshiftVO> dayList = dao.selectDays(dal);
		log.info("dal >>>>>>>>> {}", dal);
//		log.info("empList {} >>", empList);
//		System.out.println("aa>>>>>>>>>>>>>>" + aa);

		model.addAttribute("empList", empList);
		model.addAttribute("dayList", dayList);




//		PaginationInfo paging = new PaginationInfo(2, 2);
//		paging.setPage(page);



//		PaginationRenderer renderer = new DefaultPaginationRenderer();
//		String pagingHTML = renderer.renderPagination(paging);

//		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:workshift/workshiftList";
	}

}
