package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.MileageDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MileageDefaultMapper {
    int deleteByPrimaryKey(@Param("milId") String milId, @Param("memId") String memId);

    int insert(MileageDefaultVO row);

    MileageDefaultVO selectByPrimaryKey(@Param("milId") String milId, @Param("memId") String memId);

    List<MileageDefaultVO> selectAll();

    int updateByPrimaryKey(MileageDefaultVO row);
}