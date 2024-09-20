package kr.or.ddit.emp.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.EmpVO;

public interface EmpService {
	/**
	 * 직원 전체 리스트
	 * @param paging
	 * @return
	 */
	public List<EmpVO> retrieveEmpList(PaginationInfo paging);

	/**
	 * 직원 상세보기
	 * @param empId
	 * @return
	 */
	public EmpVO retrieveEmp(String empId);

	/**
	 * 직원 정보 등록
	 * @param emp
	 */
	public void createEmp(EmpVO emp);

	/**
	 * 직원 정보 수정
	 * @param emp
	 */
	public void modifyEmp(EmpVO emp);

	/**
	 * 직원 정보 삭제(삭제지만 퇴사처리)
	 * @param empId
	 */
	public void removeEmp(String empId);

	/**
	 * 퇴사자 전체 리스트
	 * @param paging
	 * @return
	 */
	public List<EmpVO> retrieveEmpExList(PaginationInfo paging);
}
