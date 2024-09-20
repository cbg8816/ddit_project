package kr.or.ddit.housekeeping.service.lostitem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.housekeeping.dao.LostitemMapper;
import kr.or.ddit.vo.LostitemVO;

@Service
public class LostitemServiceImpl implements LostitemService{

	@Autowired
	private LostitemMapper mapper;

	@Override
	public void createLostitem(LostitemVO lostitem) {
		mapper.insertLostitem(lostitem);
	}

	@Override
	public List<LostitemVO> readLostitemList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.lostitemList(paging);
	}

	@Override
	public LostitemVO readLostitem(int hksNo) {
		return mapper.selectLostitem(hksNo);
	}


	@Override
	public void modifyLostitem(LostitemVO lostitem) {
		mapper.updateLostitem(lostitem);

	}

	@Override
	public List<LostitemVO> LostitemIncompleteList(PaginationInfo paging) {
		return mapper.seletLostitemIncomplete(paging);
	}

	@Override
	public List<LostitemVO> LostitemCompleteList(PaginationInfo paging) {
		return mapper.seletLostitemComplete(paging);
	}

	@Override
	public int LostitemIncompletecount() {
		return mapper.seletLostitemIncompletecount();
	}

	@Override
	public int Lostitemcompletecount() {
		return mapper.seletLostitemcompletecount();
	}

	@Override
	public void modifyLostitemYN(LostitemVO lostitem) {
		// TODO Auto-generated method stub

	}

}
