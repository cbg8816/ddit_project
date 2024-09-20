package kr.or.ddit.vo;

import java.io.Serializable;


import lombok.Data;

@Data
public class HousekeepingRentalVO implements Serializable{


	private String hkrNo;
	private String hkrWriter;
	private String prodId;
	private String hkrDate;
	private String hkrRoom;
	private String hkrCostomer;
	private String hkrCheckin;
	private String hkrCheckout;
	private String hkrKind;
	private Integer hkrQty;
	private String hkrHp;
	private String hkrReturn;
	private String lprodGu2;
}
