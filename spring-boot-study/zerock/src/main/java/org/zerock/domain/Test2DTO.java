package org.zerock.domain;

import lombok.Data;

import java.util.List;

@Data
public class Test2DTO {
    private String name;
    private int age;

    private List<Test2ContactNumbers> contactNumbersList;
    private String spouse;
    private List<String> favoriteSports;
}
