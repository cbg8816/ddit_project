package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class EventVenueDefaultVO implements Serializable {
    private String venueNo;

    private String venueName;

    private Integer venuePea;

    private String venuePlace;

    private Short venuePrice;

    private String venueSign;

    private static final long serialVersionUID = 1L;
}