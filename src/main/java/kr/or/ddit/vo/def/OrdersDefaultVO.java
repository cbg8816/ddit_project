package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class OrdersDefaultVO implements Serializable {
    private String orderTurn;

    private String orderBuyer;

    private LocalDateTime orderDate;

    private String orderState;

    private String orderPayment;

    private String orderPaymentstate;

    private Long orderQty;

    private Long orderPrice;

    private String orderLgu;

    private String orderProd;

    private static final long serialVersionUID = 1L;
}