package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class EnterDefaultVO implements Serializable {
    private String orderTurn;

    private LocalDateTime enterDay;

    private Short enterQty;

    private Short enterPrice;

    private static final long serialVersionUID = 1L;
}