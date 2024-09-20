package kr.or.ddit.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of = "inqNo")
@Data
public class InquireVO {
	private String inqNo;
	@NotBlank(groups = InsertGroup.class)
	private String memId;
	@NotBlank(groups = {InsertGroup.class, UpdateGroup.class}, message = "필수사항입니다.")
	private String inqTitle;
	@NotBlank(groups = {InsertGroup.class, UpdateGroup.class}, message = "필수사항입니다.")
	private String inqContent;
	@NotBlank(groups = InsertGroup.class, message = "필수사항입니다.")
	private String inqWriter;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate inqRegdate;
	@NotBlank(groups = {InsertGroup.class, UpdateGroup.class}, message = "필수사항입니다.")
	private String inqCategory;
	private String inqFile;
	private String inqComment;
	private String inqLock;
	private int no;
	private String memTel;
	private String memEmail;
}
