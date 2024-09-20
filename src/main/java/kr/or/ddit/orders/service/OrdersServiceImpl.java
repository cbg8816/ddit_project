package kr.or.ddit.orders.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.orders.dao.OrdersMapper;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.OrdersVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrdersServiceImpl implements OrderService {

	@Autowired
	private OrdersMapper dao;
	
	@Override
	public void createOrders(OrdersVO orders) {
		dao.insert(orders);
	}

	@Override
	public List<OrdersVO> retrieveordersList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectAll(paging);
	}

	@Override
	public void modifyorders(String enter, String no) {
		dao.updateByPrimaryKey(enter,no);

	}

	@Override
	public void deleteorders(String ordersTurn) {
		dao.deleteByPrimaryKey(ordersTurn);

	}

	@Override
	public List<OrdersVO> selectOrdersApply(LocalDate orderDate, String orderBuyer) {
		List<OrdersVO> orderSelect = dao.selectOrdersApply(orderDate, orderBuyer);
		return orderSelect;
	}

	@Override
	public List<OrdersVO> retrieveordersDetail(String ordersTurn) {
		List<OrdersVO> orders = dao.selectByPrimaryKey(ordersTurn);
		return orders;
	}

}
