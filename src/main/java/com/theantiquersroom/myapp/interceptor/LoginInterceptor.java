package com.theantiquersroom.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.theantiquersroom.myapp.controller.LoginController;
import com.theantiquersroom.myapp.domain.UserDTO;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Component
public class LoginInterceptor
	implements HandlerInterceptor {
	
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler)
		throws Exception {		
		
		HttpSession session=req.getSession();
		session.removeAttribute(LoginController.authKey);
		
		return true;
	} // preHandle

	
	@Override
	public void postHandle(
			HttpServletRequest req, 
			HttpServletResponse res, 
			Object handler,
			ModelAndView modelAndView) throws Exception {
		log.debug("2. postHandle({}, {}, {}, {}) invoked.", req, res, handler, modelAndView);
		
		HttpSession session=req.getSession();	
		
		ModelMap modelMap=modelAndView.getModelMap();
		UserDTO user= (UserDTO) modelMap.get(LoginController.authKey);
		log.info("\t+ user: {}", user);
		
		if(user != null) {  // 로그인 성공
			session.setAttribute(LoginController.authKey, user);
			log.info("\t+ sessionAuthKey: {}", LoginController.authKey);
			
			String originRequestURI=
					(String) session.getAttribute(AuthInterceptor.requestURIKey);
			
			String originQueryString=
					(String) session.getAttribute(AuthInterceptor.queryStringKey);
			
			if(originRequestURI!=null) { // 원래의 요청URI가 있는 경우
				
				String originRequest=originRequestURI;
				
				if(originQueryString!=null) {  // 전송파라미터도 있는 경우
					originRequest+='?'+originQueryString;
				} else {  // 전송파라미터가 없는 경우
					;;
				} // if-else
				
				log.info("\t+ originRequest: {}", originRequest);
				
				res.sendRedirect(originRequest);
			} else { // 원래의 요청URI가 없는 경우
				res.sendRedirect("/"); // 메인화면으로 이동
			} // if-else
			
		} else {  // 로그인 실패
			
			res.sendRedirect("/login");
		} // if-else
	} // postHandle


	@Override
	public void afterCompletion(
			HttpServletRequest req, HttpServletResponse res, Object handler, Exception e)
			throws Exception {
		
	} // afterCompletion

} // end class
