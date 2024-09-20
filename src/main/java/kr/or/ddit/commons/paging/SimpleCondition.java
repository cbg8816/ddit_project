package kr.or.ddit.commons.paging;

import lombok.Data;

@Data
public class SimpleCondition {
	private String searchType;
	private String searchWord;
	private String boxType;
	private String empId;
}
