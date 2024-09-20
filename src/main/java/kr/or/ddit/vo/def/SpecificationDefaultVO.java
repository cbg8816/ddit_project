package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class SpecificationDefaultVO implements Serializable {
    private String speId;

    private Short speNaPen;

    private Short speHeIns;

    private Short speEmpIns;

    private Short speLongIns;

    private Short speIncomeTax;

    private Short speLoIncomeTax;

    private static final long serialVersionUID = 1L;
}