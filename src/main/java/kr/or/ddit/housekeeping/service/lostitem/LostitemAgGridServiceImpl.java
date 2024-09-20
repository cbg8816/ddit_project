package kr.or.ddit.housekeeping.service.lostitem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.housekeeping.dao.LostitemAgGridMapper;
import kr.or.ddit.vo.LostitemVO;

@Service
public class LostitemAgGridServiceImpl implements LostitemAgGridService {

	@Autowired
	private LostitemAgGridMapper mapper;

	/*
	@Override
	public List<HousekeepingLostitemVO> readLostitemList(PaginationInfo paging) {
		paging.setTotalRecord(mapper.selectTotalRecord(paging));
		List<HousekeepingLostitemVO> lostitemList = mapper.LostList(paging);
		return lostitemList;
	}
*/

	@Override
	public List<LostitemVO> readLostitemList() {
		return mapper.LostListNonpage();
	}



	@Override
	public void createLostitem(LostitemVO lostitem) {
		mapper.insertLostitem(lostitem);
	}


	@Override
	public LostitemVO readlostitem(int hksNo) {
		LostitemVO lostitem = mapper.seletLostitem(hksNo);
		return lostitem;
	}


	@Override
	public void modifyLostitem(LostitemVO lostitem) {
		mapper.updateLostitem(lostitem);
	}


	@Override
	public void removelostitem(int hksNo) {
		mapper.deletelostitem(hksNo);
	}






}
