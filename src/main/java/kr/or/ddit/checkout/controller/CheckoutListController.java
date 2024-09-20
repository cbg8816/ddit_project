package kr.or.ddit.checkout.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.checkout.service.CheckoutService;
import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.hotelrev.HotelCondition;
import kr.or.ddit.vo.CheckoutVO;
import kr.or.ddit.vo.ExtcrgTypeVO;
import kr.or.ddit.vo.ExtrachargesVO;

@Controller
@RequestMapping("checkout")
public class CheckoutListController {
	@Autowired
	private CheckoutService service;

	@GetMapping("list.do")
	public String selectCheckoutList(
			@RequestParam(required = false, defaultValue = "1") int page
			, Model model
			, @ModelAttribute("hotelCondition") HotelCondition hotelCondition
	)
	{
		PaginationInfo paging = new PaginationInfo(10, 5);

		paging.setPage(page);
		paging.setHotelCondition(hotelCondition);

		List<CheckoutVO> checkoutList = service.selectCheckoutList(paging);
		model.addAttribute("checkoutList", checkoutList);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "tiles:checkout/list";
	}

	@GetMapping(value = "syslist.do")
	public void selectCheckoutSysList(
			@RequestParam(required = false, defaultValue = "1") int page
			, Model model
			, @ModelAttribute("hotelCondition") HotelCondition hotelCondition
	)
	{
		PaginationInfo paging = new PaginationInfo(10, 5);

		paging.setPage(page);
		paging.setHotelCondition(hotelCondition);

		List<CheckoutVO> checkoutSysList = service.selectCheckoutSysList(paging);
		model.addAttribute("checkoutSysList", checkoutSysList);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);
	}

	@GetMapping("pay.do")
	public List<CheckoutVO> selectCheckoutDetail(@RequestParam String what) {
		List<CheckoutVO> checkoutList = service.selectCheckoutDetail(what);

		return checkoutList;
	}

	// 기타요금 목록
	@GetMapping("extList.do")
	public void selectPriceList(Model model) {
		List<ExtcrgTypeVO> extList = service.selectExtList();
		model.addAttribute("extList", extList);
	}

	// 기타요금 가격
	@GetMapping("extPrice.do")
	@ResponseBody
	public int selectExtPrice(@RequestParam String what) {
		int price = service.selectExtPrice(what);

		return price;
	}

	// 고객별 기타요금 조회
	@GetMapping("extcList.do")
	public void selectExt(@RequestParam String what, Model model) {
		List<ExtrachargesVO> extcList = service.selectExt(what);
		model.addAttribute("extcList", extcList);
	}

	// 고객별 기타요금 추가
	@PostMapping(value = "extcAdd.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public void insertExt(@RequestBody ExtrachargesVO extcVO) {

		service.insertExt(extcVO);
	}

	// 고객별 기타요금 삭제
	@GetMapping(value = "extcDel.do", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, String> deleteExt(@RequestParam String what1, @RequestParam String what2, @RequestParam String what3) {
		Map<String, String> map = new HashMap<String, String>();

		ExtrachargesVO extcVO = new ExtrachargesVO();
		extcVO.setExtcrgNo(what1);
		extcVO.setEtId(what2);
		extcVO.setPayId(what3);

		service.deleteExt(extcVO);

		map.put("message", "삭제되었습니다.");

		return map;
	}

	// 고객별 기타요금 수정
	@PostMapping("extcUd.do")
	@ResponseBody
	public void updateExt(@RequestBody ExtrachargesVO extcVO) {
		service.updateExt(extcVO);
	}

	// 고객별 기타요금 합계
	@GetMapping("extcTotal.do")
	public Map<String, Integer> selectTotal(@RequestParam String what){
		Map<String, Integer> map = new HashMap<String, Integer>();

		int total = service.selectTotal(what);

		map.put("total", total);

		return map;
	}

	// 고객별 기타요금 결제
	@PostMapping(value="extcPay.do")
	@ResponseBody
	public Map<String, String> updatePay(@RequestBody ExtrachargesVO extcVO) {
		Map<String, String> map = new HashMap<String, String>();

		service.updatePay(extcVO);

		map.put("msg", "ok");

		return map;
	}

	@GetMapping("checkoutOk.do")
	public void updatePayOk(@RequestParam String what) {
		service.updatePayOk(what);
	}

	@GetMapping("checkoutOk3.do")
	public void updatePayOk3(@RequestParam String what) {
		service.updatePayOk3(what);
	}
}
