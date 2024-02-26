package com.humanedu.starbucks.mapper;

import com.humanedu.starbucks.domain.FreeBoardVO;

import java.util.List;

public interface BoardMapper {
    List<FreeBoardVO> getFreeBoardList(String search);
    int putFreeBoard(FreeBoardVO freeBoardVO);
}
