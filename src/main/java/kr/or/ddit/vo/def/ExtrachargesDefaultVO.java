package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class ExtrachargesDefaultVO implements Serializable {
    private String extcrgNo;

    private String etId;

    private Short extcrgQty;

    private LocalDateTime extcrgDate;

    private static final long serialVersionUID = 1L;
}