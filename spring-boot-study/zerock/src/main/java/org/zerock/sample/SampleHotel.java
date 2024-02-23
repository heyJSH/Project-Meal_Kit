package org.zerock.sample;


import lombok.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@ToString
@Getter
@RequiredArgsConstructor    // final 변수이거나 NonNull지정된 변수
public class SampleHotel {
    @NonNull
    private Chef chef;                              // 멤버 변수(member variable
    //private final String test1;
    private String test2;
    @Autowired
    private Restaurant restaurant;
    private final Restaurant restaurant1;
}
