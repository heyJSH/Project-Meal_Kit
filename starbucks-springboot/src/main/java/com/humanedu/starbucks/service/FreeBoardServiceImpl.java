package com.humanedu.starbucks.service;

import com.humanedu.starbucks.domain.FreeBoardVO;
import com.humanedu.starbucks.mapper.BoardMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class FreeBoardServiceImpl implements FreeBoardService {
    @Autowired
    private BoardMapper boardMapper;

    // 게시물 목록 조회 서비스
    @Override
    public List<FreeBoardVO> getFreeBoardList(String search) {
        List<FreeBoardVO> freeBoardVOList = null;

        // search 파라미터가 없으면 -> null
        // search 파라미터 값이 없으면 -> ''
        if(search == null) {
            freeBoardVOList = boardMapper.getFreeBoardList(search);
        } else {
            if (!search.equals("")) {
                freeBoardVOList = boardMapper.getFreeBoardList(search);
            }
        }
        // 다른 예
        // search검색어가 있으면 boardMapper.getFreeBoardList(search);
        // search검색어가 없으면 boardMapper.getFreeBoardList2();

        return freeBoardVOList;
    }

    @Override
    public int insertFreeBoard(
            String korName,
            String subject,
            String content,
            List<String> fileNameList
    ) {
        FreeBoardVO freeBoardVO = new FreeBoardVO();
        freeBoardVO.setName(korName);
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

        int rtn = boardMapper.putFreeBoard(freeBoardVO);
        return rtn;
    }

    @Override
    public int deleteFreeBoard(int num) {
        return boardMapper.delFreeBoard(num);
    }

    @Override
    public FreeBoardVO selectFreeBoardOne(int num) {
        return boardMapper.getFreeBoardOne(num);
    }

    @Override
    public int updateFreeBoard(int num,
                               String korName,
                               String subject,
                               String content,
                               List<String> fileNameList) {
        FreeBoardVO freeBoardVO = new FreeBoardVO();
        freeBoardVO.setNum(num);
        freeBoardVO.setName(korName);
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

        return boardMapper.updateFreeBoard(freeBoardVO);
    }

    @Override
    public int updateFreeBoard(
            int num,
            String korName,
            String subject,
            String content,
            String file1Path,
            String file2Path
    ) {
        FreeBoardVO freeBoardVO = new FreeBoardVO();
        freeBoardVO.setNum(num);
        freeBoardVO.setName(korName);
        freeBoardVO.setSubject(subject);
        freeBoardVO.setContent(content);
        if (file1Path != "")
            freeBoardVO.setFile1Path(file1Path);
        if (file2Path != "")
            freeBoardVO.setFile2Path(file2Path);

        return boardMapper.updateFreeBoard(freeBoardVO);
    }
}
