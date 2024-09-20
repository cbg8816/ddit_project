package kr.or.ddit.hotelrev.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.def.mapper.RoomtypeDefaultMapper;
import kr.or.ddit.hotelrev.service.HotelRevService;
import kr.or.ddit.vo.HotelRevVO;
import kr.or.ddit.vo.RevRoomVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hotelrev/hotelRevInsert.do")
public class HotelRevInsertController {

	@Autowired
	private HotelRevService service;

	@Autowired
	private RoomtypeDefaultMapper roomTypeDAO;

	@ModelAttribute("roomTypeList")
	private List<RoomtypeDefaultVO> addAttribute(Model model) {
		return roomTypeDAO.selectAll();
	}

	@GetMapping 
	public String formUI() {
		return "tiles:hotelrev/hotelRevInsert";
	}

//	@ResponseBody
	@PostMapping
	public String formDataProcess(
			@ModelAttribute("hotelRev") HotelRevVO hotelRev
//			@RequestBody HotelRevVO hotelRev
			, Errors errors
			, RedirectAttributes redirectAttributes

	) throws ParseException {
		//log.info("formDataProcess : {}", hotelRev);
		log.info("formDataProcess errors : {}", errors.hasErrors());
		log.info("formDataProcess errors : {}", errors.getFieldErrorCount());
		log.info("formDataProcess errors : {}", errors.getAllErrors());
		String lvn = "";
//		log.info("요기서 항상 체크 {}", hotelRevVO);

//		List<RevRoomVO> revRoomList = hotelRev.getRevRoomList();
//		List<String> test = new ArrayList<>();
//
//	  for (RevRoomVO revRoom : revRoomList) {
//		  	revRoom.getRoomId();
//      }

//		String lvn[] = {"ok"};
//		log.info("요기서 항상 체크 {}", hotelRev);
//		service.insertHotelRev(hotelRev);


		redirectAttributes.addFlashAttribute("hotelRev", hotelRev);

		if (errors.hasErrors()) {
			// 실패
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, errors);
			lvn = "redirect:/hotelrev/hotelRevInsert.do";
		} else {
			// 성공
			service.insertHotelRev(hotelRev);
			lvn = "redirect:/hotelrev/hotelRevUpdate.do?what="
						+ hotelRev.getTrevId();
		}


		return lvn;
	}


}
