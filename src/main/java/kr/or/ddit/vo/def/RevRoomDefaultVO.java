package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class RevRoomDefaultVO implements Serializable {
    private String revroomId;

    private String htrevId;

    private String roomId;

    private String roomtypeId;

    private static final long serialVersionUID = 1L;

}