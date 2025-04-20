package tn.essat.config;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import tn.essat.service.IUserService;


@Configuration
@EnableWebSecurity
public class SecurityConfig  extends WebSecurityConfigurerAdapter {
	
	@Autowired
	IUserService userserv ;
	
	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		PasswordEncoder crypt=cryptage();
		
		auth.userDetailsService(userserv).passwordEncoder(crypt);
		
		
		
	}
	
	@Bean
	public PasswordEncoder cryptage() {
		
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.formLogin().loginPage("/login")
		.defaultSuccessUrl("/")
		.failureUrl("/login?error=true").permitAll();
		
		http.logout().logoutUrl("/logout").logoutSuccessUrl("/login?logout=true").invalidateHttpSession(true).deleteCookies("JSESSIONID").permitAll();
		http.authorizeRequests().antMatchers("/signup", "/signup/**", "/src/**", "/css/**", "/js/**", "/images/**").permitAll();

		http.authorizeRequests().anyRequest().authenticated();
		http.csrf().disable();
	}
	
	
	
	

}
