package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class RoomstatusDefaultVO implements Serializable {
    private String roomId;

    private String roomtypeId;

    private String hkpNo;

    private String roomSt;

    private static final long serialVersionUID = 1L;
}