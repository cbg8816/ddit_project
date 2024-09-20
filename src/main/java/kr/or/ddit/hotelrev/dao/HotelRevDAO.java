package kr.or.ddit.hotelrev.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.ExtrachargesVO;
import kr.or.ddit.vo.HotelRevVO;
import kr.or.ddit.vo.RevRoomVO;
import kr.or.ddit.vo.def.DateslotDefaultVO;

@Mapper
public interface HotelRevDAO {


	public int insertMember(HotelRevVO hotelRev);
	public int insertTotalRev(HotelRevVO hotelRev);
	public int insertHotelRev(HotelRevVO hotelRev);
	public int insertRevRoom(@Param("hotelRev") HotelRevVO hotelRev);
	public int insertDateSlot(@Param("dateslot") List<DateslotDefaultVO> dateSlots);

	public int selectTotalRecord(PaginationInfo paging); // 데이터 개수 조회

	public int selectArriveTotalRecord(PaginationInfo paging); // 도착예정자 데이터 갯수 조회

//	public List<HotelRevVO> selectHotelRev(String htrevId);
	public HotelRevVO selectHotelRev(HotelRevVO hotelRev);

	public HotelRevVO selectOneHtrev(@Param("what") String what);
	public List<RevRoomVO> selectRevroomList(@Param("what") String what);
	public List<ExtrachargesVO> selectExtrachargeList(@Param("what") String what);
	public int selectTotalExtra(@Param("what") String what);


	public List<HotelRevVO> selectHotelRevList(PaginationInfo paging);

	public List<HotelRevVO> selectArriveYNList(PaginationInfo paging);

	public int updateArriveComplete(String what);

	public int updateRevSt(HotelRevVO htrevVO);
	public int updateRoomSt(String htrevId);

	public int updateHotelRev(HotelRevVO hotelRev);
	public int updateRevRoom(HotelRevVO hotelRev);
	public int updateTotalRev(HotelRevVO hotelRev);
	public int updateRoomStatus(HotelRevVO hotelRev);


	public int deleteHotelRev(HotelRevVO htrevId);



	// 회원 마이페이지 예약 조회
	public List<HotelRevVO> selectHotelRevListMember(PaginationInfo paging);

	// 회원별 총 예약 수 조회
	public int selectTotalRecordMember(PaginationInfo paging);

	// 도착예정자

}
