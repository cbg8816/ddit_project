package kr.or.ddit.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.ddit.room.dao.RoomMapper;
import kr.or.ddit.vo.RoomVO;

@Service
public class RoomServiceImpl implements RoomService{

	@Autowired
	private RoomMapper mapper;

	/**
	 * 전체 객실 리스트 조회
	 */
	@Override
	public List<RoomVO> readRoomList() {
		return mapper.RoomList();
	}

	/**
	 * 객실 상세 조회
	 */
	@Override
	public RoomVO readRoom(String roomId) {
		return mapper.selectRoom(roomId);
	}

	/**
	 * 직원 전체 조회
	 */
	@Override
	public List<RoomVO> readEmpList() {
		return mapper.empList();
	}

	/**
	 *	키핑생성, roomSt=3, 매니저에 룸번호 넣기
	 */
	@Override
	public void createMaintenanceRoom(RoomVO room) {
		mapper.updateRoomSt(room);
		mapper.insertkeeping(room);
		mapper.updatemng(room);
	}

	/**
	 * roomSt=6, hkpStatus=정비완료, 매니저 룸번호 =null
	 * @param room
	 */
	@Override
	public void modifyKeepingFinish(RoomVO room) {
		mapper.updatekeepingfin(room);
		mapper.updatemng2(room);
		mapper.updateST1(room);
	}

	/**
	 * roomSt=6, HKB_COMPLE=수리완료, 매니저 룸번호 =null
	 * @param room
	 */
	@Override
	public void modifyBrokenFinish(RoomVO room) {
		mapper.updatebrokenfin(room);
		mapper.updatemng2(room);
		mapper.updateST1(room);
	}

	/**
	 * roomSt=4, 담당자 배정, 수리중으로 변환
	 * @param room
	 */
	public void modifyBrokenRepair(RoomVO room) {
		mapper.updatebrokenemp(room);
		mapper.updatebrokenrepair(room);
		mapper.updatemng(room);
		mapper.updatebrokenSt(room);
	}


}
