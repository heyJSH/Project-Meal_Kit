package com.humanedu.starbucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminNoticeController {
	
	@GetMapping("/adminNoticeList")
	public String adminNoticeList() {
		return "adminNoticeList";
	}
	
	@GetMapping("/adminNoticeInsertForm")
	public String adminNoticeInsertForm() {
		return "adminNoticeInsertForm";
	}
	
	@PostMapping("/adminNoticeInsert")
	public String adminNoticeInsert() {
		return "adminNoticeInsert";
	}
	
	@GetMapping("/adminNoticeUpdateForm")
	public String adminNoticeUpdateForm() {
		return "adminNoticeUpdateForm";
	}
	
	@PostMapping("/adminNoticeUpdate")
	public String adminNoticeUpdate() {
		return "adminNoticeUpdate";
	}
	
	@GetMapping("/adminNoticeDelete")
	public String adminNoticeDelete() {
		return "adminNoticeDelete";
	}
}
