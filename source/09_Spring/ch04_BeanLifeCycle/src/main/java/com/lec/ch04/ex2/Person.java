package com.lec.ch04.ex2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.EnvironmentAware;
import org.springframework.core.env.Environment;

import lombok.AllArgsConstructor;
import lombok.Data;
@Data
@AllArgsConstructor
public class Person implements EnvironmentAware, InitializingBean, DisposableBean{
	private String name;
	private String tel;
	@Override
	public void setEnvironment(Environment environment) {
		System.out.println("Person형 빈 객체 생성하자마자 실행1 : setEnvironment(env)");
	}
	@Override
	public void afterPropertiesSet() throws Exception {
		System.out.println("Person형 빈 객체 생성하자마자 실행2 : afterPropertiesSet()");
	}
	@Override
	public void destroy() throws Exception {
		System.out.println("Person형 빈 객체 소멸되기 전 실행 : destroy()");
	}
}















