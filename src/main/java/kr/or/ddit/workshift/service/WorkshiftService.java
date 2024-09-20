package kr.or.ddit.workshift.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.WorkshiftVO;

public interface WorkshiftService {

//	public List<WorkshiftVO> selectWorkshiftList();
	public List<Map<String, Object>> selectWorkshiftList();


	// 모든직원의 한달치 근무리스트
	public List<EmpVO> selecteEmpWorkshiftList(String dal, String depid);


	// 부서 별 직원리스트
	public List<EmpVO> selectDepEmpList(String depid);

	// 한 직원의 근무표 리스트
	public List<WorkshiftVO> selectEmpWorkshiftList(String what, String dal);

	// 근무표 업데이트
	public void updateWorkshift(List<WorkshiftVO> workshiftList);


	public List<WorkshiftVO> selectWorkshiftList2(int cnt, String dal);

}
