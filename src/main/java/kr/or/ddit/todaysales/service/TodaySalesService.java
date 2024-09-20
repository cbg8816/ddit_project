package kr.or.ddit.todaysales.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.TodaySalesVO;

public interface TodaySalesService {

	/**
	 *
	 * @return
	 */
	public List<TodaySalesVO> showTodaySalesList(PaginationInfo paging);

}
