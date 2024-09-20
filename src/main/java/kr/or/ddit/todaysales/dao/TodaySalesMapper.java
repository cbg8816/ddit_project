package kr.or.ddit.todaysales.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.TodaySalesVO;

@Mapper
public interface TodaySalesMapper{

	/**
	 * 최초에는 '금일'을 기준으로 아래와 같은 정보를 가져온다.
	 * 특정 날짜를 선택할 시, 해당 날짜에 대한 정보로 변경된다.
	 * 1. 객실 정보
	 * 2. 해당 객실에 대한 예약 정보
	 * 3. 해당 객실에 투숙중인 고객 정보
	 * 4. 해당 객실에서 당일에 발생한 기타 요금 결제 정보
	 * @return
	 */
	public List<TodaySalesVO> selectTodaySalesList(PaginationInfo paging);

	/**
	 * selectTodaySalesList의 페이징을 위한 데이터 수 집계
	 * @param paging
	 * @return int
	 */
	public int selectTotalRecord(PaginationInfo paging);

}
