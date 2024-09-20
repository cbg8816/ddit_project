package kr.or.ddit.todaysales.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.todaysales.dao.TodaySalesMapper;
import kr.or.ddit.vo.TodaySalesVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TodaySalesServiceImpl implements TodaySalesService {

	@Autowired
	private TodaySalesMapper mapper;

	@Override
	public List<TodaySalesVO> showTodaySalesList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectTodaySalesList(paging);
	}

}
