package kr.or.ddit.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(of="hkbNo")
public class BrokenRoomVO implements Serializable{



	private Integer hkbNo;

	private String roomId;

	private String hkbLocation;

	private String hkbInfor;

	@NotBlank(message = "담당자를 지정해주세요")
	private String hkbEmp;

	private String hkbComple;

	private String roomtypeId;

	private String hkbDay;

	private RoomStatusVO roomstatus;
}
