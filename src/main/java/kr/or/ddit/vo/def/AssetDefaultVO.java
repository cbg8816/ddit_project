package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class AssetDefaultVO implements Serializable {
    private String assetId;

    private String assetNm;

    private String assetType;

    private LocalDateTime assetDate;

    private Short assetPrice;

    private Short assetResvalue;

    private Short assetPrevalue;

    private static final long serialVersionUID = 1L;
}