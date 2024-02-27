package com.humanedu.starbucks.mapper;

import com.humanedu.starbucks.domain.FreeBoardVO;

import java.util.List;

public interface BoardMapper {
    List<FreeBoardVO> getFreeBoardList(String search);
    int putFreeBoard(FreeBoardVO freeBoardVO);  // return값은 삽입한 행수
    int delFreeBoard(int num);      // return값은 삭제한 행수
    FreeBoardVO getFreeBoardOne(int num);
    int updateFreeBoard(FreeBoardVO freeBoardVO);
}
