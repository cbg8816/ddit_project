package kr.or.ddit.member.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.MemberVO;

@RequestMapping("/web/member/insert.do")
@Controller
public class MemberInsertContoller {
	@Autowired
	private MemberService memberService;

	// 모델명 미리 결정
	public static final String MODELNAME = "member";

	@ModelAttribute(MODELNAME)
	public MemberVO member() {
		return new MemberVO();
	}

	@GetMapping
	public String doGet() {
		return "wiles:member/insert";
	}

	@PostMapping
	public String doPost(
			@Validated(InsertGroup.class) @ModelAttribute(MODELNAME) MemberVO member
			, BindingResult errors
			, RedirectAttributes redirectAttributes)
		{
			String lvn = null;
			if(!errors.hasErrors()) {
				String pw = member.getMemLoginPw();
				PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
				String encodePassWord = encoder.encode(pw);
				member.setMemLoginPw(encodePassWord);

				memberService.insertMember(member);
				redirectAttributes.addFlashAttribute("message", "회원가입 완료!");
				lvn = "redirect:/web/login.do";
			}else {
				redirectAttributes.addFlashAttribute(MODELNAME, member);
				redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + MODELNAME, errors);
				lvn = "redirect:/web/member/insert.do";
			}

		return lvn;
	}
}
