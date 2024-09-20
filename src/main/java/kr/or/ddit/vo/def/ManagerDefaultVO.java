package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class ManagerDefaultVO implements Serializable {
    private String mngId;

    private String mngRoom;

    private static final long serialVersionUID = 1L;
}