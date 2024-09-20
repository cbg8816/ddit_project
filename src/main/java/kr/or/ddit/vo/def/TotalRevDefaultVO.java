package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class TotalRevDefaultVO implements Serializable {
    private String trevId;

    private String memId;

    private int trevAdult;

    private int trevChild;

    private String trevPayopt;

    private String trevRtype;
    
    private String trevSt;
    
    private LocalDate trevDate;

    private String trevCarno;
    
    private static final long serialVersionUID = 1L;
}