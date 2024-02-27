package com.humanedu.starbucks.controller;

import com.humanedu.starbucks.domain.FreeBoardVO;
import com.humanedu.starbucks.service.FreeBoardService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j
public class AdminNoticeController {
	@Autowired
	private FreeBoardService freeBoardService;

	@GetMapping("/adminNoticeList")
	public String adminNoticeList(
			@RequestParam(value = "search", required = false) String search, Model model) {
		List<FreeBoardVO> freeBoardVOList = freeBoardService.getFreeBoardList(search);

		model.addAttribute("freeBoardVOList", freeBoardVOList);
		model.addAttribute("search", search);
		return "adminNoticeList";
	}

	@GetMapping("/adminNoticeInsertForm")
	public String adminNoticeInsertForm() {
		return "adminNoticeInsertForm";
	}
	
	@PostMapping("/adminNoticeInsert")
	public String adminNoticeInsert(
			MultipartFile[] fileContent,
			@RequestParam("korname") String korname,
			@RequestParam("title") String subject,
			@RequestParam("content") String content,
			RedirectAttributes rttr
	) {
		// 파일 업로드 추가 처리
		String uploadFolder = "D:\\github-wououoo\\intel\\intelij\\starbucks-springboot\\src\\main\\resources\\static\\upload-files";

		List<String> fileNameArray = new ArrayList<>();
		for (MultipartFile multipartFile : fileContent) {
			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());

			fileNameArray.add(multipartFile.getOriginalFilename());

			// 실제 위의 uploadFolder위치에 파일 저장
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch
		} // end for

		// 실제 DB에 텍스트 데이터 저장
		int rtn = freeBoardService.insertFreeBoard(korname, subject, content, fileNameArray);
		rttr.addFlashAttribute("insertSuccessCount", rtn);

		return "redirect:/adminNoticeList";
	}
	
	@GetMapping("/adminNoticeUpdateForm")
	public String adminNoticeUpdateForm(@RequestParam("num") int num, Model model) {
		FreeBoardVO freeBoardVO = freeBoardService.selectFreeBoardOne(num);
		model.addAttribute("freeBoard", freeBoardVO);

		return "adminNoticeUpdateForm";
	}
	
	@PostMapping("/adminNoticeUpdate")
	public String adminNoticeUpdate(
		MultipartFile[] fileContent,
		@RequestParam("num") int num,
		@RequestParam("korname") String korname,
		@RequestParam("title") String subject,
		@RequestParam("content") String content,
		RedirectAttributes rttr
	) {
		// 파일 업로드 수정 처리
		int rtn = freeBoardService.updateFreeBoard(
				num,
				korname,
				subject,
				content,
				fileContent[0].getOriginalFilename(),
				fileContent[1].getOriginalFilename()
		);
		rttr.addFlashAttribute("updateSuccessCount", rtn);

		return "redirect:/adminNoticeList";
	}
	
	@RequestMapping(value = "/adminNoticeDelete", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminNoticeDelete(@RequestParam("num") int num, RedirectAttributes rttr) {
		int rtn = freeBoardService.deleteFreeBoard(num);
		rttr.addFlashAttribute("deleteSuccessCount", rtn);

		return "redirect:/adminNoticeList";
	}
}
