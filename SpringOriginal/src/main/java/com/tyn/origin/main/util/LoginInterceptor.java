package com.tyn.origin.main.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	 
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
 
        System.out.println("Interceptor : prehandle");
        
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("admin");
        
        if(null == userId) {
            System.out.println("Interceptor : admin check fail");
            
            response.sendRedirect("main.jsp");
            return false;
        }
        
        else {
            return super.preHandle(request, response, handler);
        }
    }
}

