package kr.or.ddit.revroom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.def.mapper.RoomtypeDefaultMapper;
import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.hotelrev.HotelCondition;
import kr.or.ddit.revroom.service.RevRoomService;
import kr.or.ddit.vo.RevRoomVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;

@Controller
@RequestMapping("/revroom")
public class RevRoomReadController {


	@Autowired
	private RevRoomService service;

	@Autowired
	private RoomtypeDefaultMapper roomTypeDAO;

	@ModelAttribute("roomTypeList")
	private List<RoomtypeDefaultVO> addAttribute(Model model) {
		return roomTypeDAO.selectAll();
	}

	@GetMapping("/useRoomList.do")
	public String roomUseList(
			@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("hotelCondition") HotelCondition hotelCondition
			, Model model
	) {

		PaginationInfo paging = new PaginationInfo(10, 5);
		paging.setPage(page);
		paging.setHotelCondition(hotelCondition);

		List<RevRoomVO> useRoomList = service.selectUseRoomList(paging);
		model.addAttribute("useRoomList", useRoomList);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:revroom/useRoomList";
	}



}
