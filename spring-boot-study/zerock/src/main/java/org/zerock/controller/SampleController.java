package org.zerock.controller;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/sample/*")
public class SampleController {

//    @InitBinder
//    public void initBinder(WebDataBinder binder) {
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
//    }

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

    @GetMapping("/ex03")
    public String ex03(TodoDTO todo) {
        System.out.println("todo: " + todo);

        return "ex03";
    }

    @GetMapping("/test.do")
    public String test1(TodoDTO todo) {
        return "test/test1";
    }

    @GetMapping("/ex04")
    public String ex04(SampleDTO dto
            , @ModelAttribute("page0") int page1
            , @ModelAttribute("bbb") String test1
            , RedirectAttributes rttr
    ) {
        System.out.println("dto: " + dto);
        System.out.println("page1: " + page1);
        System.out.println("test1-bbb: " + test1);

        return "/sample/ex04";
    }

    @GetMapping("/ex04-1")
    public String ex04_1(RedirectAttributes rttr) {
        return "ex04-1";
    }

    @GetMapping("/ex04-2")
    public String ex04_2(RedirectAttributes rttr) {
        return "redirect:/sample/ex04-1";
    }

    @GetMapping("/ex05")
    public void ex05() {
        System.out.println("/ex05............");
    }

    @GetMapping("/ex06")
    @ResponseBody
    public List<SampleDTO> ex06() {
        System.out.println("/ex06............");

        List<SampleDTO> sampleDTOList = new ArrayList<>();

        SampleDTO dto = new SampleDTO();
        dto.setAge(10);
        dto.setName("홍길동");
        SampleDTO dto2 = new SampleDTO();
        dto2.setAge(15);
        dto2.setName("유관순");

        sampleDTOList.add(dto);
        sampleDTOList.add(dto2);

        return sampleDTOList;
    }

    @GetMapping("/ex06-2")
    @ResponseBody
    public Test2DTO ex06_2() {
        Test2DTO test2DTO = new Test2DTO();
        test2DTO.setName("Jack");
        test2DTO.setAge(30);

        Test2ContactNumbers t2cn1 = new Test2ContactNumbers();
        t2cn1.setType("Home");
        t2cn1.setNumber("123 123-123");
        Test2ContactNumbers t2cn2 = new Test2ContactNumbers();
        t2cn2.setType("Office");
        t2cn2.setNumber("321 321-321");

        List<Test2ContactNumbers> test2ContactNumbersList = new ArrayList<>();
        test2ContactNumbersList.add(t2cn1);
        test2ContactNumbersList.add(t2cn2);

        List<String> listFS = Arrays.asList("Football", "Cricket");

        test2DTO.setContactNumbersList(test2ContactNumbersList);
        test2DTO.setFavoriteSports(listFS);

        return test2DTO;
    }

    @GetMapping("/ex07")
    public ResponseEntity<String> ex07() {
        System.out.println("/ex07..............");

        //String msg = "{\"name\": \"홍길동\"}";
        String msg = """
                {"name": "홍길동"}
        """;

        HttpHeaders header = new HttpHeaders();
        header.add("Content-Type", "application/json;charset=UTF-8");

        return new ResponseEntity<>(msg, header, HttpStatus.OK);
    }

    @GetMapping("/exUpload")
    public void exUpload() {
        System.out.println("/exUpload.........");
    }

    @PostMapping
    public void exUploadPost(ArrayList<MultipartFile> files) {
        files.forEach(file -> {
            System.out.println("-------------------");
            System.out.println("name: " + file.getOriginalFilename());
            System.out.println("size: " + file.getSize());  // byte
        });
    }
}
