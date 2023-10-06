package com.Amazing.interceptor;

import com.Amazing.entity.Store;
import com.Amazing.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AuthenticationInterceptor implements HandlerInterceptor {

	private final SessionService sessionService;

	@Autowired
	public AuthenticationInterceptor(SessionService sessionService) {
		this.sessionService = sessionService;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// Kiểm tra xem người dùng đã đăng nhập chưa
		Store store = sessionService.get("store_account");
		if (store == null) {
			// Người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
			response.sendRedirect(request.getContextPath() + "/admin/login");
			return false; // Ngăn cản việc xử lý tiếp theo
		}
		// Người dùng đã đăng nhập, cho phép xử lý tiếp theo
		return true;
	}
}
