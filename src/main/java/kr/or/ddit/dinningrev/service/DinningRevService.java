package kr.or.ddit.dinningrev.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.DinningRevVO;

public interface DinningRevService {

	public void insertDinRev(DinningRevVO dinRev);

	public List<DinningRevVO> selectDinRevList(PaginationInfo paging);

	public DinningRevVO selectDinRev(String what);

	public void updateDinRev(DinningRevVO dinRev);

}
