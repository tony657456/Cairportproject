package com.cos.webproject.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class sessionintercepter implements HandlerInterceptor {
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("principal") == null) {
            // 최초 요청이 들어온 uri로 있는게 아니라 redirect를 해주었다.
            response.sendRedirect("/auth/loginForm");
            return false;
        }

        return true; 
}
}
