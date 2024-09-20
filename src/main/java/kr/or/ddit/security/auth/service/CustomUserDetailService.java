package kr.or.ddit.security.auth.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.util.StringUtils;

import kr.or.ddit.emp.dao.EmpMapper;
import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;

public class CustomUserDetailService implements UserDetailsService{

	private MemberDAO mapper;

	public void setMapper(MemberDAO mapper) {
		this.mapper = mapper;
	}


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
		MemberVO realUser = mapper.selectMember(username);

		if(realUser==null) {
			throw new UsernameNotFoundException(String.format("%s 사용자 없음", username));
		}

		return new MemberVOWrapper(realUser);
	}

}
