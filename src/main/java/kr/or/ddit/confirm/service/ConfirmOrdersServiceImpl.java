package kr.or.ddit.confirm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.confirm.dao.ConfirmOrdersMapper;
import kr.or.ddit.vo.ConfirmVO;

@Service
public class ConfirmOrdersServiceImpl implements ConfirmOrdersService {

	@Autowired
	private ConfirmOrdersMapper mapper;

	@Override
	public List<ConfirmVO> requiredConfirmList(PaginationInfo paging) {
		int totalRecord = mapper.confirmTotalrecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.needConfirmOrdersList(paging);
	}

	@Override
	public void modifyOrderState(String orderApplyNo) {
		mapper.updateOrderState(orderApplyNo);
	}



}
