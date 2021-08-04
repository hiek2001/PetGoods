package com.practive.study.model.service;

import com.practive.study.model.vo.Member;

public interface MemberEndService {

	// 회원가입 
	int insertMember(Member member);

	// 로그인 값 확인
	int loginCheck(Member member);
}
