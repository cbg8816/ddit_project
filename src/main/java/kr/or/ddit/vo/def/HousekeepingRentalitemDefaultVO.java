package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class HousekeepingRentalitemDefaultVO implements Serializable {
    private String hkrNo;

    private String hkrWriter;

    private String prodId;

    private LocalDateTime hkrDate;

    private String hkrRoom;

    private String hkrCostomer;

    private LocalDateTime hkrCheckin;

    private LocalDateTime hkrCheckout;

    private String hkrKind;

    private Short hkrQty;

    private String hkrHp;

    private String hkrReturn;

    private Integer lprdoId;

    private static final long serialVersionUID = 1L;
}