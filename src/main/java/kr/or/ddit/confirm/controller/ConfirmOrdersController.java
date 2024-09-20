package kr.or.ddit.confirm.controller;

import java.util.List;
import java.util.Map;

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
import kr.or.ddit.confirm.service.ConfirmOrdersServiceImpl;
import kr.or.ddit.vo.ConfirmCondition;
import kr.or.ddit.vo.ConfirmVO;
import kr.or.ddit.vo.TodayExtCondition;

@Controller
@RequestMapping("/confirm")
public class ConfirmOrdersController {

	@Autowired
	private ConfirmOrdersServiceImpl service;

	@GetMapping("/confirmList.do")
	public String showNeedConfirmList(@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("confirmCondition") ConfirmCondition confirmcondition
			, Model model) {

		PaginationInfo paging = new PaginationInfo(5, 3);
		paging.setPage(page);
		paging.setConfirmCondition(confirmcondition);

		PaginationRenderer renderer = new DefaultPaginationRenderer();

		List<ConfirmVO> confirmList = service.requiredConfirmList(paging);
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("confirmList", confirmList);
		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:confirm/confirmList";
	}


}
