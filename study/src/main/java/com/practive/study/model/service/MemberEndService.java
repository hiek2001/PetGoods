package com.practive.study.model.service;

import com.practive.study.model.vo.Member;

public interface MemberEndService {

	// 회원가입 
	int insertMember(Member member);

	// 로그인 값 확인
	Member loginCheck(Member member);
	
	// 암호화된 비밀번호 db에서 가져오기
	String loginPw(String userEmail);
}
