package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.UseOfProdDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UseOfProdDefaultMapper {
    int deleteByPrimaryKey(@Param("prodId") String prodId, @Param("lprdoId") String lprdoId);

    int insert(UseOfProdDefaultVO row);

    UseOfProdDefaultVO selectByPrimaryKey(@Param("prodId") String prodId, @Param("lprdoId") String lprdoId);

    List<UseOfProdDefaultVO> selectAll();

    int updateByPrimaryKey(UseOfProdDefaultVO row);
}