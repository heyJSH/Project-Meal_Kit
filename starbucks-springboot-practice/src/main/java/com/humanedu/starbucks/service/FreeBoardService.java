package com.humanedu.starbucks.service;


import com.humanedu.starbucks.domain.FreeBoardVO;

import java.util.List;

public interface FreeBoardService {
    List<FreeBoardVO> AdminNoticeListSelect(String search);
    int AdminNoticeInsert1(String name,
                           String subject,
                           String content,
                           List<String> fileNameList);
    FreeBoardVO AdminNoticeUpdateForm1(int num);

    int AdminNoticeUpdate1(int num,
                           String name,
                           String subject,
                           String content,
                           List<String> fileNameList);

    int AdminNoticeDelete1(int num);

    int updatehit1(int num);
}
