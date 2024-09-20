package kr.or.ddit.workshift.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.WorkshiftVO;
import kr.or.ddit.workshift.dao.WorkshiftDAO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class WorkshiftServiceImpl implements WorkshiftService {

	@Autowired
	private WorkshiftDAO dao;

	@Override
	public List<Map<String, Object>> selectWorkshiftList() {
        Map<String, Map<String, Object>> empWorkshiftMap = new LinkedHashMap<>();

        // DAO를 통해 데이터베이스에서 데이터 가져오기
        List<WorkshiftVO> workshiftData = dao.selectWorkshiftList();

        for (WorkshiftVO workshift : workshiftData) {
            String empName = workshift.getEmp().getEmpName();
            String workDay = workshift.getWorkDay();
            String workType = workshift.getWorkType();

            // 직원 이름이 아직 맵에 없으면 새로 추가
            empWorkshiftMap.computeIfAbsent(empName, k -> new LinkedHashMap<>());
            Map<String, Object> workDaysMap = empWorkshiftMap.get(empName);

            // 이름 저장
            workDaysMap.put("name", empName);
            // 근무일자별 근무타입 추가
            workDaysMap.put(workDay, workType);
        }

        // 리스트로 변환하여 반환
         return new ArrayList<>(empWorkshiftMap.values());

	}



	@Override
	public List<EmpVO> selectDepEmpList(String depid) {
		return dao.selectDepEmpList(depid);
	}

	@Override
	public List<WorkshiftVO> selectEmpWorkshiftList(String what, String dal) {
		return dao.selectEmpWorkshiftList(what, dal);
	}

	@Override
	public void updateWorkshift(List<WorkshiftVO> workshiftList) {
		dao.updateWorkshift(workshiftList);
	}



	@Override
	public List<WorkshiftVO> selectWorkshiftList2(int cnt, String dal) {
		return dao.selectWorkshiftList2(cnt, dal);
	}




	@Override
	public List<EmpVO> selecteEmpWorkshiftList(String dal, String depid) {
		List<EmpVO> empList = dao.selecteEmpWorkshiftList(dal, depid);
//		empList.forEach((emp)->{
//			System.out.println(emp.getEmpId() + emp.getEmpName());
//			emp.getWorkshiftList().forEach((work)->{
//				System.out.printf("%s\t", work.getWorkType());
//			});
//			System.out.println();
//		});
		return empList;
	}



}
