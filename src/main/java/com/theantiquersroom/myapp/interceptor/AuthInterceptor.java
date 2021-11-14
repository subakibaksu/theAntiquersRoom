package com.theantiquersroom.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.theantiquersroom.myapp.controller.LoginController;
import com.theantiquersroom.myapp.domain.UserDTO;
import com.theantiquersroom.myapp.service.UserService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Component
public class AuthInterceptor
	implements HandlerInterceptor {
	
	public static final String requestURIKey="__REQUEST_URI__";
	public static final String queryStringKey="__QUERYSTRING__";
	
	@Setter(onMethod_= {@Autowired})
	private UserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler)
		throws Exception {
		log.debug("1. preHandle({}, {}, {}) invoked.", req, res, handler);	
		
		HttpSession session=req.getSession();
		UserDTO user=(UserDTO) session.getAttribute(LoginController.authKey);
		log.info("\t+ user: {}", user);
		
		if(user == null) { // 아직 인증되지 않은 상태
			String originReqURI=req.getRequestURI();
			String originQueryString=req.getQueryString();
			
			session.setAttribute(AuthInterceptor.requestURIKey, originReqURI);
			session.setAttribute(AuthInterceptor.queryStringKey, originQueryString);
		
			res.sendRedirect("/login");
			
			return false;
		} // if
		
		return true;
	} // preHandle
} // end class
