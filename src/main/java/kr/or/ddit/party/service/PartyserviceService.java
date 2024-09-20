package kr.or.ddit.party.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.PartyserviceVO;

public interface PartyserviceService {

	/**
	 * 연회 등록
	 * @param party
	 */
	public void createPartyservice(PartyserviceVO party);

	/**
	 * 연회 리스트 죄회
	 * @param paging
	 * @return
	 */
	public List<PartyserviceVO> readPartyserviceList(PaginationInfo paging);

	/**
	 * 연회 상세 조회
	 * @param partyNo
	 * @return
	 */
	public PartyserviceVO readPartyservice(String partyNo);

	/**
	 * 연회 수정
	 * @param party
	 */
	public void modifyPartyservice(PartyserviceVO party);
}
