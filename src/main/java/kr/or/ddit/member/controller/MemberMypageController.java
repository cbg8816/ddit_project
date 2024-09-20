package kr.or.ddit.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.inquire.service.InquireService;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.mileage.service.MileageService;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.validate.groups.UpdateMemPW;
import kr.or.ddit.vo.HotelRevVO;
import kr.or.ddit.vo.InquireVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MileageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/web")
@Controller
public class MemberMypageController {
	@Autowired
	private InquireService inquireService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MileageService mileageService;

	public static final String MODELNAME = "member";

	// 마이페이지
	@GetMapping("mypage.do")
	public String myPage() {
		return "wiles:mypage/mypage";
	}

	// 개인정보 수정
	@GetMapping("updatePage.do")
	public String updatePageUI(@RequestParam("what") String memLoginId, Model model) {
		MemberVO member = memberService.selectMember(memLoginId);
		model.addAttribute("member", member);

		return "wiles:mypage/update";
	}

	@PostMapping("updatePage.do")
	public String updatePageForm(@Validated(UpdateGroup.class) @ModelAttribute(MODELNAME) MemberVO member
			, BindingResult errors
			, RedirectAttributes redirectAttributes)
	{
//		log.info("formDataProcess : {}", member);
//		log.info("formDataProcess errors : {}", errors.hasErrors());
//		log.info("formDataProcess errors : {}", errors.getFieldErrorCount());
//		log.info("formDataProcess errors : {}", errors.getAllErrors());

		String lvn = null;
		if(!errors.hasErrors()) {
			memberService.updateMember(member);
			redirectAttributes.addFlashAttribute("message", "로그아웃 후 변경사항이 적용됩니다!");
			lvn = "redirect:home.do";
		}else {
			redirectAttributes.addFlashAttribute(MODELNAME, member);
			redirectAttributes.addFlashAttribute("message", "개인정보 수정 실패!");
			lvn = "redirect:updatePage.do?what=" + member.getMemLoginId();
		}

		return lvn;
	}

	// 나의 문의내역
		@GetMapping("inquirePage.do")
		public String inquirePage(
				@RequestParam(required = false, defaultValue = "1") int page
				,Model model
				,@RequestParam("what") String memId)
		{
			PaginationInfo paging = new PaginationInfo(10, 5);

			paging.setPage(page);
			paging.setMemId(memId);

			List<InquireVO> inquireList = inquireService.selectInquireListMember(paging);
			model.addAttribute("inquireList", inquireList);

			PaginationRenderer renderer = new DefaultPaginationRenderer();
			String pagingHTML = renderer.renderPagination(paging);

			model.addAttribute("pagingHTML", pagingHTML);

			return "wiles:mypage/inquire";
		}

	// 예약 조회 / 취소(?)
	@GetMapping("revPage.do")
	public String revPage(
			@RequestParam(required = false, defaultValue = "1") int page
			, Model model
			, @RequestParam("what") String memId)
	{
		PaginationInfo paging = new PaginationInfo(10, 5);

		paging.setPage(page);
		paging.setMemId(memId);

		List<HotelRevVO> revList = memberService.selectHotelRevListMember(paging);
		model.addAttribute("revList", revList);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "wiles:mypage/rev";
	}

	// 마일리지 조회
	@GetMapping("milPage.do")
	public String milPage(
			@RequestParam(required = false, defaultValue = "1") int page
			, Model model
			, @RequestParam("what") String memId
			)
	{
		PaginationInfo paging = new PaginationInfo(10,5);

		paging.setPage(page);
		paging.setMemId(memId);

		List<MileageVO> milList = mileageService.selectListMileageMember(paging);
		model.addAttribute("milList", milList);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		int earn = mileageService.selectMileageEarn(memId);
		int use = mileageService.selectMileageUse(memId);
		int total = mileageService.selectMileageTotal(memId);

		model.addAttribute("earn", earn);
		model.addAttribute("use", use);
		model.addAttribute("total", total);

		return "wiles:mypage/mil";
	}

	// 비밀번호 변경
	@GetMapping("updatePw.do")
	public String updatePwUI(@RequestParam("what") String memLoginId, Model model) {
		MemberVO member = memberService.selectMember(memLoginId);
		model.addAttribute("member", member);

		return "wiles:mypage/updatePw";
	}

	@PostMapping("updatePw.do")
	public String updatePwForm(@Validated(UpdateMemPW.class) @ModelAttribute(MODELNAME) MemberVO member
			, BindingResult errors
			, RedirectAttributes redirectAttributes)
	{
		String lvn = null;
		if(!errors.hasErrors()) {
			String pw = member.getMemLoginPw();
			PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			String encodePassWord = encoder.encode(pw);
			member.setMemLoginPw(encodePassWord);

			memberService.updateMemberPw(member);
			redirectAttributes.addFlashAttribute("message", "로그아웃 후 변경사항이 적용됩니다!");
			lvn = "redirect:home.do";
		}else {
			redirectAttributes.addFlashAttribute(MODELNAME, member);
			redirectAttributes.addFlashAttribute("message", "영문 소문자, 숫자, 특수 문자(@,$,^,*)를 포함한 8~16 문자로 입력해주세요.");
			lvn = "redirect:updatePw.do?what=" + member.getMemLoginId();
		}

		return lvn;
	}

	// 회원 탈퇴
	@GetMapping("delete.do")
	public String delete(@RequestParam("what") String memLoginId
			, RedirectAttributes redirectAttributes) {
		memberService.deleteMember(memLoginId);

		return "redirect:logout.do";
	}
}
