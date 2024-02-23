package com.humanedu.starbucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/notice")
	public String notice() {
		return "notice";
	}
	
	@GetMapping("/notice_detail")
	public String notice_detail() {
		return "notice_detail";
	}
}
