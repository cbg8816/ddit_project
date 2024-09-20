package kr.or.ddit.totalrev.controller;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.mileage.service.MileageService;
import kr.or.ddit.totalrev.service.totalRevService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.DateSlotVO;
import kr.or.ddit.vo.ForRevMemberVO;
import kr.or.ddit.vo.PossibleRoomsVO;
import kr.or.ddit.vo.RoomDataVO;
import kr.or.ddit.vo.RoomtypeVO;
import kr.or.ddit.vo.WorkInPayVO;
import kr.or.ddit.vo.WorkInRevVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;
import kr.or.ddit.vo.def.TotalRevDefaultVO;
import kr.or.ddit.workinrev.dao.WorkInRevMapper;
import kr.or.ddit.workinrev.service.WorkInService;
import kr.or.ddit.workinrev.service.WorkInServiceImpl;

@Controller
@RequestMapping("/totalRev")
public class totalRevController {
	
	@Autowired
	WorkInService workInService;
	
	@Autowired
	WorkInRevMapper workMapper;
	
	@Autowired
	MileageService milService;
	
	@Autowired
	totalRevService service;
	
	 @PostMapping("/totalRevDate")
	    public ResponseEntity<Map<String, String>> handleDateRange(@RequestBody Map<String, String> dateRange) {
	        String startDay = dateRange.get("startDay");
	        String lastDay = dateRange.get("lastDay");
	        
	        WorkInRevVO workInRev = new WorkInRevVO();
	        
	        workInRev.setHtrevChkin(startDay);
	        workInRev.setHtrevChkout(lastDay);
	        
	        List<PossibleRoomsVO> possibleRoomsList =  workMapper.selectPossibleRooms(workInRev);
	        
	        String roomType1 = "N";
	        String roomType2 = "N";
	        String roomType3 = "N";
	        String roomType4 = "N";
	        String roomType5 = "N";
	        
	        for (PossibleRoomsVO possibleRoomsVO : possibleRoomsList) {
	            switch (possibleRoomsVO.getRoomtypeId()) {
	                case "1":
	                    roomType1 = "Y";
	                    break;
	                case "2":
	                    roomType2 = "Y";
	                    break;
	                case "3":
	                    roomType3 = "Y";
	                    break;
	                case "4":
	                    roomType4 = "Y";
	                    break;
	                case "5":
	                    roomType5 = "Y";
	                    break;
	            }
	        }
	        Map<String, String> response = new HashMap<>();
	        response.put("roomType1", roomType1);
	        response.put("roomType2", roomType2);
	        response.put("roomType3", roomType3);
	        response.put("roomType4", roomType4);
	        response.put("roomType5", roomType5);

	        return ResponseEntity.ok(response);
	    }
	 
	 @PostMapping("/totalRevPayment")
	 public String totalRevPayment (
			 @RequestParam("roomId") String roomNo
			 , @RequestParam("humanNo") String humanNo
			 , @RequestParam("startDay") String startDate
			 , @RequestParam("lastDay") String lastDate
			 ,Model model) {
		 //전달할 값 방타입, 날짜, 인원수
		 char roomChar = roomNo.charAt(roomNo.length()-1);
		 String roomStr = roomChar+"";
		 RoomtypeDefaultVO roomType = service.roomTypeData(roomStr);
		 LocalDate date = LocalDate.now();
		 

		  // 날짜 형식 지정
		  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		  // 문자열을 LocalDate 객체로 변환
		  LocalDate startDay = LocalDate.parse(startDate, formatter);
		  LocalDate lastDay = LocalDate.parse(lastDate, formatter);
		 
		 Period period = Period.between(startDay, lastDay);
		 
		 int stayDay = period.getDays();
		 
		 model.addAttribute("roomType",roomType);
		 model.addAttribute("date",date);
		 model.addAttribute("humanNo",humanNo);
		 model.addAttribute("startDay",startDay);
		 model.addAttribute("lastDay",lastDay);
		 model.addAttribute("stayDay",stayDay);
		 
		 return "wiles:/introduce/payDetail";
	 }
	 
