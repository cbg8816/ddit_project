package kr.or.ddit.workshift.service;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.WorkshiftVO;
import kr.or.ddit.workshift.dao.WorkshiftDAO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
class WorkshiftServiceImplTest {

	@Autowired
	private WorkshiftDAO dao;

	@Test
	void test() {
//		List<WorkshiftVO> list = dao.selectWorkshiftList();
//
//		Calendar now = Calendar.getInstance();
//
//		int day = now.get(Calendar.DAY_OF_MONTH); //?이번달에 며칠까지 있는지 이거 구해서
//
//		Set<WorkshiftVO> set = new HashSet<WorkshiftVO>(list);
//
//		List<WorkshiftVO> llist = new ArrayList<>(set);
//		for (WorkshiftVO workshiftVO : llist) {
//			log.info("llist : >>>>> {}", workshiftVO);
//		}
		   Map<String, Map<String, Object>> empWorkshiftMap = new HashMap<>();

		   List<WorkshiftVO> workshiftData = dao.selectWorkshiftList();

	        for (WorkshiftVO workshift : workshiftData) {
	            String empName = workshift.getEmp().getEmpName();
	            String workDay = workshift.getWorkDay();
	            String workType = workshift.getWorkType();

	            // 새로운 직원이면 초기화
	            if (!empWorkshiftMap.containsKey(empName)) {
	                Map<String, Object> workDaysMap = new HashMap<>();
	                workDaysMap.put("name", empName);
	                empWorkshiftMap.put(empName, workDaysMap);
	            }

	            // 근무일자별 근무타입 추가
	            empWorkshiftMap.get(empName).put("workDay" + workDay, workType);
	        }

	       new ArrayList<>(empWorkshiftMap.values());

	        log.info(">>>>>>>>>> {}", new ArrayList<>(empWorkshiftMap.values()));

	}







	@Test
	void test2() {
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
//         new ArrayList<>(empWorkshiftMap.values());
         log.info("{}", new ArrayList<>(empWorkshiftMap.values()));

	}



	@Test
	void test3() {

//		Map<String, String> map = new HashMap<>();
//
//		List<WorkshiftVO> empList = dao.selectEmp();
//
//
//		for (WorkshiftVO workshiftVO : empList) {
//			List<WorkshiftVO> empWork = dao.selectEmpWork(workshiftVO.getEmpId());
//			log.info("empWorkList >>>>>> {}", empWork);
//		}

//		List<WorkshiftVO> empWork = dao.selectEmpWork(empList.get(0).getEmpId());
		String dal = null;
		String depid = "";
		List<EmpVO> empList = dao.selecteEmpWorkshiftList(dal, depid);
		empList.forEach((emp)->{
			System.out.println(emp.getEmpId() + emp.getEmpName());
			emp.getWorkshiftList().forEach((work)->{
				System.out.printf("%s\t", work.getWorkType());
			});
			System.out.println();
		});

		log.info("empList >> {}" ,empList);
	}







}
