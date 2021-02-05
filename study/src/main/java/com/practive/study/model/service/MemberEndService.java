package com.practive.study.model.service;

import com.practive.study.model.vo.Member;

public interface MemberEndService {

	// 회원가입 
	int insertMember(Member member);
	// 아이디 중복 체크
	int userIdCheck(String userId);
}
