package kr.or.ddit.vo;


import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

public class MemberVOWrapper extends User{

	private final MemberVO realUser;

	public MemberVOWrapper(MemberVO realUser) {
		super(realUser.getMemLoginId(), realUser.getMemLoginPw(), true, true, true, true, AuthorityUtils.createAuthorityList(realUser.getMemRole()));
		this.realUser = realUser;
	}

	public MemberVO getRealUser() {
		return realUser;
	}

}
