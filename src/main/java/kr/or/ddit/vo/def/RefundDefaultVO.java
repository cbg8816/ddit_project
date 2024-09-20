package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class RefundDefaultVO implements Serializable {
    private String refundId;

    private String payId;

    private String refundCn;

    private LocalDateTime refundDate;

    private static final long serialVersionUID = 1L;
}