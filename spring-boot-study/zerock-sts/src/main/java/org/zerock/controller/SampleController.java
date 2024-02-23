package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTOList;

import java.util.ArrayList;
import java.util.Arrays;

@Controller
@RequestMapping("/sample/*")
public class SampleController {
    @RequestMapping(value = "")
    public void basic() {
        System.out.println("basic......");
    }

    @RequestMapping(value = "/basic", method = {RequestMethod.GET, RequestMethod.POST})
    public void basicGet() {
        System.out.println("basic get......");
    }

    //@RequestMapping(value = "/basicOnlyGet", method = {RequestMethod.GET})
    @GetMapping("/basicOnlyGet")
    public void basicGet2() {
        System.out.println("basic get only get......");
    }

    //@RequestMapping(value = "/basicOnlyPost", method = {RequestMethod.POST})
    @PostMapping("/basicOnlyPost")
    public void basicPost() {
        System.out.println("basic post only......");
    }

    @GetMapping("/ex01")
    public String ex01(SampleDTO dto) {
        System.out.println("sampleDto: " + dto);

        return "ex01";
    }

    @GetMapping("/ex02")
    public String ex02(@RequestParam("name") String namesadfa
            , @RequestParam("age") int agesadfadsf) {
        System.out.println("name: " + namesadfa);
        System.out.println("age: " + agesadfadsf);

        return "ex02";
    }

    @GetMapping("/ex02List")
    public String ex02List(@RequestParam("ids") ArrayList<String> ids) {
        System.out.println("ids: " + ids);

        return "ex02List";
    }

    @GetMapping("/ex02Array")
    public String ex02Array(@RequestParam("ids") String[] ids) {
        System.out.println("array ids: " + Arrays.toString(ids));

        return "ex02Array";
    }

    @GetMapping("/ex02Bean")
    public String ex02Bean(SampleDTOList list) {
        System.out.println("ex02Bean: " + list);

        return "ex02Bean";
    }
}
