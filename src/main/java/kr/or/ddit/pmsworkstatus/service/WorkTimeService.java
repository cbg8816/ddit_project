package kr.or.ddit.pmsworkstatus.service;

import java.time.LocalDate;
import java.util.List;

import kr.or.ddit.vo.WorkDateVO;

public interface WorkTimeService {

	boolean recordCheckIn(WorkDateVO workdatevo);

	boolean recordCheckOut(WorkDateVO workdatevo);

	List<WorkDateVO> getWorkSchedule(String empId, LocalDate workStart, LocalDate workEnd);



}
