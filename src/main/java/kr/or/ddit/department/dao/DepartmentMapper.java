package kr.or.ddit.department.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.DepartmentVO;

@Mapper
public interface DepartmentMapper {
	public List<DepartmentVO> selectDepartmentList();
	public DepartmentVO selectDepartment(String depId);
}
