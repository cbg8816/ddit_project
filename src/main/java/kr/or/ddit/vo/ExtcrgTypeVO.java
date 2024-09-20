package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "etId")
public class ExtcrgTypeVO implements Serializable {
	private String etId;
	private String etNm;
	private Integer etPrice;
	private String etType;
}
