package kr.or.ddit.position.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.PositionVO;

@Mapper
public interface PositionMapper {
	public List<PositionVO> selectPositionList();
}
