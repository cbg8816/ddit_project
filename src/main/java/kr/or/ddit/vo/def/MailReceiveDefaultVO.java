package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class MailReceiveDefaultVO implements Serializable {
    private String mailRecvNo;

    private String mailReceiver;

    private String mailId;

    private LocalDateTime mailRecvDate;

    private String mailRecvYn;

    private String mailRecvDelyn;

    private static final long serialVersionUID = 1L;
}