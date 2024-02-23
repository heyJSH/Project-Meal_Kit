package org.zerock.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Sample2Controller {
    @RequestMapping(value = "/nhis/index.do")
    public void basic() {
        System.out.println("nhis/index.do실행");
    }

    @RequestMapping(value = "/hrdp/ma/pmmao/newIndexRenewal.do")
    public void basic2() {
        System.out.println("/hrdp/ma/pmmao/newIndexRenewal.do실행");
    }
}
