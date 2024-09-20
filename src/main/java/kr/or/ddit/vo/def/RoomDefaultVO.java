package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class RoomDefaultVO implements Serializable {

    private String roomtypeId;
    private String roomtypeNm;
    private Integer roomtypePrice;
    private String roomtypePtype;

    private static final long serialVersionUID = 1L;
}