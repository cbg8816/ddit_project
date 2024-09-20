package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.MiluseDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MiluseDefaultMapper {
    int deleteByPrimaryKey(@Param("miluseId") String miluseId, @Param("memId") String memId);

    int insert(MiluseDefaultVO row);

    MiluseDefaultVO selectByPrimaryKey(@Param("miluseId") String miluseId, @Param("memId") String memId);

    List<MiluseDefaultVO> selectAll();

    int updateByPrimaryKey(MiluseDefaultVO row);
}