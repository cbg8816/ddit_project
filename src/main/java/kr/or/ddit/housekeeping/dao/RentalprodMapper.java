package kr.or.ddit.housekeeping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.RentalprodVO;


@Mapper
public interface RentalprodMapper {

	public List<RentalprodVO> rentalProdList();

	public RentalprodVO selectQty(String renprodName);

}
