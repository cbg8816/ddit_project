package kr.or.ddit.workinrev.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.def.mapper.RoomtypeDefaultMapper;
import kr.or.ddit.vo.DateSlotVO;
import kr.or.ddit.vo.ForRevMemberVO;
import kr.or.ddit.vo.HotelRevVO;
import kr.or.ddit.vo.PossibleRoomsVO;
import kr.or.ddit.vo.WorkInPayVO;
import kr.or.ddit.vo.WorkInRevVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;
import kr.or.ddit.workinrev.dao.WorkInRevMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class WorkInServiceImpl implements WorkInService {

	@Autowired
	private RoomtypeDefaultMapper roomsMapper;

	@Autowired
	private WorkInRevMapper workInmapper;

	@Override
	public List<RoomtypeDefaultVO> showRoomTypes() {
		return roomsMapper.selectAll();
	}

	@Override
	public String makeNewtPK() {
		String lastKey = workInmapper.selectLastPK();
		int temp = Integer.parseInt(lastKey.split("REV")[1]) +1;
		return "REV" + String.format("%05d", temp);
	}

	@Override
	public List<PossibleRoomsVO> getPossibleRooms(WorkInRevVO workInRevVO) {
		return workInmapper.selectPossibleRooms(workInRevVO);
	}

	@Override
	public String makeNewMemPK() {
		String lastKey = workInmapper.selectLastMemPK();
		int temp = Integer.parseInt(lastKey.split("MEM")[1]) + 1;
		return "MEM" + String.format("%05d", temp);
	}

	@Override
	public List<String> makeNewRevRoomPK(int revRoomCnt) {
		String lastKey = workInmapper.selectLastRevRoomId();

		List<String> revRoomIds = new ArrayList<>();
		int temp = Integer.parseInt(lastKey.split("RR")[1]) + 1;

		for(int i=0; i<revRoomCnt; i++) {
			revRoomIds.add("RR" + String.format("%05d", temp+i));
		}

		return revRoomIds;
	}

	@Override
	public void createMember(WorkInRevVO workInRevVO) {
		workInmapper.insertToMember(workInRevVO);
	}

	@Override
	public void newReservation(WorkInRevVO workInRevVO) {
		workInmapper.insertRev(workInRevVO);
	}
	@Override
	public void newReservationWeb(WorkInRevVO workInRevVO) {
		workInmapper.insertRevWeb(workInRevVO);
	}

	public static List<LocalDate> betweenDates(LocalDate start, LocalDate end){
		int days = (int) ChronoUnit.DAYS.between(start, end.plusDays(1));
		return IntStream.iterate(0, i -> i + 1)
				.limit(days)
				.mapToObj(i -> start.plusDays(i))
				.collect(Collectors.toList());
	}

	@Override
	public List<DateSlotVO> createDateSlotData(String startDate, String endDate, List<String> revRoomIds, int revRoomCnt) {
		List<LocalDate> localDateList = new ArrayList<>();
		List<String> tempList = new ArrayList<>();
		List<DateSlotVO> dateslotList = new ArrayList<>();

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		LocalDate start = LocalDate.parse(startDate, formatter);
		LocalDate end = LocalDate.parse(endDate, formatter);

		localDateList = betweenDates(start, end);

		for(LocalDate single : localDateList) {
			tempList.add(single.toString());
		}

		for(int j=0; j<revRoomIds.size(); j++) {
			for(int i=0; i<tempList.size(); i++) {
				DateSlotVO dvo = new DateSlotVO();
				dvo.setRevroomId(revRoomIds.get(j));
				if(i==0) {
					dvo.setRevroomId(revRoomIds.get(j));
					dvo.setDateslotDate(tempList.get(i));
					dvo.setDateslotNm("PM");
					dateslotList.add(dvo);
				}else {
					if(i!=tempList.size()-1) {
						DateSlotVO dvoAM = new DateSlotVO();
						dvoAM.setRevroomId(revRoomIds.get(j));
						dvoAM.setDateslotDate(tempList.get(i));
						dvoAM.setDateslotNm("AM");
						dateslotList.add(dvoAM);
						DateSlotVO dvoPM = new DateSlotVO();
						dvoPM.setRevroomId(revRoomIds.get(j));
						dvoPM.setDateslotDate(tempList.get(i));
						dvoPM.setDateslotNm("PM");
						dateslotList.add(dvoPM);
					}else {
						dvo.setRevroomId(revRoomIds.get(j));
						dvo.setDateslotDate(tempList.get(i));
						dvo.setDateslotNm("AM");
						dateslotList.add(dvo);
					}
				}
			}
		}

		return dateslotList;
	}

	@Override
	public int insertAllDateSlot(List<DateSlotVO> dateSlotData) {
		return workInmapper.insertDateSlot(dateSlotData);
	}

	@Override
	public void modifyRoomStatus(List<String> roomIds) {
		workInmapper.updateRevRoomStatus(roomIds);
	}

	@Override
	public ForRevMemberVO getMemberInfo(String memLoginId) {
		return workInmapper.selectOneMemberInfo(memLoginId);
	}

	@Override
	public void createNewPay(WorkInPayVO workInPayVO) {
		workInmapper.insertNewPay(workInPayVO);
	}

	@Override
	public void modifyMemberMileage(WorkInPayVO workInPayVO) {
		workInmapper.updateMemberMileage(workInPayVO);
	}

}
