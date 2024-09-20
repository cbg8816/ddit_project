package kr.or.ddit.emp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.department.dao.DepartmentMapper;
import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.position.dao.PositionMapper;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PositionVO;

@Controller
@RequestMapping("emp/empInsert.do")
public class EmpInsertController {

	@Autowired
	public EmpService service;

	@Autowired
	public PositionMapper posiDAO;

	@Autowired
	public DepartmentMapper deptDAO;

	@ModelAttribute("posiList")
	public List<PositionVO> addAttributeP(){
		return posiDAO.selectPositionList();
	}

	@ModelAttribute("deptList")
	public List<DepartmentVO> addAttributeD(){
		return deptDAO.selectDepartmentList();
	}

	@ModelAttribute("emp")
	public EmpVO emp() {
		return new EmpVO();
	}

	@GetMapping
	public String FormUI () {
		return "tiles:emp/empInsert";
	}

	@PostMapping
	public String formDataProcess(
		@Validated @ModelAttribute("emp") EmpVO emp
		, BindingResult errors
		, RedirectAttributes redirectAttributes
//		, Map<String, String> map
	) {

//		System.out.println("mapTest : "+ map);

		redirectAttributes.addFlashAttribute("emp", emp);

		if(!errors.hasErrors()) {
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			service.createEmp(emp);
			return "redirect:/emp/empList.do";
		}else {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "emp", errors);
			return "redirect:/emp/empInsert.do";
		}
	}


}
