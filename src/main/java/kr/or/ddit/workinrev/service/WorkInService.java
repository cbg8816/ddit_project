package kr.or.ddit.workinrev.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.DateSlotVO;
import kr.or.ddit.vo.ForRevMemberVO;
import kr.or.ddit.vo.HotelRevVO;
import kr.or.ddit.vo.PossibleRoomsVO;
import kr.or.ddit.vo.WorkInPayVO;
import kr.or.ddit.vo.WorkInRevVO;
import kr.or.ddit.vo.def.RoomtypeDefaultVO;

public interface WorkInService {

	/**
	 * 룸 타입 모두 조회
	 * @return List<RoomtypeDefaultVO>
	 */
	public List<RoomtypeDefaultVO> showRoomTypes();

	/**
	 * 가용객실 조회
	 * @return PossibleRoomsVO
	 */
	public List<PossibleRoomsVO> getPossibleRooms(WorkInRevVO workInRevVO);

	/**
	 * 예약 아이디 생성을 위해 가장 최근에 생성됐던 TREV_ID 조회
	 * @return TREV_ID
	 */
	public String makeNewtPK();

	/**
	 * 비회원 전용 회원 아이디를 생성하기위해 최근에 생성됐던 MEM_ID 조회
	 * @return MEM_ID
	 */
	public String makeNewMemPK();

	/**
	 * revroom_id를 생성하기 위해 마지막에 생성된 revroom_id를 조회 후 생성
	 * @return revroom_id
	 */
	public List<String> makeNewRevRoomPK(int revRoomCnt);

	/**
	 * 최근 생성한 mem_id를 조회해서 새 mem_id를 만들고, 해당 아이디를 실제로 insert
	 * @param memId
	 */
	public void createMember(WorkInRevVO workInRevVO);

	/**
	 * total_rev, hotel_rev에 insert를 진행
	 * @param workInRevVO
	 */
	public void newReservation(WorkInRevVO workInRevVO);
	/**
	 * total_rev, hotel_rev에 insert를 진행(web.ver)
	 * @param workInRevVO
	 */
	public void newReservationWeb(WorkInRevVO workInRevVO);

	/**
	 * 체크인 일시는 pm만, 체크아웃 일시는 am만, 그 사이의 일시는 am과 pm을 모두 concat해서 리스트에 담아준다.
	 * @param dateList
	 */
	public List<DateSlotVO> createDateSlotData(String startDate, String endDate, List<String> revRoomIds, int revRoomCnt);

	/**
	 * 선택한 일시에 해당하는 모든 dateslot 데이터들을 insert하기 위함
	 * @param dateSlotData
	 * @return
	 */
	public int insertAllDateSlot(List<DateSlotVO> dateSlotData);

	/**
	 * 입실 이후 ROOMSTATUS 테이블에 예약한 객실의 객실 상태를 6입실 가능에서 1투숙중으로 변경
	 * @param roomId
	 */
	public void modifyRoomStatus(List<String> roomIds);

	/**
	 * 예약 시 입력받은 멤버 로그인 아이디를 통해 멤버 정보를 가져옴
	 * @param memLoginId
	 * @return ForRevMemberVO
	 */
	public ForRevMemberVO getMemberInfo(String memLoginId);

	public void createNewPay(WorkInPayVO workInPayVO);

	public void modifyMemberMileage(WorkInPayVO workInPayVO);
}
