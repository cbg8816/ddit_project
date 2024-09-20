package kr.or.ddit.inquire.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.inquire.service.InquireService;
import kr.or.ddit.vo.InquireVO;

@Controller
@RequestMapping("/web/inquire")
public class InquireListController {
	@Autowired
	private InquireService InquireService;

	@GetMapping("list.do")
	public String selectInquireList(
			@RequestParam(required = false, defaultValue = "1") int page
			, Model model
			, @ModelAttribute("condition") SimpleCondition simpleCondition)
	{
		PaginationInfo paging = new PaginationInfo(10, 5);

		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		List<InquireVO> inquireList = InquireService.selectInquireList(paging);
		model.addAttribute("inquireList", inquireList);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "wiles:inquire/list";
	}

	@GetMapping("inquirePage.do")
	public String selectInquireListMember(
			@RequestParam(required = false, defaultValue = "1") int page
			, Model model
			, @RequestParam("what") String memId)
	{
		PaginationInfo paging = new PaginationInfo(10, 2);

		paging.setPage(page);

		List<InquireVO> inquireListMember = InquireService.selectInquireList(paging);
		model.addAttribute("inquireList", inquireListMember);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "wiles:inquire/listMember";
	}

	@GetMapping("detail.do")
	public String selectInquire(@RequestParam("what") String inqNo, Model model) {
		InquireVO inquire = InquireService.selectInquire(inqNo);
		model.addAttribute("inquire", inquire);

		return "wiles:inquire/detail";
	}

	@GetMapping("delete.do")
	public String deleteInquire(@RequestParam("what") String inqNo, RedirectAttributes redirectAttributes) {
		InquireService.deleteInquire(inqNo);
		redirectAttributes.addFlashAttribute("message", "이용문의 삭제 완료!");

		return "redirect:list.do";
	}
}
