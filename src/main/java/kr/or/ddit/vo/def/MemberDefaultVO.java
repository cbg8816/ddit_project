package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class MemberDefaultVO implements Serializable {
    private String memId;

    private String rankCode;

    private String memName;

    private String memCategory;

    private String memLoginId;

    private String memLoginPw;

    private String memEmail;

    private String memTel;

    private String memYn;

    private static final long serialVersionUID = 1L;
}