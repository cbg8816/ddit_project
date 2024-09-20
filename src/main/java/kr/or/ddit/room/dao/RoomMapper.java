package kr.or.ddit.room.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import kr.or.ddit.vo.RoomVO;

@Mapper
public interface RoomMapper {

	public List<RoomVO> RoomList();

	public RoomVO selectRoom(String roomId);


	public List<RoomVO> empList();


	/**
	 * roomSt=3 정비중
	 * @param room
	 * @return
	 */
	public int updateRoomSt(RoomVO room);


	/**
	 * manager테이블에 룸번호 넣기
	 * @param room
	 * @return
	 */
	public int updatemng(RoomVO room);


	/**
	 * 정비중 인서트 하우스키핑
	 * @param room
	 * @return
	 */
	public int insertkeeping(RoomVO room);


	/**
	 * 정비완료,수리완료 roomSt = 6
	 * @param room
	 * @return
	 */
	public int updateST1(RoomVO room);


	/**
	 * 수리중으로 변환 ROOM_ST = '4'
	 * @param room
	 * @return
	 */
	public int updatebrokenSt(RoomVO room);

	/**
	 * 수리완료시 HKB_COMPLE = '수리완료'
	 * @param room
	 * @return
	 */
	public int updatebrokenfin(RoomVO room);


	/**
	 * 정비완료 housekeeping HKP_STATUS = '정비완료'
	 * @param room
	 * @return
	 */
	public int updatekeepingfin(RoomVO room);


	/**
	 * HKB_COMPLE = 수리중으로 변경
	 * @param room
	 * @return
	 */
	public int updatebrokenrepair(RoomVO room);

	/**
	 * 수리배정시 hkb담당자 직원배정
	 * @param room
	 * @return
	 */
	public int updatebrokenemp(RoomVO room);


	/**
	 * MANAGER ROOM_ID null로 만듬
	 * @param room
	 * @return
	 */
	public int updatemng2(RoomVO room);


}
