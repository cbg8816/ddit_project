package kr.or.ddit.confirm.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.ConfirmVO;

public interface ConfirmOrdersService {

	public List<ConfirmVO> requiredConfirmList(PaginationInfo paging);

	public void modifyOrderState(String orderApplyNo);

}
