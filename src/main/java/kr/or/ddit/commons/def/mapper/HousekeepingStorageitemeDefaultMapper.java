package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.HousekeepingStorageitemeDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface HousekeepingStorageitemeDefaultMapper {
    int deleteByPrimaryKey(@Param("hksNo") String hksNo, @Param("hksWriter") String hksWriter);

    int insert(HousekeepingStorageitemeDefaultVO row);

    HousekeepingStorageitemeDefaultVO selectByPrimaryKey(@Param("hksNo") String hksNo, @Param("hksWriter") String hksWriter);

    List<HousekeepingStorageitemeDefaultVO> selectAll();

    int updateByPrimaryKey(HousekeepingStorageitemeDefaultVO row);
}