package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "orderTurn")
@ToString
public class OrdersVO implements Serializable {
	
    private String orderTurn;

    private String orderBuyer;

    private LocalDateTime orderDate;

    private String orderState;

    private String orderPaymentstate;

    private Integer orderQty;

    private Integer orderPrice;

    private Integer orderTotal;
    
    private String orderLgu;

    private String orderId;
    
    private ProdVO prod;
    
    private LprodVO lprod;
    
    private BuyerVO buyer;
    
    private OrdersApplyVO orderApply;
}