package org.zerock.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;

import lombok.RequiredArgsConstructor;
import org.zerock.domain.Criteria;
import org.zerock.service.BoardService;

import java.util.List;

@Controller
@Log4j
@RequestMapping("/board")
@AllArgsConstructor
public class BoardController {
	private BoardService service;

	/**
	 * 게시물 목록 조회
	 * @param model
	 * @return
	 */
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list");

		List<BoardVO> boardVOList = service.getList(cri);
		model.addAttribute("boardList", boardVOList);
		model.addAttribute("criteria", cri);
	}

	@GetMapping("/register")
	public void register() {

	}

	/**
	 * 게시물 등록
	 * @param board
	 * @param rttr
	 * @return
	 */
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register: " + board);

		service.register(board);	// 실제 게시판 글 입력
		rttr.addFlashAttribute("result", board.getBno());

		return "redirect:/board/list";
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		log.info("modify:" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}

	@GetMapping({"/get", "/modify"})
	public void get(
			@RequestParam("bno") Long bno
			, Model model
	) {
		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove..." + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}

}

