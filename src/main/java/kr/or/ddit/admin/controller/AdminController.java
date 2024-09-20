package kr.or.ddit.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.admin.AdminCondition;
import kr.or.ddit.admin.service.AdminService;
import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.vo.AdminVO;

/**
 * AdminController(관리자 컨트롤러).
 *
 */
@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private AdminService service;

	@GetMapping
	public String selectnList(
			Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("adminCondition") AdminCondition adminCondition
			)
	{
		PaginationInfo paging = new PaginationInfo(10, 5);

		paging.setPage(page);
		paging.setAdminCondition(adminCondition);

		List<AdminVO> list = service.selectnList(paging);
		model.addAttribute("list", list);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:admin/list";
	}
}
