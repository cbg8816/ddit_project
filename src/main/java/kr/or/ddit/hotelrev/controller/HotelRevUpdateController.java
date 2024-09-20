package kr.or.ddit.hotelrev.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.def.mapper.RoomtypeDefaultMapper;
import kr.or.ddit.hotelrev.dao.HotelRevDAO;
import kr.or.ddit.hotelrev.service.HotelRevService;
import kr.or.ddit.revroom.dao.RevRoomDAO;
import kr.or.ddit.revroom.service.RevRoomService;
import kr.or.ddit.vo.HotelRevVO;
import kr.or.ddit.vo.RevRoomVO;
import kr.or.ddit.vo.def.RevRoomDefaultVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hotelrev/hotelRevUpdate.do")
public class HotelRevUpdateController {

	@Autowired
	private HotelRevService service;

	@Autowired
	private RoomtypeDefaultMapper roomTypeDAO;


	@ModelAttribute("roomTypeList")
	private List<RoomtypeDefaultVO> addAttribute(Model model) {
		return roomTypeDAO.selectAll();
	}



	@GetMapping
	public String formUI(
			Model model
			, HotelRevVO hotelRevVO
			, @RequestParam("what") String htrevId
//			, @RequestParam("what2") String revroomId
	) {
//		log.info("formUI : {}", htrevId);
//		log.info("formUI hotelRev : {}", model.containsAttribute("hotelRev"));

		hotelRevVO.setHtrevId(htrevId);
//		hotelRevVO.setRevroomId(revroomId);

		hotelRevVO = service.selectHotelRev(hotelRevVO);
		model.addAttribute("hotelRev", hotelRevVO);

		log.info("formUI : {}", hotelRevVO);
		return "tiles:hotelrev/hotelRevUpdate";
	}

	@PostMapping
	public String formDataProcess(@ModelAttribute("hotelRev") HotelRevVO hotelRev
//			, @ModelAttribute("revRoom") RevRoomDefaultVO revRoom
			, Errors errors, RedirectAttributes redirectAttributes) {
		log.info("formDataProcess : {}", hotelRev);
		log.info("formDataProcess errors : {}", errors.hasErrors());
		log.info("formDataProcess errors : {}", errors.getFieldErrorCount());
		log.info("formDataProcess errors : {}", errors.getAllErrors());

		List<ObjectError> errorList = errors.getAllErrors();
		for (ObjectError objectError : errorList) {
			log.info("formDataProcess errors : {}", objectError.getCode() );
			log.info("formDataProcess errors : {}", objectError.getObjectName());
			log.info("formDataProcess errors : {}", objectError.getDefaultMessage());
		}

		String lvn = "";
		redirectAttributes.addFlashAttribute("hotelRev", hotelRev);
		if (errors.hasErrors()) {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, errors);
			lvn = "redirect:/hotelrev/hotelRevUpdate.do?what=" + hotelRev.getHtrevId();
		} else {
			service.updateHotelRev(hotelRev);
//			service.updateRevRoom(hotelRev);
//			service.updateTotalRev(hotelRev);
			lvn = "redirect:/hotelrev/hotelRevList.do";
		}

		return lvn;
	}
}
