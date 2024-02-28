package com.humanedu.starbucks.controller;

import com.humanedu.starbucks.service.FreeBoardServiceImpl;
import lombok.Getter;
import org.springframework.ui.Model;
import com.humanedu.starbucks.domain.FreeBoardVO;
import com.humanedu.starbucks.service.FreeBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j
public class AdminController {
    @Autowired
    private FreeBoardService freeBoardService;

    @GetMapping("/adminNoticeList")
    public String adminNoticeList(@RequestParam(value = "search", required = false) String search, Model model) {

        List<FreeBoardVO> freeBoardVOList = freeBoardService.AdminNoticeListSelect(search);

        model.addAttribute("freeBoardVOList", freeBoardVOList);
        model.addAttribute("search", search);
        return "adminNoticeList";
    }

    @GetMapping("/adminNoticeInsertForm")
    public String adminNoticeInsertForm() {
        return "adminNoticeInsertForm";
    }

    @PostMapping("/adminNoticeInsert")
    public String adminNoticeInsertForm(
            MultipartFile[] fileContent,
            @RequestParam("korname") String name,
            @RequestParam("content") String content,
            @RequestParam("title") String subject,
            RedirectAttributes rttr
    ) {
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
        int rtn = freeBoardService.AdminNoticeInsert1(name, subject, content,fileNameArray);
        rttr.addFlashAttribute("insertSuccessCount", rtn);

        return "redirect:/adminNoticeList";
    }

    @GetMapping("/adminNoticeUpdateForm")
    public String adminNoticeUpdateForm(@RequestParam("num") int num, Model model){
        FreeBoardVO freeBoardVO = freeBoardService.AdminNoticeUpdateForm1(num); // 수정 화면 표시하는 기능
        model.addAttribute("freeBoard", freeBoardVO); // 화면에 출력하기 위한 통로

        freeBoardService.updatehit1(num); // 조회수 업데이트 기능 , 얘는 출력해야될 것이 없어서 MODEL 필요없음

        return "adminNoticeUpdateForm";
    }
    @PostMapping("/adminNoticeUpdate")
    public String adminNoticeUpdate(
            MultipartFile[] fileContent,
            @RequestParam("korname") String korname,
            @RequestParam("content") String content,
            @RequestParam("title") String subject,
            @RequestParam("num") int num,
            RedirectAttributes rttr
    ){
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
        int rtn = freeBoardService.AdminNoticeUpdate1(num, korname, subject, content, fileNameArray);
        rttr.addFlashAttribute("updateSuccessCount", rtn);

        return "redirect:/adminNoticeList";
    }
    @PostMapping("/adminNoticeDelete")
    public String adminNoticeDelete(@RequestParam("num") int num, RedirectAttributes rttr){
        int rtn = freeBoardService.AdminNoticeDelete1(num);

        rttr.addFlashAttribute("deleteSuccessCount", rtn);

        return "redirect:/adminNoticeList";
    }
}
