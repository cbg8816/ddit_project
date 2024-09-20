package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class HousekeepingDefaultVO implements Serializable {
    private String hkpNo;

    private String mngId;

    private String hkpRoom;

    private String hkpLocation;

    private String hkpStatus;

    private String hkpManager;

    private String hkpNote;

    private String hkpDay;

    private static final long serialVersionUID = 1L;
}