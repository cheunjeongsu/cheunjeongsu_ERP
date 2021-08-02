package org.spring.my;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
	
	//메인으로 이동
		@RequestMapping("/")
		public String home() {
			return "home";
		}
		@RequestMapping("login")
		public String login() {
			return "login";
		}
		
		@RequestMapping("tables")
		public String tables() {
			return "tables";
		}
		
		@RequestMapping("charts")
		public String charts() {
			return "charts";
		}
}
