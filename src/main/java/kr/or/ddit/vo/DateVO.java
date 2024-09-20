package kr.or.ddit.vo;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class DateVO {
	// DATE_SEQ
//	@DateTimeFormat(iso = ISO.DATE)
//	private LocalDate dateSeq;
	private String dateSeq;
//	private List<ForeCastingVO> dateSeqList;
}
