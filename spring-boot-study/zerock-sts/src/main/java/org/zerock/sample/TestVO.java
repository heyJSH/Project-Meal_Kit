package org.zerock.sample;

import lombok.Data;

// 많이 사용하는 lombok annotation
// @Data
// @Setter
// @Getter
// @RequiredArgsConstructor
// @AllArgsConstructor
// @ToString
// @EqualsAndHashCode
// @Builder
@Data
public class TestVO {
    private String name;
    private String birth;
}
