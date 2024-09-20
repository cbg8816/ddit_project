package kr.or.ddit.member.exception;

public class UserNotFoundException extends RuntimeException {
	public UserNotFoundException(String user) {
		super(String.format("%s 에 해당하는 사용자 없음.", user));
	}
}
