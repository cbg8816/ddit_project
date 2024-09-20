package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class BrokenRoomDefaultVO implements Serializable {
    private String hkpNo;

    private String roomId;

    private String hkpLocation;

    private String hkpInfor;

    private String hkpEmp;

    private String hkpComple;

    private String roomtypeId;

    private static final long serialVersionUID = 1L;
}