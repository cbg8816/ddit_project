package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.AtchFileDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AtchFileDefaultMapper {
    int deleteByPrimaryKey(String atchFileId);

    int insert(AtchFileDefaultVO row);

    AtchFileDefaultVO selectByPrimaryKey(String atchFileId);

    List<AtchFileDefaultVO> selectAll();

    int updateByPrimaryKey(AtchFileDefaultVO row);
}