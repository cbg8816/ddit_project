package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class HousekeepingbrokenroomVO implements Serializable{


	private String hkpNo;

	private String roomId;

	private String hkpLocation;

	private String hkpInfor;

	private String hkpEmp;

	private String hkpComple;

	private String roomtypeId;

	private String hkpDay;

}
