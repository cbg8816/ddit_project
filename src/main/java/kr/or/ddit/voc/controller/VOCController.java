package kr.or.ddit.voc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.inquire.service.InquireService;
import kr.or.ddit.vo.InquireVO;
import kr.or.ddit.voc.service.VOCService;

/**
 * VOC Controller
 *
 */
@Controller
@RequestMapping("voc")
public class VOCController {
	@Autowired
	private VOCService service;
	@Autowired
	private InquireService inqService;

	@GetMapping
	public String vocList(
			@RequestParam(required = false, defaultValue = "1") int page
			, Model model
			)
	{
		PaginationInfo paging = new PaginationInfo(10, 5);

		paging.setPage(page);

		List<InquireVO> vocList = service.selectVOCList(paging);
		model.addAttribute("vocList", vocList);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:voc/vocList";
	}

	@GetMapping(value="/detail", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public InquireVO vocDetail(@RequestParam String what) {
		InquireVO inquire = new InquireVO();
		inquire = inqService.selectInquire(what);

		return inquire;
	}
}
