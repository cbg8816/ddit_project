package kr.or.ddit.pmsworkstatus.dao;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.WorkDateVO;

@Mapper
public interface WorkTimeMapper {

	public int insertCheckIn(WorkDateVO workdatevo);

	public int updateCheckOut(WorkDateVO workdatevo);

	public List<WorkDateVO> getWorkSchedule(Map<String, Object> params);

	public WorkDateVO selectTodayWorkTime(String empId, LocalDate today);

}