	 @PostMapping("/totalRevPaymentData")
	 public String totalRevPaymentData (
			 @RequestParam("name") String name
			 ,@RequestParam("memId") String memId
			 , @RequestParam("Phone") String phone
			 , @RequestParam("email") String email
			 , @RequestParam("carNo") String carNo
			 , @RequestParam("revCn") String revCn
			 , @RequestParam("roomType") String roomTypeId
			 , @RequestParam("roomTypePrice") String roomTypePrice
			 , @RequestParam("startDay") String startDay
			 , @RequestParam("lastDay") String lastDay
			 , @RequestParam("stayDay") String stayDay
			 , @RequestParam("humanNo") String humanNo
			 , @RequestParam("milUse") String milUse
			 , @RequestParam("milEarn") String milEarn
			 ,Model model
			 ) {
		 
		 String hoterRevId = workInService.makeNewtPK();
		 WorkInRevVO workInRev = new WorkInRevVO();
		 if(memId.isEmpty()) {
			 memId =  workInService.makeNewMemPK();
			 workInRev.setMemId(memId);
			 workInService.createMember(workInRev);
		 }
		 List<String> roomId = workInService.makeNewRevRoomPK(1);
		 
		 RoomDataVO roomData = new RoomDataVO();
		 List<RoomDataVO> roomDataList = new ArrayList<>();
	        
	     workInRev.setHtrevChkin(startDay);
	     workInRev.setHtrevChkout(lastDay);
	     workInRev.setMemName(name);
	     workInRev.setMemTel(phone);
		 List<PossibleRoomsVO> possibleRoomsList =  workMapper.selectPossibleRooms(workInRev);
		 
		 roomData.setRevroomId(roomId.get(0));
		 for (PossibleRoomsVO possibleRoomsVO : possibleRoomsList) {
			if(possibleRoomsVO.getRoomtypeId().equals(roomTypeId)) {
				roomData.setRoomId(possibleRoomsVO.getRoomId());
				break;
			}
		}
		 roomData.setHtrevId(hoterRevId);
		 roomData.setRoomtypeId(roomTypeId);
		 roomData.setRevroomPrice(Integer.parseInt(roomTypePrice));
		 WorkInRevVO workIn = new WorkInRevVO();
		 roomDataList.add(roomData);
		 workIn.setRoomData(roomDataList);
		 workIn.setTrevId(hoterRevId);
		 workIn.setMemId(memId);
		 workIn.setMemName(name);
		 workIn.setMemTel(phone);
		 workIn.setTrevCarno(carNo);
		 workIn.setTrevAdult(Integer.parseInt(humanNo));
		 workIn.setTrevChild(0);
		 workIn.setTrevPayopt("KAKAOTALK");
		 workIn.setTrevRtype("0"+roomTypeId);
		 workIn.setHtrevChkin(startDay);
		 workIn.setHtrevChkout(lastDay);
		 workIn.setHtrevStay(Integer.parseInt(stayDay));
		 workIn.setHtrevTprice(Integer.parseInt(roomTypePrice));
		 model.addAttribute("workIn",workIn);
		 LocalDate nowDate = LocalDate.now();
		 model.addAttribute("nowDate",nowDate);
		 
		 List<DateSlotVO> dateSlotData
			= workInService.createDateSlotData(workIn.getHtrevChkin(), workIn.getHtrevChkout(), roomId, workIn.getRoomData().size());
		 
		 WorkInPayVO workInPay = new WorkInPayVO();
		 
		 workInPay.setPayId(1);
		 workInPay.setPayPayopt("KAKAOTALK");
		 workInPay.setPayTprice(roomTypePrice);
		 workInPay.setPayDate(nowDate+"");
		 workInPay.setTrevId(hoterRevId);
		 workInPay.setPayCm(hoterRevId);
		 workInPay.setMilId(1);
		 workInPay.setMemId(memId);
		 workInPay.setMilEarn(milEarn);
		 workInPay.setMilUse(milUse);
		 
		 workInService.newReservationWeb(workIn);
		 workInService.createNewPay(workInPay);
		 workInService.modifyMemberMileage(workInPay);
		 workInService.insertAllDateSlot(dateSlotData);
		 roomDataList.clear();
		 roomId.clear();
		return "wiles:/introduce/payComplate"; 
	 }
	 
	 @PostMapping("/memMil")
	 public ResponseEntity<Integer> totalRevmemMil(@RequestParam("memName") String memName , Model model) {
		 ForRevMemberVO memMil = workMapper.selectOneMemberInfo(memName);
		 model.addAttribute("memMil", memMil);
		 return ResponseEntity.ok(memMil.getMemMil());
	 }
			 
}
