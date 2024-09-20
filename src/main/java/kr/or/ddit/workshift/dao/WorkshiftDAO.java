package kr.or.ddit.workshift.dao;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.WorkshiftVO;

@Mapper
public interface WorkshiftDAO {

	public List<WorkshiftVO> selectWorkshiftList();


	// 모든직원의 한달치 근무리스트
	public List<EmpVO> selecteEmpWorkshiftList(@Param("dal") String dal, @Param("depid") String depid);

	public List<WorkshiftVO> selectDays(String dal);

	// 부서 별 직원리스트
	public List<EmpVO> selectDepEmpList(@Param("depid") String depid);

	// 한 직원의 근무표리스트
	public List<WorkshiftVO> selectEmpWorkshiftList(@Param("what") String what, @Param("dal") String dal);

	// 근무표 업데이트
	public int updateWorkshift(List<WorkshiftVO> workshiftList);


	public int selectTotalRecord(PaginationInfo paging); // 데이터 개수 조회



	public List<WorkshiftVO> selectWorkshiftList2(@Param("cnt") int cnt, String dal);

	public int countEmp();

}
