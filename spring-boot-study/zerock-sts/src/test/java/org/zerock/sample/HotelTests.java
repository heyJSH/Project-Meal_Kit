package org.zerock.sample;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.config.RootConfig;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
//@Log4j
public class HotelTests {
    @Setter(onMethod_ = { @Autowired})
    private SampleHotel hotel;

    @Test
    public void testExists() {
        assertNotNull(hotel);

        System.out.println(hotel);
        System.out.println("--------------------------");
        System.out.println(hotel.getChef());
    }
}
