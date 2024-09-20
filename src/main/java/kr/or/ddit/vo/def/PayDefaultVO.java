package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class PayDefaultVO implements Serializable {
    private String payId;

    private String payPayopt;

    private Short payTprice;

    private LocalDateTime payDate;

    private Short payDeposit;

    private String paySt;

    private String trevId;

    private String extcrgNo;

    private String etId;

    private static final long serialVersionUID = 1L;
}