package kr.or.ddit.payment.service;

import java.util.List;

public interface PaymentService {

	/**
	 * 호텔이 보유한 5개의 객실 정보 가져오기
	 * @return List<String> roomTypeList
	 */
	public List<String> viewRoomTypeList();

	/**
	 * 연도별, 객실 타입별 매출 비교
	 * @param beforeYear 비교 대상 전년도
	 * @param thisYear 비교 대상 금년도
	 * @return List<Integer> : 객실 개수 == 인덱스 수, 인덱스 0 : roomTypeId 1에 대당하는 매출 ++
	 */
	public int[] viewYearRoomTypeCharges(String year);

	/**
	 * 연도, 월별 객실 타입에 따른 매출 비교
	 * @param year : 연도만 넣어도 월별 매출이 인덱스 순서별로 리스트에 담길 수 있도록 구성
	 * @return List<Integer> : 열 두 월에 해당하는 각 월별 매출이 담긴 리스트
	 */
	public List<Integer> viewYearMonthTotalRoomTypeCharges(String year);

	/**
	 * 선택한 연도의 12달의 객실 타입별 매출을 비교할 수 있도록 함
	 * @param year
	 * @return List<int[]> monthAndRoom
	 */
	public List<int[]> viewYearMontEachdRoomTypeCharges(String year);

}
