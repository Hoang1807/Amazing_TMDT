package com.Amazing.config;

import com.Amazing.interceptor.AuthenticationInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    private final AuthenticationInterceptor authenticationInterceptor;

    @Autowired
    public WebMvcConfig(AuthenticationInterceptor authenticationInterceptor) {
        this.authenticationInterceptor = authenticationInterceptor;
    }

//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        // Đăng ký interceptor và chỉ định các URL mà nó sẽ kiểm tra
//        registry.addInterceptor(authenticationInterceptor)
//                .addPathPatterns("/admin/home"); // Kiểm tra cho các URL bắt đầu bằng "/admin/"
//    }
}
