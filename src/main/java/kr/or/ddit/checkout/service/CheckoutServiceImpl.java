package kr.or.ddit.checkout.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.checkout.dao.CheckoutDAO;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.extcrgtype.dao.ExtcrgTypeDAO;
import kr.or.ddit.extracharges.dao.ExtrachargesDAO;
import kr.or.ddit.vo.CheckoutVO;
import kr.or.ddit.vo.ExtcrgTypeVO;
import kr.or.ddit.vo.ExtrachargesVO;

/**
 * 퇴실/정산 Service
 *
 */
@Service
public class CheckoutServiceImpl implements CheckoutService {
	@Autowired
	private CheckoutDAO dao;
	@Autowired
	private ExtcrgTypeDAO exDao;
	@Autowired
	private ExtrachargesDAO extcDao;

	@Override
	public List<CheckoutVO> selectCheckoutList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);

		return dao.selectCheckoutList(paging);
	}

	@Override
	public List<CheckoutVO> selectCheckoutSysList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecordSys(paging);
		paging.setTotalRecord(totalRecord);

		return dao.selectCheckoutSysList(paging);
	}

	@Override
	public List<CheckoutVO> selectCheckoutDetail(String payId) {
		return dao.selectCheckoutDetail(payId);
	}

	// 기타요금 목록
	@Override
	public List<ExtcrgTypeVO> selectExtList() {
		return exDao.selectExtList();
	}

	// 기타요금 가격
	@Override
	public int selectExtPrice(String etId) {
		return exDao.selectExtPrice(etId);
	}

	// 고객별 기타요금 조회
	@Override
	public List<ExtrachargesVO> selectExt(String extcrgNo) {
		return extcDao.selectExt(extcrgNo);
	}

	// 고객별 기타요금 추가
	@Override
	public void insertExt(ExtrachargesVO extVO) {
		extcDao.insertExt(extVO);
	}

	// 고객별 기타요금 삭제
	@Override
	public void deleteExt(ExtrachargesVO extVO) {
		extcDao.deleteExt(extVO);
	}

	// 고객별 기타요금 수정
	@Override
	public void updateExt(ExtrachargesVO extVO) {
		extcDao.updateExt(extVO);
	}

	// 고객별 기타요금 합계
	@Override
	public int selectTotal(String payId) {
		return extcDao.selectTotal(payId);
	}

	// 고객별 기타요금 결제
	@Override
	public void updatePay(ExtrachargesVO extVO) {
		extcDao.updatePay(extVO);
	}

	// 고객별 결제 완료
	@Override
	public void updatePayOk(String trevId) {
		dao.updatePayOk(trevId);
		dao.updatePayOk2(trevId);
	}

	// 고객별 결제 완료3
	@Override
	public void updatePayOk3(String roomId) {
		dao.updatePayOk3(roomId);
	}

}
