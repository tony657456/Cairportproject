# - 주요 기능들

### 인터셉터(필터 + 리플렉션을 통한 AOP)
```java
package com.cos.webproject.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// 이 부분이 리플렉션이라고 생각을 하는데 
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
@Override
public void addInterceptors(InterceptorRegistry registry) {
	registry.addInterceptor(new sessionintercepter()).addPathPatterns("/user/**");
}
}


// 내가 이해한게 맞는지는 모르겠지만 틀렸다면 차차 수정할 것이다. 지금 아래에 있는 부분은 인터셉터를 사용했는데
   preHandle을 사용했기 때문에 사용자의 요청을 보고 컨트롤러가 실행되기 전에 세션의 값을 확인하고 세션이 존재하지
   않는다면 로그인 페이지로 이동하게 만들었다. 공통 관심사(cross-cutting concerns)를 처리하기 위한 AOP 방식으로 처리를
   했다. 내가 이해한게 맞을까..??
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
            // 최초 요청이 들어온 uri로 있는게 아니라 redirect를 해주었다.(포워드가 아닌 리다이렉트)
            response.sendRedirect("/auth/loginForm");
            return false;
        }

        return true; 
}
}
```
