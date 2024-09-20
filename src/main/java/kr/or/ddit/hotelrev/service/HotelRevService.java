package kr.or.ddit.hotelrev.service;

import java.text.ParseException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.ExtrachargesVO;
import kr.or.ddit.vo.HotelRevVO;
import kr.or.ddit.vo.RevRoomVO;
import kr.or.ddit.vo.def.DateslotDefaultVO;

public interface HotelRevService {

	public void insertHotelRev(HotelRevVO hotelRev) throws ParseException;
//	public void insertDateslot(HotelRevVO hotelRev);
//	public void insertMember(HotelRevVO hotelRev);
//	public void insertTotalRev(HotelRevVO hotelRev);

	public List<HotelRevVO> selectHotelRevList(PaginationInfo paging);

	public List<HotelRevVO> selectArriveYNList(PaginationInfo paging);

//	public List<HotelRevVO> selectHotelRev(String htrevId);
	public HotelRevVO selectHotelRev(HotelRevVO hotelRev);
	public HotelRevVO selectOneHtrev(String what);
	public List<RevRoomVO> selectRevroomList(String what);
	public List<ExtrachargesVO> selectExtrachargeList(String what);
	public int selectTotalExtra(@Param("what") String what);

	public void updateArriveComplete(String what);

	public void updateRevSt(HotelRevVO htrevVO);
	public void updateRoomSt(String roomId);

	public void updateHotelRev(HotelRevVO hotelRev);
//	public void updateRevRoom(HotelRevVO hotelRev);
//	public void updateTotalRev(HotelRevVO hotelRev);

	public void deleteHotelRev(HotelRevVO htrevId);

//	public void insertDateSlot(List<DateslotDefaultVO> dateSlots);

}
