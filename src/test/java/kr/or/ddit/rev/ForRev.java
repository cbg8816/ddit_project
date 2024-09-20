package kr.or.ddit.rev;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.vo.DateSlotVO;
import kr.or.ddit.vo.RoomDataVO;
import kr.or.ddit.vo.WorkInRevVO;
import kr.or.ddit.workinrev.dao.WorkInRevMapper;
import kr.or.ddit.workinrev.service.WorkInServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
class ForRev {

	@Autowired
	private WorkInRevMapper mapper;

	@Autowired
	private WorkInServiceImpl service;

	@Test
	void makeKey() {

		String lastKey = mapper.selectLastPK();

		int temp = Integer.parseInt(lastKey.split("REV")[1]);

		String newKey = "REV" + String.format("%05d", temp+1);

		log.info("last : {}", newKey);

	}


	public static List<LocalDate> betweenDates(LocalDate start, LocalDate end){
		int days = (int) ChronoUnit.DAYS.between(start, end.plusDays(1));
		return IntStream.iterate(0, i -> i + 1)
				.limit(days)
				.mapToObj(i -> start.plusDays(i))
				.collect(Collectors.toList());
	}

	@Test
	void makeDays() {
		List<String> tempList = new ArrayList<>();
		List<LocalDate> localDateList = new ArrayList<>();
		List<String> dateList = new ArrayList<>();
		List<String> dateNm = new ArrayList<>();

		String in = "2024-09-01";
		String out = "2024-09-05";
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		LocalDate start = LocalDate.parse(in, formatter);
		LocalDate end = LocalDate.parse(out, formatter);

		log.info("list1 : {} : ", betweenDates(start, end));

		localDateList = betweenDates(start, end);

		log.info("list2 : {} : ", localDateList);

		for(LocalDate single : localDateList) {
			tempList.add(single.toString());
		}

		log.info("list3 : {} : ", tempList);

		for(int i=0; i<tempList.size(); i++) {
			if(i==0) {
				dateList.add(tempList.get(i));
				dateNm.add("PM");
			}else {
				if(i!=tempList.size()-1) {
					dateList.add(tempList.get(i));
					dateList.add(tempList.get(i));
					dateNm.add("AM");
					dateNm.add("PM");
				}else {
					dateList.add(tempList.get(i));
					dateNm.add("AM");
				}
			}
		}

		log.info("list4 : {}", dateList);
		log.info("list5 : {}", dateNm);

	}

	@Test
	void makeRevRoomIds() {
		String lastKey = mapper.selectLastRevRoomId();

		List<String> revRoomIds = new ArrayList<>();
		int temp = Integer.parseInt(lastKey.split("RR")[1]) + 1;

		for(int i=0; i<4; i++) {
			revRoomIds.add("RR" + String.format("%05d", temp+i));
		}

		log.info("testKey : {}", revRoomIds);

	}

	@Test
	void makelistinlist() {
		List<LocalDate> localDateList = new ArrayList<>();
		List<String> tempList = new ArrayList<>();

		List<String> keys = new ArrayList<>();
		keys.add("RR00190");
		keys.add("RR00191");

		List<DateSlotVO> dsList = new ArrayList<>();//데이터가 저장될 vo

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		LocalDate start = LocalDate.parse("2024-08-29", formatter);
		LocalDate end = LocalDate.parse("2024-09-02", formatter);

		localDateList = betweenDates(start, end);

		for(LocalDate single : localDateList) {
			tempList.add(single.toString());
		}

		for(int j=0; j<keys.size(); j++) {
			for(int i=0; i<tempList.size(); i++) {
				if(i==0) {
					DateSlotVO dvoin = new DateSlotVO();
					dvoin.setRevroomId(keys.get(j));
					dvoin.setDateslotDate(tempList.get(i));
					dvoin.setDateslotNm("PM");
					dsList.add(dvoin);
				}else {
					if(i!=tempList.size()-1) {
						DateSlotVO dvoAM = new DateSlotVO();
						dvoAM.setRevroomId(keys.get(j));
						dvoAM.setDateslotDate(tempList.get(i));
						dvoAM.setDateslotNm("AM");
						dsList.add(dvoAM);
						DateSlotVO dvoPM = new DateSlotVO();
						dvoPM.setRevroomId(keys.get(j));
						dvoPM.setDateslotDate(tempList.get(i));
						dvoPM.setDateslotNm("PM");
						dsList.add(dvoPM);
					}else {
						DateSlotVO dvoout = new DateSlotVO();
						dvoout.setRevroomId(keys.get(j));
						dvoout.setDateslotDate(tempList.get(i));
						dvoout.setDateslotNm("AM");
						dsList.add(dvoout);
					}
				}
			}
		}

		log.info("tempList : {}", tempList);



		log.info("dateslotList : {}", dsList);


	}

	@Test
	void insertRevTableTest() {
		List<String> ids = new ArrayList<>();
		ids.add("RR0Test1");
		ids.add("RR0Test2");
		ids.add("RR0Test3");

		WorkInRevVO vo = new WorkInRevVO();
		List<RoomDataVO> rdvoList = new ArrayList<>();

		for(int i=0; i<3; i++) {
			RoomDataVO rdvo = new RoomDataVO();
			rdvo.setRevroomId(ids.get(i));
			rdvo.setRoomId("test1");
			rdvo.setRoomtypeId("1");
			rdvo.setHtrevId("REV0TEST");
			rdvo.setRevroomPrice(999999);
			rdvoList.add(rdvo);

		}



		vo.setTrevId("REV0TEST");
		vo.setMemId("TESTTEST");
		vo.setMemName("테스트");
		vo.setMemTel("010-test-test");
		vo.setTrevCarno("테스트테스트");
		vo.setTrevAdult(2);
		vo.setTrevRtype("01");
		vo.setHtrevChkin("2024-09-20");
		vo.setHtrevChkout("2024-09-25");
		vo.setHtrevStay(5);
		vo.setHtrevTprice(99999999);
		vo.setRoomData(rdvoList);
		vo.setRevRoomIds(ids);

		service.newReservation(vo);

	}


	@Test
	void revRoomInsert() {

	}

	@Test
	void insertDateSlotTest() {
		List<String> ids = new ArrayList<>();

		ids.add("RRTEST01");
		ids.add("RRTEST02");
		ids.add("RRTEST03");

		List<DateSlotVO> dvo = service.createDateSlotData("2024-09-20", "2024-09-25", ids, 3);

		service.insertAllDateSlot(dvo);

	}

	@Test
	void updateRST() {
		List<String> rst = new ArrayList<String>();

		rst.add("402");

		service.modifyRoomStatus(rst);
	}

































}


