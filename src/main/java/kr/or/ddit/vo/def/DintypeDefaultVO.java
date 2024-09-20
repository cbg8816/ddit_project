package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class DintypeDefaultVO implements Serializable {
    private String dintypeId;

    private String dintypeNm;

    private int dintypeAdprice;

    private int dintypeChprice;

    private static final long serialVersionUID = 1L;
}