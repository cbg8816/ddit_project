package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.FavoritesDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FavoritesDefaultMapper {
    int deleteByPrimaryKey(String favId);

    int insert(FavoritesDefaultVO row);

    FavoritesDefaultVO selectByPrimaryKey(String favId);

    List<FavoritesDefaultVO> selectAll();

    int updateByPrimaryKey(FavoritesDefaultVO row);
}