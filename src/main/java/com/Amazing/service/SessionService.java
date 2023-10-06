package com.Amazing.service;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class SessionService {
	@Autowired
	HttpSession session;

	public <T> T get(String name) {
		return (T) session.getAttribute(name);
	}

	public void set(String name, Object value) {
		session.setAttribute(name, value);
	}

	public void remove(String name) {
		session.removeAttribute(name);
	}

	public void setTimeOut(int seconds) {
		session.setMaxInactiveInterval(seconds);
	}
  
	public Collection<Object> getAll(String nameService) {
		java.util.Map<Integer, Object> map = new HashMap<>();
		Enumeration keys = session.getAttributeNames();
		while (keys.hasMoreElements()) {
			String key = (String) keys.nextElement();
			if (!key.equals(nameService)) {
				map.put(Integer.valueOf(key), get(key));
			}
		}
		return map.values();
	}
}
