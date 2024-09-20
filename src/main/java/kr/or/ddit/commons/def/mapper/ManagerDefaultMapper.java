package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.ManagerDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ManagerDefaultMapper {
    int deleteByPrimaryKey(String mngId);

    int insert(ManagerDefaultVO row);

    ManagerDefaultVO selectByPrimaryKey(String mngId);

    List<ManagerDefaultVO> selectAll();

    int updateByPrimaryKey(ManagerDefaultVO row);
}