package kr.or.ddit.todaysales.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

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

import kr.or.ddit.commons.def.mapper.RoomtypeDefaultMapper;
import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.todaysales.service.TodaySalesService;
import kr.or.ddit.vo.TodayExtCondition;
import kr.or.ddit.vo.TodaySalesVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/todaySales")
public class TodaySalesStatusController {

	@Autowired
	private TodaySalesService service;

	@Autowired
	private RoomtypeDefaultMapper roomTypeDAO;

	@ModelAttribute("roomTypeList")
	private List<RoomtypeDefaultVO> addAttribute(Model model) {
		return roomTypeDAO.selectAll();
	}

	@GetMapping("/salesStatus.do")
	public String salesRetrieveController(
			@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("todayExtCondition") TodayExtCondition todayExtCondition
			, Model model) {

//		Calendar cal = Calendar.getInstance();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		String today = sdf.format(cal.getTime());

		PaginationInfo paging = new PaginationInfo(5, 3);
		paging.setPage(page);
		paging.setTodayExtCondition(todayExtCondition);

		PaginationRenderer renderer = new DefaultPaginationRenderer();

        List<TodaySalesVO> todaySalesList = service.showTodaySalesList(paging);
        String pagingHTML = renderer.renderPagination(paging);

        model.addAttribute("todaySalesList", todaySalesList);
		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:todaySales/salesStatus";
	}

}
