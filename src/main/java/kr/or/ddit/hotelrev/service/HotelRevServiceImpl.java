package kr.or.ddit.hotelrev.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.hotelrev.dao.HotelRevDAO;
import kr.or.ddit.vo.ExtrachargesVO;
import kr.or.ddit.vo.HotelRevVO;
import kr.or.ddit.vo.RevRoomVO;
import kr.or.ddit.vo.def.DateslotDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class HotelRevServiceImpl implements HotelRevService {

	@Autowired
	private HotelRevDAO dao;

	@Transactional
	@Override
	public void insertHotelRev(HotelRevVO hotelRev) throws ParseException {

		dao.insertMember(hotelRev);
		dao.insertTotalRev(hotelRev);
		dao.insertHotelRev(hotelRev);
		dao.insertRevRoom(hotelRev);

//	 for (RevRoomVO revRoom : hotelRev.getRevRoomList()) {
//            List<DateslotDefaultVO> dateSlotList = createDateSlots(hotelRev);
//            log.info("dateSlots >>>>>>>>>>>>> {} : ", dateSlotList);
//            dao.insertDateSlot(dateSlotList);
//        }


		List<DateslotDefaultVO> dateSlots = new ArrayList<>();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date chkinDate = sdf.parse(hotelRev.getHtrevChkin());
		Date chkoutDate = sdf.parse(hotelRev.getHtrevChkout());

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(chkinDate);

		List<RevRoomVO> revRoomList = hotelRev.getRevRoomList();
		log.info("rrrrrrrrrr >> {} : ", revRoomList);
		log.info("dddddddddddddd>>>>>>>>>>>> {} : ", revRoomList.get(0).getRevroomId());

		while(!calendar.getTime().after(chkoutDate)) {
		     // 오후(PM) 슬롯 추가
            String pmDateSlotNm = sdf.format(calendar.getTime()) + "PM";

            for (RevRoomVO revRoom : revRoomList) {
            	log.info("revroomId1 : >>>>>>>>>>>>>>> {}", revRoom.getRevroomId());
//            	DateslotDefaultVO dateSlot = createDateSlot(revRoom.getRevroomId(), pmDateSlotNm);
//            	dateSlots.add(dateSlot);
            	dateSlots.add(createDateSlot(revRoom.getRevroomId(), pmDateSlotNm));
//            	dateSlots.add(createDateSlot(dateSlotNm));
            }

            // 다음 날로 이동
            calendar.add(Calendar.DATE, 1);
//
            if (!calendar.getTime().after(chkoutDate)) {
            	String amDateSlotNm = sdf.format(calendar.getTime()) + "AM";
                for (RevRoomVO revRoom : revRoomList) {
                	log.info("revroomId2 : >>>>>>>>>>>>>>> {}", revRoom.getRevroomId());
//                	DateslotDefaultVO dateSlot = createDateSlot(revRoom.getRevroomId(), amDateSlotNm);
//                	dateSlots.add(dateSlot);
                	dateSlots.add(createDateSlot(revRoom.getRevroomId(), amDateSlotNm));
//                	dateSlots.add(createDateSlot(amDateSlotNm));
                }
            }

            /*
             * 1. select *from rev_room; << 정렬해서 제일 마지막꺼 가져오기
             * 2. 파라미터 없이 그냥 저거 긁어서 vo에 담음
             * 3. 그 vo를 읽으면 마지막 Key를 얻을 수 있음
             * 4. substring, concat => service(자바에서 처리, 쿼리말고)
             * 5. dateSlots 의 revRoomId를 설정해줌 위에서 스트링 처리한 결과를 ex) RR00057 이런거를 set을 하던 멀 하던 하면 됨
             * 6. dao.insertDateSlot(dateSlots);
             */

		}
		dao.insertDateSlot(dateSlots);

	}


	/*
	private List<DateslotDefaultVO> createDateSlots(HotelRevVO hotelRev) throws ParseException {
        // Check-in 날짜와 Check-out 날짜 사이의 날짜를 기준으로 DateSlot 생성
        List<DateslotDefaultVO> dateSlotList = new ArrayList<>();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date chkinDate = sdf.parse(hotelRev.getHtrevChkin());
		Date chkoutDate = sdf.parse(hotelRev.getHtrevChkout());

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(chkinDate);

		while(!calendar.getTime().after(chkoutDate)) {
			DateslotDefaultVO dateSlot = new DateslotDefaultVO();
			// 오후(PM) 슬롯 추가
			String dateSlotNm = sdf.format(calendar.getTime()) + "PM";

			List<RevRoomVO> revRoomList = hotelRev.getRevRoomList();

			for (RevRoomVO revRoom : revRoomList) {
				dateSlot.setRevroomId(revRoom.getRevroomId());
				dateSlot.setDateslotNm(dateSlotNm);
				dateSlotList.add(dateSlot);
				log.info("revRoom1 >>>>>>>>>>>>> {} : ", revRoom);
			}

			// 다음 날로 이동
			calendar.add(Calendar.DATE, 1);

			if (!calendar.getTime().after(chkoutDate)) {
				String amDateSlotNm = sdf.format(calendar.getTime()) + "AM";
				for (RevRoomVO revRoom : revRoomList) {
					dateSlot = new DateslotDefaultVO();
					dateSlot.setRevroomId(revRoom.getRevroomId());
					dateSlot.setDateslotNm(amDateSlotNm);
					dateSlotList.add(dateSlot);
					log.info("revRoom2 >>>>>>>>>>>>> {} : ", revRoom);
				}
			}
		}

        return dateSlotList;
    }
    */



	 private DateslotDefaultVO createDateSlot(String revroomId,String dateslotNm) {
		DateslotDefaultVO dateSlot = new DateslotDefaultVO();
	 	dateSlot.setRevroomId(revroomId);
        dateSlot.setDateslotNm(dateslotNm);
        return dateSlot;
    }



	@Override
	public List<HotelRevVO> selectHotelRevList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectHotelRevList(paging);
	}

	@Override
	public List<HotelRevVO> selectArriveYNList(PaginationInfo paging) {
		int totalRecord = dao.selectArriveTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectArriveYNList(paging);
	}

	@Override
	public HotelRevVO selectHotelRev(HotelRevVO hotelRev) {
		return dao.selectHotelRev(hotelRev);
	}

	@Override
	public HotelRevVO selectOneHtrev(String what) {
		return dao.selectOneHtrev(what);
	}
	@Override
	public List<RevRoomVO> selectRevroomList(String what) {
		return dao.selectRevroomList(what);
	}
	@Override
	public List<ExtrachargesVO> selectExtrachargeList(String what) {
		return dao.selectExtrachargeList(what);
	}
	@Override
	public int selectTotalExtra(String what) {
		return dao.selectTotalExtra(what);
	}



	@Override
	public void updateArriveComplete(String what) {
		dao.updateArriveComplete(what);
	}

	@Override
	public void updateRevSt(HotelRevVO htrevVO) {
		dao.updateRevSt(htrevVO);
		String trevId = htrevVO.getTrevId();
		String trevSt = htrevVO.getTrevSt();
		if(trevSt.equals("IN")) {
			dao.updateRoomSt(trevId);
		}

	}
	@Override
	public void updateRoomSt(String roomId) {
		dao.updateRoomSt(roomId);
	}

	@Override
	public void updateHotelRev(HotelRevVO hotelRev) {
		dao.updateHotelRev(hotelRev);
		dao.updateRevRoom(hotelRev);
		dao.updateTotalRev(hotelRev);
		dao.updateRoomStatus(hotelRev);
	}


	@Override
	public void deleteHotelRev(HotelRevVO htrevId) {
		// TODO Auto-generated method stub

	}

















}
