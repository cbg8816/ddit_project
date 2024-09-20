package kr.or.ddit.invest.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.lprod.dao.LprodMapper;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProdVO;

	@Controller
	@RequestMapping("/invest/investInsert.do")
	public class InvestlInsertController{
		
		@GetMapping
		public String formUI(){
			return "tiles:invest/investInsert";
		}
		
		@PostMapping
		public String formDataProcess(
			
		){
			return "tiles:invest/investInsert";
		}
		
	}

