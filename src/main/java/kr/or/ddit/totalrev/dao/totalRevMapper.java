package kr.or.ddit.totalrev.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface totalRevMapper {
	public int selectMemMil(String memId);
}
