package kr.or.ddit.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.validate.groups.InsertGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="{hkpNo}")
public class HousekeepingVO implements Serializable{



	private int hkpNo;

	private String mngId;

	@NotBlank(groups = InsertGroup.class)
	private String hkpRoom;

	@NotBlank(groups = InsertGroup.class)
	private String hkpLocation;

	@NotBlank(groups = InsertGroup.class)
	private String hkpStatus;

	@NotBlank(groups = InsertGroup.class)
	private String hkpManager;

	@NotBlank(groups = InsertGroup.class)
	private String hkpNote;

	@NotBlank(groups = InsertGroup.class)
	private String hkpDay;

}
