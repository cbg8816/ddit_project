package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.AssetDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AssetDefaultMapper {
    int deleteByPrimaryKey(String assetId);

    int insert(AssetDefaultVO row);

    AssetDefaultVO selectByPrimaryKey(String assetId);

    List<AssetDefaultVO> selectAll();

    int updateByPrimaryKey(AssetDefaultVO row);
}