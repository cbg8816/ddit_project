package kr.or.ddit.attencance.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AttencanceDetailVO;
import kr.or.ddit.vo.AttencanceVO;

@Mapper
public interface AttencanceDAO {

	/**
	 * 근태관리 리스트 전체 레코드 수
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);

	/**
	 * 근태관리 전체 리스트
	 * @param paging
	 * @return
	 */
	public List<AttencanceVO> selectAttencanceList(PaginationInfo paging);

	/**
	 * 근태관리 상세
	 * @param atteId
	 * @return
	 */
	public AttencanceVO selectAttencance(String atteId);





	public void insertattvo(AttencanceDetailVO attvo);


}
