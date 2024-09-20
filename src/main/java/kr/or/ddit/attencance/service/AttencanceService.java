package kr.or.ddit.attencance.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AttencanceDetailVO;
import kr.or.ddit.vo.AttencanceVO;

public interface AttencanceService {

	/**
	 * 근태관리 전체 리스트
	 * @param paging
	 * @return
	 */
	public List<AttencanceVO> retrieveAttencanceList(PaginationInfo paging);

	/**
	 * 근태관리 상세
	 * @param atteId
	 * @return
	 */
	public AttencanceVO retrieveAttencance(String atteId);


	public void createattvo(AttencanceDetailVO attvo);

}
