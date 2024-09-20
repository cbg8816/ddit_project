package kr.or.ddit.enter.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.EnterVO;

public interface EnterService {
	public void createEnter(EnterVO enter);
	public EnterVO retrieveEnter(String enterNo);
	public List<EnterVO> retrieveEnterList(PaginationInfo paging);
	public void modifyEnter(EnterVO enter);
	public void deleteEnter(String enterNo);
}
