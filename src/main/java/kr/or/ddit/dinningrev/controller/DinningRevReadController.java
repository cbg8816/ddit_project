package kr.or.ddit.dinningrev.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.def.mapper.DinningRevDefaultMapper;
import kr.or.ddit.commons.def.mapper.DintypeDefaultMapper;
import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.dinningrev.DinningCondition;
import kr.or.ddit.dinningrev.service.DinningRevService;
import kr.or.ddit.vo.DinningRevVO;
import kr.or.ddit.vo.def.DintypeDefaultVO;

@Controller
@RequestMapping("/dinrev/dinRevList.do")
public class DinningRevReadController {

	@Autowired
	private DinningRevService service;

	@Autowired
	private DintypeDefaultMapper dinTypeDAO;

	@ModelAttribute("dinTypeList")
	private List<DintypeDefaultVO> addAttribute(Model model) {
		return dinTypeDAO.selectAll();
	}


	@RequestMapping
	public String list(
			@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("dinCondition") DinningCondition dinCondition
			, Model model
	) {
		PaginationInfo paging = new PaginationInfo(10, 5);
		paging.setPage(page);
		paging.setDinCondition(dinCondition);

		List<DinningRevVO> dinRevList = service.selectDinRevList(paging);
		model.addAttribute("dinRevList", dinRevList);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:dinrev/dinRevList";
	}


}
