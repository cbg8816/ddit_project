package kr.or.ddit.security.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import kr.or.ddit.emp.dao.EmpMapper;
import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.security.auth.service.CustomUserDetailService;
import kr.or.ddit.security.auth.service.EmpUserDetailService;

//[스프링 시큐리티 절차 정리]
//1. Spring Security가 UserDetailsService를 통해 인증 객체를 검증한다.
//
//2.CustomUserDetailService는 사용자 정보를 조회하고, 이를 감싸서 반환한다.
//
//3. 사용자 정보는 UserDetails 인터페이스를 구현한 객체(MemberVOWrapper)로 감싸서 반환된다.
//3.1. 감싼 객체(MemberVOWrapper)는 Spring Security의 User 클래스를 상속받는다.
//
//4. 이 클래스의 생성자에 사용자 정보(아이디, 비밀번호, 권한 등)를 전달한다.
//4.1. 이후 Spring Security는 로그인 폼에서 입력된 값과 UserDetails 객체의 정보를 비교하여 자격을 검증한다.
//
//5. 입력된 아이디와 비밀번호가 UserDetails 객체의 정보와 일치하면 인증이 성공한다.


@Configuration
@EnableWebSecurity
public class SecurityContextConfig {

//	/**
//	    * 무조건 접근가능한 자원을 설정하는 객체를 빈으로 등록한다.
//	    * @return
//	    */
//	@Bean
//	 public WebSecurityCustomizer webSecurityCustomizer() {
//	    return (web) -> web.ignoring()
//	          .antMatchers("/resources/**")
//	          .antMatchers("/");
//	 }

	/**
	 * 인증객체 검증을 위해, UserDetailService를 구현한 회원 객체를 빈으로 등록한다.
	 * @param mapper
	 * @return
	 */
	@Bean
	public UserDetailsService userDetailService(MemberDAO mapper) {
		CustomUserDetailService userDetailService = new CustomUserDetailService();
		userDetailService.setMapper(mapper);
		return userDetailService;
	}

//	/**
//	 * 인증객체 검증을 위해, EmpUserDetailService를 구현한 회원 객체를 빈으로 등록한다.
//	 * @param mapper
//	 * @return
//	 */
//	@Bean
//	public UserDetailsService EmpUserDetailService(EmpMapper mapper) {
//		EmpUserDetailService userDetailService = new EmpUserDetailService();
//		userDetailService.setMapper(mapper);
//		return userDetailService;
//	}

	/**
	 * 단방향 암호화(복호화가 불가능한 방식)를 지원하는 빈을 등록한다.
	 * @return
	 */
	@Bean
	public PasswordEncoder passwordEncoder() {
		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		return encoder;
	}

	/**
	 * 스프링 시큐리티 필터체인을 통해, 회원의 보호자원 권한설정 및 로그인처리를 하는 빈을 등록한다.
	 * @param http
	 * @return
	 * @throws Exception
	 */
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/web/inquire/insert.do").hasAuthority("USER")
								.anyRequest().permitAll()
								.and()
								.formLogin()
								.loginPage("/web/login.do") // 사용자정의 로그인페이지를 지정한다.
								.loginProcessingUrl("/web/login.do") // form의 action 값 (POST 요청을 가로챈다.)
								.defaultSuccessUrl("/web/home.do") // 로그인 성공시 이동
								.failureUrl("/web/login.do") // 로그인 실패시 이동
								.usernameParameter("memLoginId") // 폼 아이디값을 받는다.
								.passwordParameter("memLoginPw") // 폼 비밀번호값을 받는다.
								.permitAll();
	    // logout
	    http.logout()
	       .logoutUrl("/web/logout.do")
	       .logoutSuccessHandler(
	             (request, response, authentication) ->
	                response.sendRedirect(request.getContextPath() + "/web/home.do")
	        );

		http.csrf().disable(); // CSRF 토큰을 무력화한다. (필드에서는 쓰지않는 방식이다.)
		return http.build();
	}

//	@Bean
//	public SecurityFilterChain EmpfilterChain(HttpSecurity http) throws Exception {
//		http.authorizeRequests().antMatchers().permitAll()
//								.anyRequest().permitAll()
//								.and()
//								.formLogin()
//								.loginPage("/pmslogin.do")
//								.loginProcessingUrl("/pmslogin.do") // form의 action 값 (POST 요청을 가로챈다.)
//								.defaultSuccessUrl("/") // 로그인 성공시 이동
//								.failureUrl("/pmslogin.do") // 로그인 실패시 이동
//								.usernameParameter("empId") // 폼 아이디값을 받는다.
//								.passwordParameter("empPw") // 폼 비밀번호값을 받는다.
//								.permitAll();
//		// logout
//		http.logout()
//		.logoutUrl("/pmslogout.do")
//		.logoutSuccessHandler(
//				(request, response, authentication) ->
//				response.sendRedirect(request.getContextPath() + "/")
//				);
//
//		http.csrf().disable(); // CSRF 토큰을 무력화한다. (필드에서는 쓰지않는 방식이다.)
//		return http.build();
//	}

}