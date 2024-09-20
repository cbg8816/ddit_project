package kr.or.ddit.workinrev.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.DateSlotVO;
import kr.or.ddit.vo.ForRevMemberVO;
import kr.or.ddit.vo.HotelRevVO;
import kr.or.ddit.vo.PossibleRoomsVO;
import kr.or.ddit.vo.WorkInPayVO;
import kr.or.ddit.vo.WorkInRevVO;

@Mapper
public interface WorkInRevMapper {

	/**
	 * 가장 최근에 생성된 키 조회
	 * @return TREV_ID
	 */
	public String selectLastPK();

	/**
	 * 가용객실 조회
	 * @return PossibleRoomsVO
	 */
	public List<PossibleRoomsVO> selectPossibleRooms(WorkInRevVO workInRevVO);

	/**
	 * 가장 최근에 생성된 비회원 pk 조회
	 * @return MEM_ID
	 */
	public String selectLastMemPK();

	/**
	 * 생성한 memId를 실제 member테이블에 이름, 전화번호와 함게 insert
	 * @param workInRevVO
	 * @return 0 or 1
	 */
	public int insertToMember(WorkInRevVO workInRevVO);

	/**
	 * total_rev, hotel_rev 테이블에 예약 정보 insert
	 * @param workInRevVO
	 * @return 0 or 1
	 */
	public int insertRev(WorkInRevVO workInRevVO);
	/**
	 * total_rev, hotel_rev 테이블에 예약 정보 insert ( web.ver)
	 * @param workInRevVO
	 * @return 0 or 1
	 */
	public int insertRevWeb(WorkInRevVO workInRevVO);

	/**
	 * rev_room에서 마지막으로 생성된 pk(revroom_id)를 가져옴
	 * @return revroom_id
	 */
	public String selectLastRevRoomId();

	/**
	 * rev_room 테이블에 예약한 객실 정보 insert
	 * @param workInRevVO
	 * @return 0 or 1
	 */
	public int insertRevRoom(WorkInRevVO workInRevVO);

	/**
	 * dateslot 테이블에 체크인 날짜부터 체크아웃 날짜까지 해당하는 데이터를 넣기 위한 메소드
	 * @param dateList
	 * @return 0 or 1
	 */
	public int insertDateSlot(List<DateSlotVO> dateSlotData);

	/**
	 * 입실처리된 객실의 상태를 6(입실가능) 에서 -> 1(투숙중)으로 변경
	 * @param roomId
	 * @return 0 or 1
	 */
	public int updateRevRoomStatus(List<String> roomIds);

	/**
	 * 예약 시 입력한 멤버의 로그인 아이디를 통해 회원 정보와 마일리지를 가져옴
	 * @param memId
	 * @return ForRevMemberVO
	 */
	public ForRevMemberVO selectOneMemberInfo(String memLoginId);

	/**
	 *
	 * @param workInRevVO
	 * @return
	 */
	public int insertNewPay(WorkInPayVO workInPayVO);

	/**
	 *
	 * @param workInPayVO
	 * @return
	 */
	public int updateMemberMileage(WorkInPayVO workInPayVO);

}
