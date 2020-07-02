package com.rent.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

//@Controller, @Service, @Repository
//@Component : 일반적으로 Bean을 통칭해서 @Component라고 한다.
@Component //스프링에서 관리하는 bean
//@Aspect    //공통적인 업무를 지원하는 bean
public class LogAdvice {
	
	//로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(LogAdvice.class);
	
	//포인트 컷 : 실행시점 -> Around 핵심업무 실행 전, 후
	//Controller, Service, DAO의 모든 method 실행 전후에 logPrint method가 호출된다.
	//execution(리턴 자료형 class.method(매개변수))
	//..*Controller.* => 모든 하위 패키지에 있는 클래스의 이름이 Controller.로 끝나는
	//					 모든 메서드들을 말한다.
	//@Before : 실행 전, @After : 실행 후, @Around : 실행 전후
	@Around(
			"execution(* com.rent.controller..*Controller.*(..))"
			+" or execution(* com.rent.service..*Service.*(..))"
			+" or execution(* com.rent.mapper..*Mapper.*(..))"
			)
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {
		
		//핵싱업무 바로 전에 시간을 구한다.
		long startTime = System.currentTimeMillis();
		
		
		// joinPoint.proceed() 윗 부분이 핵심업무 호출 전에 할 작업이다.
		Object result = joinPoint.proceed(); //핵심업무 실행
		// joinPoint.procced()아래 부분이 핵심업무 호출 후에 할 작업이다.
		
		//호출한 클래스 이름
		String type = joinPoint.getSignature().getDeclaringTypeName();
		
		String name = "";
		if(type.indexOf("Controller") > -1) {
			name = "Controller \t:";
		}else if(type.indexOf("Service") > -1) {
			name = "Service \t:";
		}else if(type.indexOf("DAO") > -1) {
			name = "Mapper \t:";
		}
		
		//호출한 클래스와 메서드 정보를 출력한다.
		logger.info(name + type + "." + joinPoint.getSignature().getName() + "()");
		
		//메서드에 전달되는 매개변수들을 출력한다.
		logger.info(Arrays.deepToString(joinPoint.getArgs()));
		
		//핵심업무가 끝난 후의 시간을 구한다.
		long endTime = System.currentTimeMillis();
		
		long runningTime = endTime - startTime;
		
		logger.info("실행시간 : " + runningTime);
		logger.info("---------------------------------------------");
		return result;
	}
	
} // End - public class LogAdvice
