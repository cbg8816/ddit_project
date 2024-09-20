package kr.or.ddit.approval.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.ApprovalLineVO;
import kr.or.ddit.vo.AttencanceVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PmsApprovalVO;

@Mapper
public interface ApprovalMapper {

	public List<EmpVO> selectEmployees();

// 보관함 리스트
	public List<PmsApprovalVO> approvalboxList(PaginationInfo paging);

	// 완료함
	public List<PmsApprovalVO> completedApprovals(PaginationInfo paging);

	// 반려함
	public List<PmsApprovalVO> returnApprovals(PaginationInfo paging);

	//결재요청함
	public List<PmsApprovalVO> requestboxList(PaginationInfo paging);

	public AttencanceVO selectAttencanceByEmpId(String empId);


	public void annualupdate(PmsApprovalVO pmsapproval);

	public List<PmsApprovalVO> allList();

	public PmsApprovalVO detailAppro(String aprId);

	public void linecreate(ApprovalLineVO lineVO);




}
