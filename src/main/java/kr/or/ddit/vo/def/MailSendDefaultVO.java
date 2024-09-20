package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class MailSendDefaultVO implements Serializable {
    private String mailSendNo;

    private String mailSender;

    private String mailId;

    private LocalDateTime mailSendDate;

    private String mailSnedDelyn;

    private static final long serialVersionUID = 1L;
}