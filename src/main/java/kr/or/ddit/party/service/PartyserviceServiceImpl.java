package kr.or.ddit.party.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.party.dao.PartyserviceMapper;
import kr.or.ddit.vo.PartyserviceVO;

@Service
public class PartyserviceServiceImpl implements PartyserviceService{

	@Autowired
	private PartyserviceMapper mapper;


	@Override
	public void createPartyservice(PartyserviceVO party) {
		mapper.insertPartyservice(party);
	}

	@Override
	public List<PartyserviceVO> readPartyserviceList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.PartyserviceList(paging);
	}

	@Override
	public PartyserviceVO readPartyservice(String partyNo) {
		return mapper.selectPartyservice(partyNo);
	}

	@Override
	public void modifyPartyservice(PartyserviceVO party) {
		mapper.updatePartyservice(party);
	}

}
