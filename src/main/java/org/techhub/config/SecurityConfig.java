package org.techhub.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

@Bean
public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

http
.csrf(csrf -> csrf.disable())

.authorizeHttpRequests(auth -> auth

.requestMatchers(new AntPathRequestMatcher("/resources/**")).permitAll()
.requestMatchers(new AntPathRequestMatcher("/login")).permitAll()
.requestMatchers(new AntPathRequestMatcher("/register")).permitAll()

.requestMatchers(new AntPathRequestMatcher("/admin/**")).hasRole("ADMIN")
.requestMatchers(new AntPathRequestMatcher("/user/**")).hasRole("USER")

.anyRequest().authenticated()

)

.formLogin(form -> form
.loginPage("/login")
.defaultSuccessUrl("/dashboard", true)
.permitAll()
)

.logout(logout -> logout
.logoutSuccessUrl("/login?logout")
.permitAll()
);

return http.build();

}

}