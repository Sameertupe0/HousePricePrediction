package org.techhub.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@ComponentScan(basePackages= {"org.techhub"})
public class DBConfig {

	@Bean
	public DriverManagerDataSource getDataSource() {
		DriverManagerDataSource dataSource =new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dataSource.setPassword("root");
		dataSource.setUsername("root");
		dataSource.setUrl("jdbc:mysql://localhost:3306/house_price_prediction");
		return dataSource;
	}
	
	@Bean(name="jdbcTemplate")
	public JdbcTemplate getTeplate() {
		return new JdbcTemplate(this.getDataSource());
	}
}