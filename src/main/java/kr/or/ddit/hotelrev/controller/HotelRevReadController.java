package kr.or.ddit.hotelrev.controller;

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
import kr.or.ddit.hotelrev.HotelCondition;
import kr.or.ddit.hotelrev.service.HotelRevService;
import kr.or.ddit.vo.ExtrachargesVO;
import kr.or.ddit.vo.HotelRevVO;
import kr.or.ddit.vo.RevRoomVO;
import kr.or.ddit.vo.WorkshiftVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hotelrev")
public class HotelRevReadController {

	@Autowired
	private HotelRevService service;

	@Autowired
	private RoomtypeDefaultMapper roomTypeDAO;


	@ModelAttribute("roomTypeList")
	private List<RoomtypeDefaultVO> addAttribute(Model model) {
		return roomTypeDAO.selectAll();
	}

	@GetMapping("/hotelRevList.do")
	public String list(
			@RequestParam(required = false, defaultValue = "1") int page
//			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, @ModelAttribute("hotelCondition") HotelCondition hotelCondition
			, Model model
	) {

		PaginationInfo paging = new PaginationInfo(10, 5);
		paging.setPage(page);
//		paging.setSimpleCondition(simpleCondition);
		paging.setHotelCondition(hotelCondition);

		List<HotelRevVO> hotelRevList = service.selectHotelRevList(paging);
		model.addAttribute("hotelRevList" ,hotelRevList);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:hotelrev/hotelRevList";
	}

	@GetMapping(value = "/arriveList",produces = "application/json;charset=UTF-8")
	public void arriveYN(
			@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("hotelCondition") HotelCondition hotelCondition
//			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model
	) {
		PaginationInfo paging = new PaginationInfo(5, 3);
		paging.setPage(page);
//		paging.setSimpleCondition(simpleCondition);
		paging.setHotelCondition(hotelCondition);
//		log.info("1111111111111{}", simpleCondition);

		List<HotelRevVO> arriveList = service.selectArriveYNList(paging);
		model.addAttribute("aList", arriveList);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML2", pagingHTML);

//		return "tiles:hotelrev/hotelRevList";

	}

	@GetMapping(value = "/arriveComplete")
	@ResponseBody
	public void arriveComplete(@RequestParam String what) {
		service.updateArriveComplete(what);
	}

	@GetMapping("/hotelRevDetail.do")
	public String detail(@RequestParam("what") String what, Model model) {
		HotelRevVO hotelrevVO = service.selectOneHtrev(what);
		List<RevRoomVO> revroomList = service.selectRevroomList(what);
		List<ExtrachargesVO> extrachargeList = service.selectExtrachargeList(what);
		int totalExtra = service.selectTotalExtra(what);

		model.addAttribute("hotelrevVO", hotelrevVO);
		model.addAttribute("revroomList", revroomList);
		model.addAttribute("extrachargeList", extrachargeList);
		model.addAttribute("totalExtra", totalExtra);
		return "tiles:hotelrev/hotelRevDetail";
	}

	@PostMapping(value = "/updateRevSt",  produces = "application/json;charset=UTF-8")
	@ResponseBody
	public void modifyRevSt(
			@RequestBody HotelRevVO htrevVO
	) {
		log.info("체킁 data >>>>>> {}", htrevVO);

		service.updateRevSt(htrevVO);
	}



}
