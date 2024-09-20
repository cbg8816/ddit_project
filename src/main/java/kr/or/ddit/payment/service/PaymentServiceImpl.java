package kr.or.ddit.payment.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.payment.dao.PaymentMapper;
import kr.or.ddit.vo.RoomTypeChargePaymentVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentMapper mapper;

	@Override
	public List<String> viewRoomTypeList() {
		List<RoomtypeDefaultVO> roomTest = mapper.selectRoomTypeList();

		List<String> roonTypeNms = new ArrayList<>();

		for(RoomtypeDefaultVO single : roomTest) {
			roonTypeNms.add(single.getRoomtypeNm());
		}

		return roonTypeNms;
	}

	@Override
	public int[] viewYearRoomTypeCharges(String year) {

		//해당 연도의 월별, 객실 타입별 매출
		List<RoomTypeChargePaymentVO> nowYearList = mapper.selectYearRoomTypeCharges(year);
		//전체 객실 타입 리스트
		List<RoomtypeDefaultVO> roomTypeList = mapper.selectRoomTypeList();

		int[] result = new int[roomTypeList.size()];

		for(RoomTypeChargePaymentVO single : nowYearList) {
			if(!single.getRoomtypeId().equals("MONTH_TOTAL")) {
				result[Integer.parseInt(single.getRoomtypeId())-1] = single.getPriceSum();
			}
		}

		return result;
	}


	@Override
	public List<Integer> viewYearMonthTotalRoomTypeCharges(String year) {
		List<RoomTypeChargePaymentVO> thisList = mapper.selectYearMonthRoomTypeCharges(year);

		List<Integer> thisArray = new ArrayList<>();

		//월별 매출 통계 잡을 때 사용
		for(int i=0; i<thisList.size(); i++) {
			if(thisList.get(i).getRoomtypeId().equals("MONTH_TOTAL")&&thisList.get(i).getMonthTdate()!=null) {
				thisArray.add(thisList.get(i).getPriceSum());
			}
		}

		return thisArray;
	}

	@Override
	public List<int[]> viewYearMontEachdRoomTypeCharges(String year) {
		List<RoomTypeChargePaymentVO> thisList = mapper.selectYearMonthRoomTypeCharges(year);

		if(thisList.isEmpty()) {
			throw new IndexOutOfBoundsException("데이터가 없는 연도입니다.");
		}

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
				monthRoomPay = new int[roomTypeList.size()];
			}
		}

		List<int[]> reverse = new ArrayList<>();
		int rows = monthAndRoom.size();
		int cols = monthAndRoom.get(0).length;

		int[][] temp = new int[cols][rows];

		for (int i = 0; i < rows; i++) {
			for (int j = 0; j < cols; j++) {
				temp[j][i] = monthAndRoom.get(i)[j];
			}
		}

		for (int[] row : temp) {
			reverse.add(Arrays.copyOf(row, row.length));
		}

		return reverse;
	}

}
