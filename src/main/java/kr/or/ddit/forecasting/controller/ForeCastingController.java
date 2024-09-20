package kr.or.ddit.forecasting.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.forecasting.dao.ForeCastingMapper;
import kr.or.ddit.vo.DateVO;
import kr.or.ddit.vo.ForeCastingVO;
import kr.or.ddit.vo.RoomtypeVO;
import kr.or.ddit.vo.GayongVO;

@Controller
@RequestMapping("/forecasting/forecasting.do")
public class ForeCastingController {

	@Autowired
	private ForeCastingMapper mapper;

	@GetMapping
	public String foreCastingRetrieveController(
		Model model
		, @RequestParam(required = false, name = "startDate") String startDate
		, @RequestParam(required = false, name = "endDate") String endDate

	) {

		List<DateVO> dayList = mapper.dayList(startDate, endDate);
//		List<ForeCastingVO> gayongList = mapper.selectForeCasting();
		List<GayongVO> gayongList = mapper.selectForeCasting(startDate, endDate);

//		List<Test2VO> notInRoomId = mapper.selectNotInRoomId();
		List<Map<String, String>> notInRoomId = mapper.selectNotInRoomId(startDate, endDate);

		List<RoomtypeVO> realDataList = new  ArrayList<RoomtypeVO>();

		List<ForeCastingVO> fcList = new ArrayList<ForeCastingVO>();
		RoomtypeVO rtVO = null;
		ForeCastingVO fcVO = null;
		String roomTypeId = gayongList.get(0).getRoomtypeId();
		String roomId = null;
		String roomNm = null;
		for(int i = 0; i < gayongList.size(); i++) {
			int cnt = 0;
			GayongVO gayongVO = gayongList.get(i);
			fcVO = new ForeCastingVO();
			if(roomTypeId.equals(gayongVO.getRoomtypeId())) {
				fcVO.setDateSeq(gayongVO.getDateSeq());
				fcVO.setAvailableRooms(gayongVO.getAvailableRooms());
				fcList.add(fcVO);
			}else {
				roomTypeId = gayongVO.getRoomtypeId();
				rtVO = new RoomtypeVO();
				rtVO.setRoomtypeId(roomId);
				rtVO.setRoomtypeNm(roomNm);
				rtVO.setForecastingList(fcList);
				realDataList.add(rtVO);
				fcList = new ArrayList<ForeCastingVO>();
				i = i - 1;
			}

			if(i == gayongList.size() - 1) {
				rtVO = new RoomtypeVO();
				rtVO.setRoomtypeId(roomId);
				rtVO.setRoomtypeNm(roomNm);
				rtVO.setForecastingList(fcList);
				realDataList.add(rtVO);
			}
			roomId = gayongVO.getRoomtypeId();
			roomNm = gayongVO.getRoomtypeNm();
		}

		// 예약 현황 빼기
		for(int i = 0; i < realDataList.size(); i++) {
			RoomtypeVO roomTypeVO = realDataList.get(i);
			for(int j = 0; j < notInRoomId.size(); j++) {
				Map<String, String> param = notInRoomId.get(j);
				for(int k = 0; k < realDataList.get(i).getForecastingList().size(); k++) {
					ForeCastingVO foreVO = realDataList.get(i).getForecastingList().get(k);
					if(roomTypeVO.getRoomtypeId().equals(param.get("ROOMTYPE_ID"))
							&& foreVO.getDateSeq().split(" ")[0].equals(param.get("DATESLOT_DATE"))) {
//						&& foreVO.getDateSeq().equals(param.get("DATESLOT_DATE"))) {
						foreVO.setAvailableRooms(foreVO.getAvailableRooms() - 1);
					}
				}
			}
		}

		List<Integer> totalList = new ArrayList<Integer>();

		for(int i = 0; i < fcList.size(); i++) {
			Integer total = 0;
			for(int j = 0; j < realDataList.size(); j++) {
				RoomtypeVO roomTypeVO = realDataList.get(j);
				List<ForeCastingVO> foreList = realDataList.get(j).getForecastingList();
				Integer rrr = foreList.get(i).getAvailableRooms();
				total += rrr;
			}
			totalList.add(total);
			System.out.println("total" + total);
		}

		model.addAttribute("dayList", dayList);
		model.addAttribute("gayongList", gayongList);
		model.addAttribute("notInRoomId", notInRoomId);
		model.addAttribute("realDataList", realDataList);
		model.addAttribute("totalList", totalList);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);

		return "tiles:forecasting/forecasting";
	}

}
