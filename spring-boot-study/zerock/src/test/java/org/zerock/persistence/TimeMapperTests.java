package org.zerock.persistence;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.config.RootConfig;
import org.zerock.mapper.TimeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
@Log4j
public class TimeMapperTests {
    @Setter(onMethod_ = { @Autowired })
    private TimeMapper timeMapper;

    @Test
    public void testGetTime() {
        System.out.println(timeMapper.getClass().getName());
        System.out.println("getTime(): " + timeMapper.getTime());
    }

    @Test
    public void testGetTime2() {
        System.out.println("getTime2");
        System.out.println("getTime2(): " + timeMapper.getTime2());
        System.out.println("getTestCode(): " + timeMapper.getTestCode());
    }

    @Test
    public void testGetBoFreeName() {
        // mybatis로 bo_free테이블의 num컬럼의 값이 가장 큰 name값을 출력하는 코드 작성
        // System.out.println으로 출력
        System.out.println("bo_free num: " + timeMapper.getBoFreeNum());
    }
}
