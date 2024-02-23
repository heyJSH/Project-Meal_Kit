package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;

/**
 * 검색을 위한 클래스 VO
 */
@Getter
@Setter
public class Criteria {
    private String type;
    private String keyword;

    // T, C, W, TC, TW, TWC
    // ["T"]
    // ["C"]
    // ["W"]
    // ["T","C"]
    // ["T","W"]
    // ["T","W","C"]
    public String[] getTypeArr() {
        return type == null ? new String[] {} : type.split("");
    }
}
