package kr.or.ddit.vo;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

public class EmpVOWrapper extends User{
	private final EmpVO realUser;

	public EmpVOWrapper(EmpVO realUser) {
		super(realUser.getEmpId(), realUser.getEmpPw(), true, true, true, true, AuthorityUtils.createAuthorityList(realUser.getDepId()));
		this.realUser = realUser;
	}

	public EmpVO getPmsUser() {
		return realUser;
	}
}
