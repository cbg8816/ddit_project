package kr.or.ddit.commons.def.mapper;

import java.util.List;
import kr.or.ddit.vo.def.HousekeepingRentalitemDefaultVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface HousekeepingRentalitemDefaultMapper {
    int deleteByPrimaryKey(@Param("hkrNo") String hkrNo, @Param("hkrWriter") String hkrWriter);

    int insert(HousekeepingRentalitemDefaultVO row);

    HousekeepingRentalitemDefaultVO selectByPrimaryKey(@Param("hkrNo") String hkrNo, @Param("hkrWriter") String hkrWriter);

    List<HousekeepingRentalitemDefaultVO> selectAll();

    int updateByPrimaryKey(HousekeepingRentalitemDefaultVO row);
}