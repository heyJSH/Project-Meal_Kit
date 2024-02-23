package org.zerock;

import org.junit.Test;

public class Java17Tests {
    @Test
    public void textBlockTest() {
        String query1 = "SELECT adsfasd, asdfasdf "
                + " FROM fdsaf "
                + " WHERE 1=1";
        System.out.println(query1);

        // jdk17의 text-block기능 사용
        String query2 = """
            SELECT adsfasd, asdfasdf
                     FROM fdsaf 
                     WHERE 1=1
        """;
        System.out.println(query2);
    }

    @Test
    public void switchTest() {
        String hobby = "영화a";
        switch (hobby) {
            case "영화" -> System.out.println("영화");
            case "게임" -> System.out.println("게임");
            default -> System.out.println("case에 없다");
        }

        System.out.println(
            switch (hobby) {
                case "게임" -> "좋아하는 취미";
                case "오잉" -> "이건 취미가 아닌데";
                default -> "취미가 없네 ?";
            }
        );
    }
}
