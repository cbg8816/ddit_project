package kr.or.ddit.emp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.ManagerVO;

@Mapper
public interface EmpMapper {
	/**
	 * 페이징 할때 직원 리스트 전체 레코드
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);

	/**
	 * 직원 전체 리스트
	 * @param paging
	 * @return
	 */
	public List<EmpVO> selectEmpList(PaginationInfo paging);
	/**
	 * 직원 상세보기
	 * @param empId
	 * @return
	 */
	public EmpVO selectEmp(String empId);

	/**
	 * 직원 등록
	 * @param emp
	 * @return
	 */
	public int insertEmp(EmpVO emp);
	/**
	 * 직원 근태 등록
	 * @param emp
	 * @return
	 */
	public int insertAttencance(EmpVO emp);

	/**
	 * 직원 정보 수정
	 * @param emp
	 * @return
	 */
	public int updateEmp(EmpVO emp);
	/**
	 * 직원 정보 삭제(삭제지만 퇴사처리)
	 * @param empId
	 * @return
	 */
	public int deleteEmp(String empId);

	public List<EmpVO> selectEmpExList(PaginationInfo paging);

	public List<EmpVO> selectEmpListBasic();

	public List<EmpVO> empdepList();

	public String empName(String empName);


}
