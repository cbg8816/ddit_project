package kr.or.ddit.party.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.DinningRevVO;
import kr.or.ddit.vo.PartyserviceVO;

@Mapper
public interface PartyserviceMapper {

	/**
	 * 연회 등록
	 * @param party
	 * @return
	 */
	public int insertPartyservice(PartyserviceVO party);




	/**
	 * 연회 리스트 조회
	 * @param paging
	 * @return
	 */
	public List<PartyserviceVO> PartyserviceList(PaginationInfo paging);

//	public int insertMember(DinningRevVO dinRev);
//	public int insertTotalRev(DinningRevVO dinRev);

	/**
	 * 연회 상세조회
	 * @param partyNo
	 * @return
	 */
	public PartyserviceVO selectPartyservice(String partyNo);

	/**
	 * 연회 수정
	 * @param party
	 * @return
	 */
	public int updatePartyservice(PartyserviceVO party);

//	public int updateTotalRev(DinningRevVO dinRev);



	/**
	 * 페이징
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);
}



