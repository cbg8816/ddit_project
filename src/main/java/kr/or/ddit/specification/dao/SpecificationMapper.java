package kr.or.ddit.specification.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.SpecificationVO;

@Mapper
public interface SpecificationMapper {
	public List<SpecificationVO> selectSpecificationList();
}
