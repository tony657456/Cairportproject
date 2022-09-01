# - 주요 기능들

### 인터셉터(필터 + 리플렉션을 통한 AOP)
```java
package com.cos.webproject.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// 리플렉션의 개념을 찾아보고 예시도 봤지만 어느 부분에서 리플렉션 기법이 쓰였는지 잘 모르겠다.
   아마 InterceptorRegistry를 이용해서 sessionintercepter 객체를 사용하는 부분에서 리플렉션 기법이
   사용된 거 같다. 이 코드는 내가 설정한 /user로 시작하는 경로를 인터셉터가 가로챈 다음  sessionintercepter
   클래스를 실행시켜 조건문을 검사한 다음 if문에 부합하지 않을테니까 true를 return해서 controller에 접근 가능하게 한다.
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

## 공공데이터 API 활용
```java
package com.cos.webproject.utils;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.cos.webproject.web.dto.TicketReqDto;

import java.io.BufferedReader;
import java.io.IOException;

// 공공데이터에 요청하는 값이랑 내가 받아 온 Dto의 변수 값이 똑같아야지 대한한공에 공공데이터를 요청할 수 있다.
public class KimHaeJejuDataDownload {
        public static String goAirport(TicketReqDto ticketReqDto) throws IOException {
                StringBuilder urlBuilder = new StringBuilder(
                                "http://openapi.tago.go.kr/openapi/service/DmstcFlightNvgInfoService/getFlightOpratInfoList"); /*
                                                                                                                                * URL
                                                                                                                                */
                urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
                                + "=D20Z4JL1vaaXAYzfviSYg%2BPjV39hXfLAxPrIeJ3PsBoTvH00Y5gwSe%2FKyUrCwzb5vCs%2Bq%2Bee7BTB9CtpPeO43Q%3D%3D"); /*
                                                                                                                                             * Service
                                                                                                                                             * Key
                                                                                                                                             */
                urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
                                + URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
                urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "="
                                + URLEncoder.encode("1", "UTF-8")); /* 페이지 번호 */
                urlBuilder.append("&" + URLEncoder.encode("depAirportId", "UTF-8") + "="
                                + URLEncoder.encode(ticketReqDto.getDepairportnm(), "UTF-8")); /* 출발공항ID */
                urlBuilder.append("&" + URLEncoder.encode("arrAirportId", "UTF-8") + "="
                                + URLEncoder.encode(ticketReqDto.getArrairportnm(), "UTF-8")); /* 도착공항ID */
                urlBuilder.append("&" + URLEncoder.encode("depPlandTime", "UTF-8") + "="
                                + URLEncoder.encode(ticketReqDto.getDepplandtime(), "UTF-8")); /* 출발일 */
                urlBuilder.append("&" + URLEncoder.encode("airlineId", "UTF-8") + "="
                                + URLEncoder.encode("KAL", "UTF-8")); /* 항공사ID */
                urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
                URL url = new URL(urlBuilder.toString());
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Content-type", "application/json");
                System.out.println("Response code: " + conn.getResponseCode());
                BufferedReader rd;
                if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                        rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                } else {
                        rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
                }
                StringBuilder sb = new StringBuilder();
                String line;
                while ((line = rd.readLine()) != null) {
                        sb.append(line);
                }
                rd.close();
                conn.disconnect();
                System.out.println(sb.toString());
                return sb.toString();
        }
        
        public static String backAirport(TicketReqDto ticketReqDto) throws IOException {
            StringBuilder urlBuilder = new StringBuilder(
                            "http://openapi.tago.go.kr/openapi/service/DmstcFlightNvgInfoService/getFlightOpratInfoList"); /*
                                                                                                                            * URL
                                                                                                                            */
            urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
                            + "=D20Z4JL1vaaXAYzfviSYg%2BPjV39hXfLAxPrIeJ3PsBoTvH00Y5gwSe%2FKyUrCwzb5vCs%2Bq%2Bee7BTB9CtpPeO43Q%3D%3D"); /*
                                                                                                                                         * Service
                                                                                                                                         * Key
                                                                                                                                         */
            urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
                            + URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
            urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "="
                            + URLEncoder.encode("1", "UTF-8")); /* 페이지 번호 */
            urlBuilder.append("&" + URLEncoder.encode("depAirportId", "UTF-8") + "="
                            + URLEncoder.encode(ticketReqDto.getArrairportnm(), "UTF-8")); /* 출발공항ID */
            urlBuilder.append("&" + URLEncoder.encode("arrAirportId", "UTF-8") + "="
                            + URLEncoder.encode(ticketReqDto.getDepairportnm(), "UTF-8")); /* 도착공항ID */
            urlBuilder.append("&" + URLEncoder.encode("depPlandTime", "UTF-8") + "="
                            + URLEncoder.encode(ticketReqDto.getArrplandtime(), "UTF-8")); /* 출발일 */
            urlBuilder.append("&" + URLEncoder.encode("airlineId", "UTF-8") + "="
                            + URLEncoder.encode("KAL", "UTF-8")); /* 항공사ID */
            urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json");
            System.out.println("Response code: " + conn.getResponseCode());
            BufferedReader rd;
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                    rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                    sb.append(line);
            }
            rd.close();
            conn.disconnect();
            System.out.println(sb.toString());
            return sb.toString();
    }
}
```
