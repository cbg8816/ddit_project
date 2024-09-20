package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.TotalRevDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TotalRevDefaultMapper {
    int deleteByPrimaryKey(String trevId);

    int insert(TotalRevDefaultVO row);

    TotalRevDefaultVO selectByPrimaryKey(String trevId);

    List<TotalRevDefaultVO> selectAll();

    int updateByPrimaryKey(TotalRevDefaultVO row);
    
}