package kr.or.ddit.room.service;

import java.util.List;


import kr.or.ddit.vo.RoomVO;

public interface RoomService {

	public List<RoomVO> readRoomList();

	public RoomVO readRoom(String roomId);

	public List<RoomVO> readEmpList();
	

	public void createMaintenanceRoom(RoomVO room);

	public void modifyKeepingFinish(RoomVO room);

	public void modifyBrokenFinish(RoomVO room);
	
	public void modifyBrokenRepair(RoomVO room);

}
