package kr.or.ddit.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.member.exception.UserNotFoundException;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.vo.MemberVO;

@RequestMapping("/web/member")
@Controller
public class IdCheckController {
	@Autowired
	private MemberService memberService;

	@PostMapping(value = "idCheck.do", produces = MediaType.APPLICATION_JSON_VALUE)
	public void idCheck(@RequestParam String memId, Model model) {
		try {
			memberService.selectMember(memId);
			model.addAttribute("valid", false);
			model.addAttribute("message", "아이디 중복");
		} catch (UserNotFoundException e) {
			model.addAttribute("valid", true);
			model.addAttribute("message", "사용가능 아이디");
		}
	}

	@PostMapping(value = "idChk.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, String> idChk(@RequestBody MemberVO memberVO) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			MemberVO member = new MemberVO();
			member.setMemName(memberVO.getMemName());
			member.setMemTel(memberVO.getMemTel());

			MemberVO member1 = memberService.selectMemberId(member);


			map.put("message", member1.getMemLoginId());
		} catch (UserNotFoundException e) {

			map.put("message", "일치하는 정보가 없습니다.");
		}
		return map;
	}

	@PostMapping(value = "pwChk.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, String> pwChk(@RequestBody MemberVO memberVO) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			MemberVO member = new MemberVO();
			member.setMemLoginId(memberVO.getMemLoginId());
			member.setMemName(memberVO.getMemName());
			member.setMemTel(memberVO.getMemTel());

			MemberVO member1 = memberService.selectMemberPw(member);

			map.put("message", "ok");
		} catch (UserNotFoundException e) {
			map.put("message", "일치하는 정보가 없습니다.");
		}
		return map;
	}
}
