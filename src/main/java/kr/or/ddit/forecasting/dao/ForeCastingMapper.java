package kr.or.ddit.forecasting.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.DateVO;
import kr.or.ddit.vo.GayongVO;

@Mapper
public interface ForeCastingMapper {

	/**
	 * forecasting 조회
	 * @return List<ForeCastingVO>
	 */
//	public List<ForeCastingVO> selectForeCasting();

	public List<GayongVO> selectForeCasting(@Param("startDate") String startDate, @Param("endDate")String endDate);
	public List<Map<String, String>> selectNotInRoomId(@Param("startDate")String startDate, @Param("endDate")String endDate);

	public List<DateVO> dayList(@Param("startDate")String startDate, @Param("endDate")String endDate);

}
