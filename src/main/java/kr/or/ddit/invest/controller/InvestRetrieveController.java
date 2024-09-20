package kr.or.ddit.invest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.vo.ProdVO;

@Controller
@RequestMapping("/invest")
public class InvestRetrieveController{
	
	
	@GetMapping("investList.do")
	public String list(
		
	){
//		PaginationInfo paging = new PaginationInfo();
//		paging.setPage(page);
//		paging.setSimpleCondition(simpleCondition);
//		
//		List<ProdVO> prodList = service.retrieveProdList(paging);
//		model.addAttribute("prodList", prodList);
//		
//		PaginationRenderer renderer = new DefaultPaginationRenderer();
//		String pagingHTML = renderer.renderPagination(paging);
//		
//		model.addAttribute("pagingHTML", pagingHTML);
		
		return "tiles:invest/investList";
	}
	
	@GetMapping("investDetail.do")
	public String detail(){
//		ProdVO prod = service.retrieveProd(prodId);
//		model.addAttribute("prod", prod);
		return "tiles:invest/investDetail";
	}
}















