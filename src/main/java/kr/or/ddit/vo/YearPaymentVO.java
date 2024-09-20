package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class YearPaymentVO {

	private String condition;
	private int[] thisYearPayment;
	private int[] lastYearPayment;
	private List<String> roomTypeList;

	private List<Integer> monthTotalList;
	private List<int[]> monthEachList;

}
