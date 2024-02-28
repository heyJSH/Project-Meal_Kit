package com.humanedu.starbucks.mapper;

import com.humanedu.starbucks.domain.FreeBoardVO;

import java.util.List;

public interface BoardMapper {
    List<FreeBoardVO> AdminNoticeListSelect(String search);
    int AdminNoticeInsert(FreeBoardVO freeBoardVO);

    FreeBoardVO AdminNoticeUpdateForm(int num);

    int AdminNoticeUpdate(FreeBoardVO freeBoardVO);

    int AdminNoticeDelete(int num);

    int updatehit(int num);
}
