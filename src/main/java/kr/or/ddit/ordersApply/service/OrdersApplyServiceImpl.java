package kr.or.ddit.ordersApply.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.orders.dao.OrdersMapper;
import kr.or.ddit.ordersApply.dao.OrdersApplyMapper;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.OrdersApplyVO;
import kr.or.ddit.vo.OrdersVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrdersApplyServiceImpl implements OrderApplyService {
	
	@Autowired
	private OrdersApplyMapper dao;
	
	@Override
	public List<OrdersApplyVO> selectOrdersApply(PaginationInfo paging) {
		int totalrecord =  dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalrecord);
		return dao.selectOrdersApply(paging);
		
	}

	@Override
	public void insert(OrdersApplyVO orderApply) {
		dao.insert(orderApply);
		
	}

	@Override
	public List<OrdersApplyVO> selectOrdersApplyDetail(String orderApplyNo) {
		List<OrdersApplyVO> list = dao.selectOrdersApplyDetail(orderApplyNo);
		return list;
	}

	@Override
	public OrdersApplyVO selectOrdersEnter(String ordereApplyNo) {
		OrdersApplyVO orders = dao.selectOrdersEnter(ordereApplyNo);
		return orders;
	}

	
}


