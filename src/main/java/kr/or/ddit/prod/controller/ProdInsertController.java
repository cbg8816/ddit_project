package kr.or.ddit.prod.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.lprod.dao.LprodMapper;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProdVO;

	@Controller
	@RequestMapping("/prod/prodInsert.do")
	public class ProdInsertController{
		@Autowired
		private ProdService service;
		@Autowired
		private LprodMapper lprodDAO;
		
		@ModelAttribute("lprodList")
		public List<LprodVO> addAttribute(HttpServletRequest req) {
			return lprodDAO.selectLprodList();
		}
		
		@ModelAttribute("prod")
		public ProdVO prod() {
			return new ProdVO();
		}
		
		@GetMapping
		public String formUI(){
			return "tiles:prod/prodInsert";
		}
		
		@PostMapping
		public String formDataProcess(
			@Validated(InsertGroup.class) @ModelAttribute("prod") ProdVO prod
			, Errors errors
		){
			String lvn = null;
			if(!errors.hasErrors()) {
				service.createProd(prod);
				lvn = "redirect:/prod/prodDetail.do?what="+prod.getProdId();
			}else {
				lvn = "tiles:prod/prodInsert";
			}
			return lvn;
		}
		
	    @GetMapping("/getDummyProductData")
	    @ResponseBody
	    public ProdVO getDummyProductData() {
	    	ProdVO product = new ProdVO();
	        product.setProdLgu("P101");
	        product.setProdBuyer("P10101");
	        product.setProdPrice(10000);
	        product.setProdProperstock(50);
	        product.setProdName("테스트 재고");
	        product.setProdOutline("테스트 재고 요약정보");
	        product.setProdDetail("테스트 재고 디테일정보");
	        
	        return product;
	    }
	}
		

