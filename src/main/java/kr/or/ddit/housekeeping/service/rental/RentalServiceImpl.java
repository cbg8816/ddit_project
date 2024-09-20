package kr.or.ddit.housekeeping.service.rental;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.housekeeping.dao.RentalMapper;
import kr.or.ddit.vo.LostitemVO;
import kr.or.ddit.vo.RentalVO;
import kr.or.ddit.vo.def.RentalprodVO;
import lombok.RequiredArgsConstructor;

@Service
public class RentalServiceImpl implements RentalService{

	@Autowired
	private RentalMapper mapper;

	/**
	 * 대여물품 차감
	 * 대여중으로 상태 표시
	 */
	@Override
	public void createRental(RentalVO rental) {
		mapper.insertRenal(rental);
		mapper.updaterentalprod(rental);
	}

	/**
	 * 대여물품 전체 리스트
	 */
	@Override
	public List<RentalVO> readRentalList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.RentalList(paging);
	}

	/**
	 *	대여물품 상세 조회
	 */
	@Override
	public RentalVO readRental(int hkrNo) {
		return mapper.seletRental(hkrNo);
	}


	/**
	 * 대여물품 상세 수정
	 */
	@Override
	public void modifyRental(RentalVO rental) {
		mapper.updateRental(rental);
	}

	/**
	 *
	 */
	@Override
	public void modifyRentalfinish(RentalVO rental) {
		String[] hkrNos = rental.getHkrNos().split(",");
		for(String nos : hkrNos) {
			if(nos != null && !nos.equals("")) {
				rental.setHkrNo(Integer.parseInt(nos));
			}
			mapper.updateYn(rental);
		}
		mapper.updateprod(rental);
	}


	@Override
	public List<RentalVO> RetalIncompleteList(PaginationInfo paging) {
		return mapper.seletRetalIncomplete(paging);
	}

	@Override
	public List<RentalVO> RetalCompleteList(PaginationInfo paging) {
		return mapper.seletRetalComplete(paging);
	}

	@Override
	public int RetalIncompletecount() {
		return mapper.seletRentalIncompletecount();
	}

	@Override
	public int Retalcompletecount() {
		return mapper.seletRentalCompletecount();
	}





}
