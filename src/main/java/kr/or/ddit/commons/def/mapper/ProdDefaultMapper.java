package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.ProdDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProdDefaultMapper {
    int deleteByPrimaryKey(String prodId);

    int insert(ProdDefaultVO row);

    ProdDefaultVO selectByPrimaryKey(String prodId);

    List<ProdDefaultVO> selectAll();

    int updateByPrimaryKey(ProdDefaultVO row);
}