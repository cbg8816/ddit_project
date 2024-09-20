package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class BudgetDefaultVO implements Serializable {
    private String budId;

    private LocalDateTime budStartDate;

    private LocalDateTime budEndDate;

    private Short budAmount;

    private String budGu;

    private static final long serialVersionUID = 1L;
}