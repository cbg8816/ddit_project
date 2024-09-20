package kr.or.ddit.empnotice.controller;

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
import kr.or.ddit.empnotice.service.EmpNoticeService;
import kr.or.ddit.vo.EmpNoticeVO;
import kr.or.ddit.vo.EmpVO;

@Controller
@RequestMapping
public class EmpNoticeRetrieveController {

	@Autowired
	private EmpNoticeService service;

	@GetMapping("/empNotice/empNoticeList.do")
	public String list(
		@RequestParam(required = false, defaultValue = "1") int page
		, @ModelAttribute("condition") SimpleCondition simpleCondition
		, Model model
	) {

		PaginationInfo paging = new PaginationInfo(10,5);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		List<EmpNoticeVO> empNoticeList = service.retrieveEmpNoticeList(paging);
		model.addAttribute("empNoticeList", empNoticeList);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:empNotice/empNoticeList";
	}

	  @GetMapping("/index.do")
	    public String index(Model model, String empId) {
		  	EmpVO empvo = service.empList(empId);
		  	model.addAttribute("empvo", empvo);

		  	// 최근 5개의 공지사항만 가져오기
	        PaginationInfo paging = new PaginationInfo(5, 1);
	        paging.setPage(1);
	        List<EmpNoticeVO> recentNotices = service.retrieveEmpNoticeList(paging);
	        model.addAttribute("recentNotices", recentNotices);
	        return "index";
	    }

	@GetMapping("/empNotice/empNoticeDetail.do")
	public String detail(Model model, @RequestParam("what") String empnotiNo) {
		EmpNoticeVO empNotice = service.retrieveEmpNotice(empnotiNo);
		model.addAttribute("empNotice", empNotice);

//		if(model.containsAttribute("redirect")) {
//			return "tiles:empNotice/empNoticeDetail";
//		}else {
//			return "empNotice/empNoticeDetail";
//		}

		return "tiles:empNotice/empNoticeDetail";

	}
}
