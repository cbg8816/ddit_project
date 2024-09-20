package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;

import lombok.Data;

@Data
public class HousekeepingLostitemVO implements Serializable{

	private String hksNo;
	private String hksWriter;
	private LocalDate hksDate;
	private String hksPlace;
	private String hksAcquirer;
	private String hksKind;
	private String hksRegi;
	private String hksNote;

}
