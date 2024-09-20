package kr.or.ddit.pmsworkstatus.service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.pmsworkstatus.dao.WorkTimeMapper;
import kr.or.ddit.vo.WorkDateVO;

@Service
public class WorkTimeServiceImpl implements WorkTimeService {

	@Autowired
	private WorkTimeMapper timemapper;

	@Override
	public boolean recordCheckIn(WorkDateVO workdatevo) {
		return timemapper.insertCheckIn(workdatevo) > 0;
	}

	@Override
	public boolean recordCheckOut(WorkDateVO workdatevo) {
		 return timemapper.updateCheckOut(workdatevo) > 0;
	}

	@Override
	public List<WorkDateVO> getWorkSchedule(String empId, LocalDate workStart, LocalDate workEnd) {
		Map<String, Object> params = new HashMap<>();
		params.put("empId", empId);
		params.put("workStart", workStart);
		params.put("workEnd", workEnd);

		return timemapper.getWorkSchedule(params);
	}


}
