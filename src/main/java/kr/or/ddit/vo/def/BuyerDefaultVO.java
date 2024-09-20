package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class BuyerDefaultVO implements Serializable {
    private String buyerId;

    private String buyerIname;

    private String buyerLgu;

    private String buyerBank;

    private String buyerBankno;

    private String buyerBankname;

    private String buyerZip;

    private String buyerAdd1;

    private String buyerAdd2;

    private String buyerComtel;

    private String buyerFax;

    private String buyerEmail;

    private String buyerCharger;

    private static final long serialVersionUID = 1L;
}