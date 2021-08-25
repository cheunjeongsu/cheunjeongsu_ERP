package org.spring.my.advice;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

//컨트롤러에서 발생하는 예외를 전문적으로 처리하는 클래스
@ControllerAdvice
public class CommonExceptionAdvice {
	
	@ExceptionHandler(NoHandlerFoundException.class)
	public String common404(HttpServletRequest request, Exception e, Model model) {
		System.out.println("예외발생");
		System.out.println(e.toString());
		e.printStackTrace();
		model.addAttribute("url", request.getRequestURL());
		return "error/errorNoFound";
	}
	
	@ExceptionHandler(Exception.class)
	public String common(Exception e) {
		System.out.println("예외발생");
		System.out.println(e.toString());
		e.printStackTrace();
		return "error/errorCommon";
	}
}
