package com.humanedu.starbucks.domain;

import lombok.Data;

@Data
public class Ticket {                   // post 매핑 시 request 파라미터로 받을 domain model
    private int tno;
    private String owner;
    private String grade;

}
