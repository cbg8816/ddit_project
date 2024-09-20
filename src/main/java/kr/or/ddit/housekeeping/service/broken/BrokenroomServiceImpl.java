package kr.or.ddit.housekeeping.service.broken;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.housekeeping.dao.BrokenroomMapper;
import kr.or.ddit.vo.BrokenRoomVO;

import lombok.RequiredArgsConstructor;

@Service
public class BrokenroomServiceImpl implements BrokenroomService {

	@Autowired
	private BrokenroomMapper mapper;

	@Override
	public void createBroken(BrokenRoomVO broken) {
		mapper.insetBrokenRoom(broken);
		mapper.updateStatus(broken);
	}

	@Override
	public List<BrokenRoomVO> readBrokenList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectBrokenList(paging);
	}

	@Override
	public BrokenRoomVO readBroken(int hkbNo) {
		return mapper.seletBrokenRoom(hkbNo);
	}


	@Override
	public void modifyBroken(BrokenRoomVO broken) {
		mapper.updateBrokenroom(broken);
	}

	@Override
	public List<BrokenRoomVO> readRepairedList(PaginationInfo paging) {
		return mapper.seletRepaired(paging);
	}

	@Override
	public List<BrokenRoomVO> readRepairingList(PaginationInfo paging) {
		return mapper.seletRepairing(paging);
	}

	@Override
	public List<BrokenRoomVO> readRepairfinishList(PaginationInfo paging) {
		return mapper.seletRepairfinish(paging);
	}

	@Override
	public int readRepairedcount() {
		return mapper.seletRepairedcount();
	}

	@Override
	public int readRepairingcount() {
		return mapper.seletRepairingcount();
	}

	@Override
	public int readRepairfinishcount() {
		return mapper.seletRepairfinishcount();
	}



}
