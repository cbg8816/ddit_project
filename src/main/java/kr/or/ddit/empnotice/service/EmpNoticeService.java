package kr.or.ddit.empnotice.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.EmpNoticeVO;
import kr.or.ddit.vo.EmpVO;

public interface EmpNoticeService {

	/**
	 * 사내 공지사항 전체 리스트
	 * @param paging
	 * @return
	 */
	public List<EmpNoticeVO> retrieveEmpNoticeList(PaginationInfo paging);

	/**
	 * 사내 공지사항 상세
	 * @param empnotiNo
	 * @return
	 */
	public EmpNoticeVO retrieveEmpNotice(String empnotiNo);

	/**
	 * 사내 공지사항 등록
	 * @param empNotice
	 */
	public void createEmpNotice(EmpNoticeVO empNotice);

	/**
	 * 사내 공지사항 수정
	 * @param empNotice
	 */
	public void modifyEmpNotice(EmpNoticeVO empNotice);

	/**
	 * 사내 공지사항 삭제
	 * @param empnotiNo
	 */
	public void removeEmpNotice(String empnotiNo);



	public EmpVO empList(String empId);

}
