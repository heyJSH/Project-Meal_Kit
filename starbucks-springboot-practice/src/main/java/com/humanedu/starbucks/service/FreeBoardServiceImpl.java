package com.humanedu.starbucks.service;

import com.humanedu.starbucks.domain.FreeBoardVO;
import com.humanedu.starbucks.mapper.BoardMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class FreeBoardServiceImpl implements FreeBoardService{
    @Autowired
    private BoardMapper boardMapper;
    @Override
    public List<FreeBoardVO> AdminNoticeListSelect(String search){
        List<FreeBoardVO> freeBoardVOList = null;

        // search 파라미터가 없으면 -> null
        // search 파라미터 값이 없으면 -> ''
        if(search == null) {
            freeBoardVOList = boardMapper.AdminNoticeListSelect(search);
        } else {
            if (!search.equals("")) {
                freeBoardVOList = boardMapper.AdminNoticeListSelect(search);
            }
        }
        // 다른 예
        // search검색어가 있으면 boardMapper.getFreeBoardList(search);
        // search검색어가 없으면 boardMapper.getFreeBoardList2();

        return freeBoardVOList;
    }
    @Override
    public int AdminNoticeInsert1(
            String name,
            String subject,
            String content,
            List<String> fileNameList
            ){
        FreeBoardVO freeBoardVO = new FreeBoardVO();
        freeBoardVO.setName(name);
        freeBoardVO.setSubject(subject);
        freeBoardVO.setContent(content);

        if (fileNameList != null) {
            int fileNameSize = fileNameList.size();
            if(fileNameSize >= 1) {
                freeBoardVO.setFile1Path(fileNameList.get(0));
            }
            if(fileNameSize >= 2) {
                freeBoardVO.setFile2Path(fileNameList.get(1));
            }
        }

        int rtn = boardMapper.AdminNoticeInsert(freeBoardVO);
        return rtn;
    }
    @Override
    public FreeBoardVO AdminNoticeUpdateForm1(int num){
        return boardMapper.AdminNoticeUpdateForm(num);
    }
    @Override
    public int AdminNoticeUpdate1(int num,
                                  String name,
                                  String subject,
                                  String content,
                                  List<String> fileNameList){
        FreeBoardVO freeBoardVO = new FreeBoardVO();
        freeBoardVO.setNum(num);
        freeBoardVO.setName(name);
        freeBoardVO.setSubject(subject);
        freeBoardVO.setContent(content);

        if (fileNameList != null && fileNameList.size() != 0) {
            int fileNameSize = fileNameList.size();
            if(fileNameSize >= 1) {
                freeBoardVO.setFile1Path(fileNameList.get(0));
            }
            if(fileNameSize >= 2) {
                freeBoardVO.setFile2Path(fileNameList.get(1));
            }
        }
        return boardMapper.AdminNoticeUpdate(freeBoardVO);
    }

    @Override
    public int AdminNoticeDelete1(int num){

        return boardMapper.AdminNoticeDelete(num);
    }

    @Override
    public int updatehit1(int num){
        return boardMapper.updatehit(num);
    }
}
