package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class PackageDefaultVO implements Serializable {
    private String packageId;

    private String htRevId;

    private String packageName;

    private LocalDateTime packagePeriod;

    private LocalDateTime packageRegdate;

    private Short packagePrice;

    private String packagePlatform;

    private String packageContent;

    private static final long serialVersionUID = 1L;
}