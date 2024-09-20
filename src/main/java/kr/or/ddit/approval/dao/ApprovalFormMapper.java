package kr.or.ddit.approval.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ApprovalFormVO;

@Mapper
public interface ApprovalFormMapper {

	public List<ApprovalFormVO> approvalformList();
}
