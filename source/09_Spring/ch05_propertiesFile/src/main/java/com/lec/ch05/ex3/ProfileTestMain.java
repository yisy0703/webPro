package com.lec.ch05.ex3;

import java.util.Scanner;

import org.springframework.context.support.GenericXmlApplicationContext;

public class ProfileTestMain {
	public static void main(String[] args) {
		String config = null;
		Scanner sc = new Scanner(System.in);
		System.out.print("DEV? RUN(인수테스트)?");
		String answer = sc.next(); // dev/run/xxx
		if(answer.equalsIgnoreCase("DEV")) {
			config = "dev";
		}else if(answer.equalsIgnoreCase("RUN")) {
			config = "run";
		}else {
			System.out.println("제대로 된 환경이 입력되지 않았습니다. 확인요망");
			System.exit(0); // 정상상태에서 강제종료
		}
		sc.close();
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext();
		ctx.getEnvironment().setActiveProfiles(config);
		String loc1 = "classpath:META-INF/ex3/CTX_dev.xml";
		String loc2 = "classpath:META-INF/ex3/CTX_run.xml";
		ctx.load(loc1, loc2);
		ctx.refresh();
		ServerInfo info = ctx.getBean("serverInfo", ServerInfo.class);
		System.out.println("IP : " + info.getIpNum());
		System.out.println("PORT : " + info.getPortNum());
	}
}














