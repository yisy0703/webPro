package com.lec.ch06.ex1;

import org.aspectj.lang.ProceedingJoinPoint;

public class ProxyClass {
	// around advice : 핵심기능 전후로 공통기능 수행
	public Object aroundAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		System.out.println("---------------------------");
		String signatureName = joinPoint.getSignature().toString(); // 핵심기능 메소드명
		System.out.println(signatureName + "가 시작되었습니다");
		long startTime = System.currentTimeMillis(); // 시작 시점의 밀리세컨
		try {
			Object object = joinPoint.proceed(); // 핵심 기능 실행
			return object;
		} finally {
			
		}
	}
	
	
	// before advice : 핵심기능 수행 전 공통기능수행
	public void beforeAdvice() {
		System.out.println("핵심기능 수행하기 전 beforeAdvice() 자동 수행");
	}
	// after advice : 핵심기능 수행 후 공통기능 수행
	public void afterAdvice() {
		System.out.println("핵심기능 수행 후 afterAdvice() 자동 수행");
	}
	// afterReturning advice : 핵심기능을 에러없이 수행후 공통기능 수행
	public void afterReturningAdvice() {
		System.out.println("핵심기능 에러없이 수행 후 afterReturningAdvice() 자동 수행");
	}
	// afterThrowing advice : 핵심기능에 예외 발생 후 공통기능 수행
	public void afterThrowingAdvice() {
		System.out.println("핵심기능 예외 발생 후 afterReturningAdvice() 자동 수행");
	}
}
