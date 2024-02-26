package com.humanedu.starbucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;

@Controller
public class FileController {

    @GetMapping("/fileDownload")
    public String fileDownload(Model model) {
        return "fileDownload";
    }

    @GetMapping("/fileDelete")
    public String fileDelete(Model model) {
        return "fileDelete";
    }
}
