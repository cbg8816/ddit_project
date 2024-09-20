package kr.or.ddit.workinrev.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.vo.DateSlotVO;
import kr.or.ddit.vo.ForRevMemberVO;
import kr.or.ddit.vo.PossibleRoomsVO;
import kr.or.ddit.vo.RoomDataVO;
import kr.or.ddit.vo.WorkInRevVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;
import kr.or.ddit.workinrev.service.WorkInServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/workInRev")
public class WorkInRevController {

	@Autowired
	private WorkInServiceImpl service;

	@GetMapping("/formUI.do")
	public String formUI(Model model) {
		List<RoomtypeDefaultVO> roomTypeList = service.showRoomTypes();

		model.addAttribute("roomTypeList", roomTypeList);

		return "tiles:workInRev/workInRev";
	}

	@ResponseBody
	@PostMapping("/getMember.do")
	public ForRevMemberVO getRevMemberInfo(@RequestBody Map<String, String> map) {
		log.info("testText : {}", map.get("memName"));
		return service.getMemberInfo(map.get("memName"));
	}

	/**
	 * 1. 비회원의 경우 멤버가 생성됨
	 * 2. 해당 멤버 id를 통해 total_rev테이블부터 insert
	 * @param workInRevVO
	 */
	@Transactional
	@ResponseBody
	@PostMapping("/insertRev.do")
	public String insertController(@RequestBody WorkInRevVO workInRevVO) {

		List<String> roomNumbers = new ArrayList<>();

		for(RoomDataVO rns : workInRevVO.getRoomData()) {
			roomNumbers.add(rns.getRoomId());
		}

		if(workInRevVO.getWorkInPayVO()!=null) {
			if(workInRevVO.getIsMemberYN().equals("n")) {
				service.createMember(workInRevVO);								//1. 비회원의 경우 멤버 생성
			}
			service.newReservation(workInRevVO);								//2. TOTAL_REV, HOTEL_REV, REV_ROOM 테이블에 vo로 받아온 예약 정보 insert

			List<DateSlotVO> dateSlotData
			= service.createDateSlotData(workInRevVO.getHtrevChkin(), workInRevVO.getHtrevChkout(), workInRevVO.getRevRoomIds(), workInRevVO.getRoomData().size());

			service.insertAllDateSlot(dateSlotData);							//3. DATESLOT에 해당 기간만큼 insert

			service.modifyRoomStatus(roomNumbers);								//4. ROOMSTATUS 입실 상태 6 -> 1로 UPDATE
			service.createNewPay(workInRevVO.getWorkInPayVO());					//5. PAY, MILEAGE 테이블에 INSERT
			service.modifyMemberMileage(workInRevVO.getWorkInPayVO());			//6. 사용 및 적립 마일리지 UPDATE

			return "ok";
		}else {
			return "fail";
		}

	}

	@ResponseBody
	@PostMapping("/getRoomNumber.do")
	public Map<String, Object> getRoomNumber(@RequestBody Map<String, Object> map) {
		WorkInRevVO workInRevVO = new WorkInRevVO();
		List<PossibleRoomsVO> possibleRoomList = new ArrayList<>();
		Map<String, Object> result = new HashMap<>();

		String newKey = service.makeNewtPK();

		List<Integer> revRoom = (List<Integer>) map.get("revRoom");//예약 진행하는 방
		int listsum = revRoom.stream().mapToInt(Integer::intValue).sum();

		String isMem = (String) map.get("isMem");
		String memKey = "";

		List<String> revRoomIds = service.makeNewRevRoomPK(listsum);
		workInRevVO.setRevRoomIds(revRoomIds);

		if(!revRoom.isEmpty()) {
			if(isMem.equals("n")) {
				memKey = service.makeNewMemPK();
			}else {
				memKey = "";
			}

			workInRevVO.setHtrevChkin((String)map.get("htrevChkin"));
			workInRevVO.setHtrevChkout((String)map.get("htrevChkout"));
			possibleRoomList = service.getPossibleRooms(workInRevVO);
		}else {
			newKey = "fail";
		}

		result.put("newKey", newKey);
		result.put("memKey", memKey);
		result.put("possibleRoomList", possibleRoomList);
		result.put("revRoomIds", revRoomIds);

		return result;
	}


}
