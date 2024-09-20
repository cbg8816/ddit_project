package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class PaystubDefaultVO implements Serializable {
    private String paystubYm;

    private String empId;

    private String speId;

    private LocalDateTime paystubStdate;

    private LocalDateTime paystubEnddate;

    private LocalDateTime field4;

    private Short paystubNomal;

    private Short paystubBonus;

    private Short paystubOvertime;

    private Short paystubTotal;

    private Short deductible;

    private static final long serialVersionUID = 1L;
}