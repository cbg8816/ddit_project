package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class HotelRevDefaultVO implements Serializable {
    private String htrevId;

    private String htrevCn;

    private String htrevChkin;

    private String htrevChkout;

    private Short htrevStay;

    private String htrevPlatform;

    private String htrevSt;

    private String htrevPakyn;

    private int htrevTprice;

    private String htrevSlot;

    private static final long serialVersionUID = 1L;
}