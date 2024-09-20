package kr.or.ddit.payment;

import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import org.hibernate.validator.internal.util.privilegedactions.GetInstancesFromServiceLoader;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
import org.springframework.util.StringUtils;

import kr.or.ddit.commons.def.mapper.RoomtypeDefaultMapper;
import kr.or.ddit.payment.dao.PaymentMapper;
import kr.or.ddit.vo.RoomTypeChargePaymentVO;
import kr.or.ddit.vo.WorkshiftVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
class RoomTypeTest {

	@Autowired
	private PaymentMapper mapper;


	@Test
	void testYearMonth() {
		//최초 그래프 화면 : 전년도, 금년 객실 등급별 총 매출 비교
		//기간 설정 : 월별 / 분기별 / 반기별 / 연도별 설정 가능
		List<RoomTypeChargePaymentVO> thisList = mapper.selectYearMonthRoomTypeCharges("2024");

		List<Integer> thisArray = new ArrayList<Integer>();

		List<RoomtypeDefaultVO> roomTypeList = mapper.selectRoomTypeList();

		//월별 매출 통계 잡을 때 사용
		for(int i=0; i<thisList.size(); i++) {
			if(thisList.get(i).getRoomtypeId().equals("MONTH_TOTAL")&&thisList.get(i).getMonthTdate()!=null) {
				thisArray.add(thisList.get(i).getPriceSum());
			}
		}

		List<int[]> monthAndRoom = new ArrayList<>();

		int[] monthRoomPay = new int[roomTypeList.size()];

		log.info("2024 : {}", thisList);
		log.info("2024 : {}", thisArray);

		for(RoomTypeChargePaymentVO single : thisList) {
			if(!single.getRoomtypeId().equals("MONTH_TOTAL")) {
				monthRoomPay[Integer.parseInt(single.getRoomtypeId())-1] = single.getPriceSum();
			}else {
				if(single.getMonthTdate()!=null) {
					monthAndRoom.add(monthRoomPay);
				}
				monthRoomPay = new int[roomTypeList.size()];;
			}
		}


		// ... 기존 코드

		List<int[]> rev = new ArrayList<>();
		int rows = monthAndRoom.size();
		int cols = monthAndRoom.get(0).length;
		int[][] temp = new int[cols][rows];

		for (int i = 0; i < rows; i++) {
		    for (int j = 0; j < cols; j++) {
		        temp[j][i] = monthAndRoom.get(i)[j];
		    }
		}

		for (int[] row : temp) {
		    rev.add(Arrays.copyOf(row, row.length));
		}

		log.info("monthAndRoom: {}", monthAndRoom);
		log.info("rev: {}", rev);

	}

	@Test
	void arrayReverse() {

		int[][] test1 = new int[][] {new int[] {1,2}, new int[] {3,4}, new int[] {5, 6}};
		int[][] test2 = new int[2][3];

		for(int i=0; i<test1.length; i++) {
			for(int j=0; j<test1[i].length; j++) {
				System.out.printf("%d\t",test1[i][j]);
				test2[j][i] = test1[i][j];
			}
			System.out.println();
		}

		for(int i=0; i<test2.length; i++) {
			for(int j=0; j<test2[i].length; j++) {
				System.out.printf("%d\t",test2[i][j]);
			}
			System.out.println();
		}


	}

	@Test
	void reverseArray() {
		List<RoomTypeChargePaymentVO> thisList = mapper.selectYearMonthRoomTypeCharges("2024");

		List<Integer> thisArray = new ArrayList<Integer>();

		List<RoomtypeDefaultVO> roomTypeList = mapper.selectRoomTypeList();

		List<int[]> monthAndRoom = new ArrayList<>();

		int[] monthRoomPay = new int[roomTypeList.size()];

		for(RoomTypeChargePaymentVO single : thisList) {
			if(!single.getRoomtypeId().equals("MONTH_TOTAL")) {
				monthRoomPay[Integer.parseInt(single.getRoomtypeId())-1] = single.getPriceSum();
			}else {
				if(single.getMonthTdate()!=null) {
					monthAndRoom.add(monthRoomPay);
				}
				monthRoomPay = new int[roomTypeList.size()];;
			}
		}

		log.info("testt size : {}", monthAndRoom.size());
		log.info("testt : {}", monthAndRoom);






	}

	@Test
	void testYearandType() {
		List<RoomTypeChargePaymentVO> yearList = mapper.selectYearRoomTypeCharges("2024");

		List<RoomtypeDefaultVO> roomTypeList = mapper.selectRoomTypeList();

		//현재 arr : 해당 연도 객실 타입별 매출액
		int[] arr = new int[roomTypeList.size()];

		int yearTotal = 0;

		//해당 연도 매출 총 계
		for(int i=0; i<yearList.size(); i++) {
			if(yearList.get(i).getYearTdate().equals("YEAR_TOTAL")) {
				yearTotal = yearList.get(i).getPriceSum();
			}
		}

		log.info("roomType : {}", roomTypeList);

		log.info("yearList : {}", yearList);

		for(int i=0; i<yearList.size(); i++) {
			if(!yearList.get(i).getRoomtypeId().equals("MONTH_TOTAL")) {
				arr[Integer.parseInt(yearList.get(i).getRoomtypeId())-1] = yearList.get(i).getPriceSum();
			}
		}

		log.info("arr : {}", arr);

	}

	@Test
	void testtest() {
		Calendar now = Calendar.getInstance();

		int year = now.get(Calendar.YEAR);

		log.info("sdf : {}", year);
	}

	@Test
	void testroom() {

		List<RoomtypeDefaultVO> roomTest = mapper.selectRoomTypeList();

		List<String> roonTypeNms = new ArrayList<>();

		for(RoomtypeDefaultVO single : roomTest) {
			roonTypeNms.add(single.getRoomtypeNm());
		}

		log.info("test : {}", roonTypeNms);

	}

	@Test
	void testcollection() {
		List<WorkshiftVO> wvo = new ArrayList<>();//service.xxxx();
		Calendar now = Calendar.getInstance();

		int day = now.get(Calendar.DAY_OF_MONTH); //?이번달에 며칠까지 있는지 이거 구해서
		//collection 중복 제거 hashset ? workday가 명수만큼 있으니까

		List<WorkshiftVO> test = new ArrayList<>(day);

		log.info("test : ", test);



		log.info("test : ", test);

	}













}
