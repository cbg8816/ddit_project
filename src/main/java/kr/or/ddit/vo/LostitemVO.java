package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.lang.Nullable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="hksNo")
public class LostitemVO implements Serializable{

	private static final long serialVersionUID = 1L;

	private Integer hksNo;

	private String hksWriter;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate hksDate;

	private String hksPlace;

	private String hksAcquirer;

	private String hksKind;
	private String hksYn;
	

	@Nullable
	@Size(max=300)
	private String hksNote;

	private EmpVO emp;

}
