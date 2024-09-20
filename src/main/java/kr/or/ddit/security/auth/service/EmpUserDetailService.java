package kr.or.ddit.security.auth.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.ddit.emp.dao.EmpMapper;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.EmpVOWrapper;

public class EmpUserDetailService implements UserDetailsService {

	private EmpMapper mapper;

	public void setMapper(EmpMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		EmpVO realUser = mapper.selectEmp(username);

		if(realUser==null) {
			throw new UsernameNotFoundException(String.format("%s 사용자 없음", username));
		}

		return new EmpVOWrapper(realUser);
	}

}
