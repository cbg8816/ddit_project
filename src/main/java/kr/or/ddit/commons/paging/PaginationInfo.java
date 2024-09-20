package kr.or.ddit.commons.paging;

import kr.or.ddit.admin.AdminCondition;
import kr.or.ddit.dinningrev.DinningCondition;
import kr.or.ddit.enter.EnterCondition;
import kr.or.ddit.hotelrev.HotelCondition;
import kr.or.ddit.orders.OrdersCondition;
import kr.or.ddit.prod.ProdCondition;
import kr.or.ddit.vo.ConfirmCondition;
import kr.or.ddit.vo.TodayExtCondition;
import lombok.Getter;

@Getter
public class PaginationInfo {
	private int totalRecord; // DB 조회
	private int page; // 사용자의 요청 파라미터
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public void setPage(int page) {
		this.page = page;
	}


	private int recordCount; // 임의 결정
	private int pageSize; // 임의 결정

	public PaginationInfo() {
		this(10, 5);
	}
	public PaginationInfo(int recordCount, int pageSize) {
		super();
		this.recordCount = recordCount;
		this.pageSize = pageSize;
	}

	private SimpleCondition simpleCondition;
	public void setSimpleCondition(SimpleCondition simpleCondition) {
		this.simpleCondition = simpleCondition;
	}

	// 호텔예약 검색조건
	private HotelCondition hotelCondition;
	public void setHotelCondition(HotelCondition hotelCondition) {
		this.hotelCondition = hotelCondition;
	}

	// 다이닝예약 검색조건
	private DinningCondition dinCondition;
	public void setDinCondition(DinningCondition dinCondition) {
		this.dinCondition = dinCondition;
	}

	// 재고 검색조건
	private ProdCondition prodCondition;
	public void setProdCondition(ProdCondition prodCondition) {
		this.prodCondition = prodCondition;
	}
	// 발주 검색조건
	private OrdersCondition ordersCondition;
	public void setOrderCondition(OrdersCondition ordersCondition) {
		this.ordersCondition = ordersCondition;
	}
	// 입고 검색조건
	private EnterCondition enterCondition;
	public void setEnterCondition(EnterCondition enterCondition) {
		this.enterCondition = enterCondition;
	}

	// 관리자 검색조건
	private AdminCondition adminCondition;
	public void setAdminCondition(AdminCondition adminCondition) {
		this.adminCondition = adminCondition;
	}

	// 일일 기타요금 검색조건
	private TodayExtCondition todayExtCondition;
	public void setTodayExtCondition(TodayExtCondition todayExtCondition) {
		this.todayExtCondition = todayExtCondition;
	}

	// 비품 결재 승인 검색조건
	private ConfirmCondition confirmCondition;
	public void setConfirmCondition(ConfirmCondition confirmCondition) {
		this.confirmCondition = confirmCondition;
	}

	// 연산 필요
//	private int totalPage;
//	private int firstPage;
//	private int lastPage;
//	private int firstRecord;
//	private int lastRecord;

	public int getTotalPage() {
		return ((totalRecord-1)/recordCount) + 1;
	}
	public int getFirstPage() {
		return ((page-1)/pageSize)*pageSize + 1;
	}
	public int getLastPage() {
		int lastPageNoOnPageList = getFirstPage()+pageSize-1;
		if(lastPageNoOnPageList>getTotalPage()){lastPageNoOnPageList=getTotalPage();}
		return lastPageNoOnPageList;
	}
	public int getFirstRecord() {
		return getLastRecord() - (recordCount - 1);
	}
	public int getLastRecord() {
		return page * recordCount;
	}

	private String memId;
	public void setMemId(String memId) {
		this.memId = memId;
	}

	private String empId;
	public void setEmpId(String empId) {
		this.empId = empId;
	}

}











