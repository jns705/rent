package com.rent;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

/*
 * 	@SpringBootApplication
	= @Configuration + @EnableAutoConfiguration + @ComponentScan
	 
	@Configuration : 현재 클래스가 스프링의 설정 파일임을 Srping Context에게 알려주는
	                 애노테이션.
	@EnableAutoConfiguration : 스프링 부트 클래스, 패스, 세팅 및 다양한 Bean 추가등을
	                 시켜주는 애노테이션.
	@ComponentScan : 다른 컴포넌트, 서비스, 설정 등을 찾을 수 있게 도와주는 애노테이션.
	
	@MapperScan : Mapper 인터페이스를 인식할 수 있도록 설정한다.
 */
@SpringBootApplication
@MapperScan(value= {"com.rent.mapper"})
public class CartrentprojectApplication {

	public static void main(String[] args) {
		SpringApplication.run(CartrentprojectApplication.class, args);
	}

	/*
	 *  SqlSessionFactory 설정을 한다.
	 *  
	 *  @Bean 스프링에 필요한 객체를 생성한다.
	 *  
	 *  sqlSessionFactory(DataSource dataSource)
	 *  MyBatis의 SqlSessionFacory를 반환해준다.
	 *  스프링부트가 실행할 때 DataSource객체를 이 메서드가 실행될 때 주입해서 결과를 만든다.
	 *  그 결과 스프링의 Bean으로 사용하게 된다.
	 *  
	 */
	@Bean //스프링에 필요한 객체를 생성한다.
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		
		sessionFactory.setDataSource(dataSource);
		return sessionFactory.getObject();
	}
}
