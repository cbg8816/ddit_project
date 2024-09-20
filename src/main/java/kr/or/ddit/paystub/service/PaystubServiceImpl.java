package kr.or.ddit.paystub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.paystub.dao.PaystubMapper;
import kr.or.ddit.vo.PaystubVO;

@Service
public class PaystubServiceImpl implements PaystubService {

	@Autowired
	private PaystubMapper dao;

	@Override
	public List<PaystubVO> retrievePaystubList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectPaystubList(paging);
	}

	@Override
	public PaystubVO retrievePaystub(String paystubId) {
		return dao.selectPaystub(paystubId);
	}

	@Override
	public void createPaystub(PaystubVO paystubId) {
		dao.insertPaystub(paystubId);
	}

//	@Override
//	public void modifyPaystub(PaystubVO paystubId) {
//		dao.updatePaystub(paystubId);
//	}
//
//	@Override
//	public void removePaystub(String paystubId) {
//		dao.deletePaystub(paystubId);
//	}

	@Override
	public PaystubVO retrievePaystubListBasic() {
		return dao.selectPaystubListBasic();
	}

	@Override
	public void createPaystubList(List<PaystubVO> paystubList) {
		dao.insertPaystubList(paystubList);

	}

	@Override
	public List<PaystubVO> retrieveEmpPaystubList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectEmpPaystubList(paging);
	}

}
