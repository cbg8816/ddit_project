package kr.or.ddit.room.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.emp.dao.EmpMapper;
import kr.or.ddit.room.service.RoomService;
import kr.or.ddit.roomstatus.dao.RoomstatusMapper;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.RoomVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/roommaintenance")
public class RoomRetrieveController {

	@Autowired
	private RoomService service;

	@Autowired
	private EmpMapper empmapper;

	@Autowired
	private RoomstatusMapper statusmapper;


	/**
	 * 다른 mapper에서 값을 불러올때 사용함 직원 전체 조회
	 * @param model
	 * @return
	 */
	@ModelAttribute("empList")
	private List<EmpVO> addAttribute(Model model){
		return empmapper.empdepList();
	}


	/**
	 * 룸 전체 조회
	 * @param model
	 * @return
	 */
	@GetMapping("/roomList.do")
	public String roomList(Model model) {
		List<RoomVO> roomList = service.readRoomList();
		model.addAttribute("roomList", roomList);
		return "tiles:room/roommaintenance";
	}

	/**
	 * 룸 상세 보기
	 * @param roomId
	 * @return
	 */
	@GetMapping("/roomDetail.do")
	@ResponseBody
	public RoomVO detail(@RequestParam("what")String roomId) {
		RoomVO room = service.readRoom(roomId);
		return room;
	}

	@GetMapping
	@ResponseBody
	public String formUI() {
		return "tiles:room/roommaintenance";
	}

	/**
	 * 키핑 등록, 상태=3, 매니저업데이트
	 * @param room
	 * @param errors
	 * @param redirectAttributes
	 * @return
	 */
	@PostMapping("/roomInsert.do")
	public String insertRoom (@ModelAttribute("room")RoomVO room
			, Errors errors
			, RedirectAttributes redirectAttributes ) {
		List<ObjectError> errorList = errors.getAllErrors();
		for (ObjectError objectError : errorList) {
			log.info("formDataProcess errors : {}", objectError.getCode() );
			log.info("formDataProcess errors : {}", objectError.getObjectName());
			log.info("formDataProcess errors : {}", objectError.getDefaultMessage());
		}

		String lvn = "";

		if(errors.hasErrors()) {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, errors);
			lvn = "redirect:/roommaintenance/roomInsert.do?what="+room.getRoomId();
			return lvn;
		}else {
			service.createMaintenanceRoom(room);
			return  "redirect:/roommaintenance/roomDetail.do?what="+room.getRoomId();

		}
	}


	/**
	 * roomSt=6, hkpStatus=정비완료, 매니저 룸번호 =null
	 * @param room
	 * @param errors
	 * @param redirectAttributes
	 * @return
	 */
	@PostMapping("/roomUpdateSt.do")
	public String updatekeepingfinish (@ModelAttribute("room")RoomVO room
			, Errors errors
			, RedirectAttributes redirectAttributes ) {
		List<ObjectError> errorList = errors.getAllErrors();
		for (ObjectError objectError : errorList) {
			log.info("formDataProcess errors : {}", objectError.getCode() );
			log.info("formDataProcess errors : {}", objectError.getObjectName());
			log.info("formDataProcess errors : {}", objectError.getDefaultMessage());
		}

		String lvn = "";

		if(errors.hasErrors()) {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, errors);
			lvn = "redirect:/roommaintenance/roomUpdateSt.do?what="+room.getRoomId();
		}else {
			service.modifyKeepingFinish(room);
			lvn = "redirect:/roommaintenance/roomDetail.do?what="+room.getRoomId();
		}
		return lvn;
	}


	/**
	 * roomSt=6, HKB_COMPLE=수리완료, 매니저 룸번호 =null
	 * @param room
	 * @param errors
	 * @param redirectAttributes
	 * @return
	 */
	@PostMapping("/roombrokenUpdateSt.do")
	public String updatebrokenfinish (@ModelAttribute("room")RoomVO room
			, Errors errors
			, RedirectAttributes redirectAttributes ) {
		List<ObjectError> errorList = errors.getAllErrors();
		for (ObjectError objectError : errorList) {
			log.info("formDataProcess errors : {}", objectError.getCode() );
			log.info("formDataProcess errors : {}", objectError.getObjectName());
			log.info("formDataProcess errors : {}", objectError.getDefaultMessage());
		}

		String lvn = "";

		if(errors.hasErrors()) {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, errors);
			lvn = "redirect:/roommaintenance/roombrokenUpdateSt.do?what="+room.getRoomId();
		}else {
			service.modifyBrokenFinish(room);
			lvn = "redirect:/roommaintenance/roomDetail.do?what="+room.getRoomId();
		}
		return lvn;
	}


	/**
	 * roomSt=4, 담당자 배정, 수리중으로 변환
	 * @param room
	 * @param errors
	 * @param redirectAttributes
	 * @return
	 */
	@PostMapping("/roombrokenUpdateRepair.do")
	public String updatebrokenRepair (@ModelAttribute("room")RoomVO room
			, Errors errors
			, RedirectAttributes redirectAttributes ) {
		List<ObjectError> errorList = errors.getAllErrors();
		for (ObjectError objectError : errorList) {
			log.info("formDataProcess errors : {}", objectError.getCode() );
			log.info("formDataProcess errors : {}", objectError.getObjectName());
			log.info("formDataProcess errors : {}", objectError.getDefaultMessage());
		}

		String lvn = "";

		if(errors.hasErrors()) {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, errors);
			lvn = "redirect:/roommaintenance/roombrokenUpdateRepair.do?what="+room.getRoomId();
		}else {
			service.modifyBrokenRepair(room);
			lvn = "redirect:/roommaintenance/roomDetail.do?what="+room.getRoomId();
		}
		return lvn;
	}


// 상타입에 따른 가용객실 카운터
	@ModelAttribute("roomtypestatus1")
	public int roomtypestatus1() {
		return statusmapper.selectroomTypeid1();
	}
	@ModelAttribute("roomtypestatus2")
	public int roomtypestatus2() {
		return statusmapper.selectroomTypeid2();
	}
	@ModelAttribute("roomtypestatus3")
	public int roomtypestatus3() {
		return statusmapper.selectroomTypeid3();
	}
	@ModelAttribute("roomtypestatus4")
	public int roomtypestatus4() {
		return statusmapper.selectroomTypeid4();
	}
	@ModelAttribute("roomtypestatus5")
	public int roomtypestatus5() {
		return statusmapper.selectroomTypeid5();
	}

// 객실 상태에 따른 카운터
	@ModelAttribute("roomstatus1")
	public int roomstatus1() {
		return statusmapper.selectroomStatus1();
	}
	@ModelAttribute("roomstatus2")
	public int roomstatus2() {
		return statusmapper.selectroomStatus2();
	}
	@ModelAttribute("roomstatus3")
	public int roomstatus3() {
		return statusmapper.selectroomStatus3();
	}
	@ModelAttribute("roomstatus4")
	public int roomstatus4() {
		return statusmapper.selectroomStatus4();
	}
	@ModelAttribute("roomstatus5")
	public int roomstatus5() {
		return statusmapper.selectroomStatus5();
	}
	@ModelAttribute("roomstatus6")
	public int roomstatus6() {
		return statusmapper.selectroomStatus6();
	}

}






