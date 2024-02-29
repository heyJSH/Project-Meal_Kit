package com.humanedu.starbucks.controller;


import com.humanedu.starbucks.domain.SampleVO;
import com.humanedu.starbucks.domain.Ticket;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@RestController     // 기본이 json
@RequestMapping("/sample")
@Log4j
public class SampleController {
    // text
    @GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8")
    public String getText() {
        log.info("MIME TYPE: " + MediaType.TEXT_PLAIN_VALUE);

        return "안녕하세요";
    }

    // xml
    @GetMapping(value = "/getSample"
            , produces = { MediaType.APPLICATION_XML_VALUE })
    public SampleVO getSample() {
        return new SampleVO(112, "스타", "로드");
    }

    // json(일반 구조)
    @GetMapping(value = "/getSample2", produces = { MediaType.APPLICATION_JSON_VALUE } )
    public SampleVO getSample2() {
        return new SampleVO(113, "로켓", "라쿤");
    }

    // json(일반(list 구조))
    @GetMapping(value = "/getList", produces = { MediaType.APPLICATION_JSON_VALUE })
    public List<SampleVO> getList() {
        // 10개의 samplevo객체를 생성하여 리스트 구조에 담아 리스트를 리턴
        return IntStream.range(1, 10)
                .mapToObj(i ->
                        new SampleVO(i,
                                i + " First",
                                i + " Last"))
                .collect(Collectors.toList());
    }

    // json(일반(map 구조))
    @GetMapping(value = "/getMap", produces = { MediaType.APPLICATION_JSON_VALUE })
    public Map<String, SampleVO> getMap() {
        Map<String, SampleVO> map = new HashMap<>();
        map.put("First", new SampleVO(111, "그루트", "주니어"));

        return map;
    }

    @GetMapping(value = "/check", params = {"height", "weight"},produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<SampleVO> check(Double height, Double weight){
        SampleVO vo = new SampleVO(0, "" + height, "" + weight);
        ResponseEntity<SampleVO> result = null;

        if(height<150){
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo);
        } else{
            result = ResponseEntity.status(HttpStatus.OK).body(vo);
        }
        return result;
    }

    @GetMapping(value = "/product/{cat}/{pid}",
                produces = { MediaType.APPLICATION_XML_VALUE }
//                produces = { MediaType.APPLICATION_JSON_VALUE }
                 )
    public String[] getPath(@PathVariable("cat") String cat, @PathVariable("pid") Integer pid){
        return new String[] {"category:" + cat, "productid:" +pid };
    }

    @PostMapping(value = "/ticket", produces = {MediaType.APPLICATION_JSON_VALUE})
    public Ticket convert(@RequestBody Ticket ticket){
        log.info("convert.........ticket ->" + ticket);

        return ticket;
    }
}
