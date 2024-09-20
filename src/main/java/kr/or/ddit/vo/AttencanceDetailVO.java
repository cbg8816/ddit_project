package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class AttencanceDetailVO implements Serializable {
	private String adId;
	private String empId;
	private String adContent;
	private String adCatagory;

	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate adStrDate;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate adEndDay;

	private EmpVO empvo;


}
