package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class FavoritesDefaultVO implements Serializable {
    private String favId;

    private String favMemid;

    private String roomtypeId;

    private static final long serialVersionUID = 1L;
}