package org.zerock.service;

import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;

import java.util.List;

@Log4j
@Service
public class ReplyServiceImpl implements ReplyService{
    @Autowired
    private ReplyMapper mapper;

    @Override
    public int register(ReplyVO vo) {
        log.info("get...." +vo);

        return mapper.insert(vo);
    }

    @Override
    public ReplyVO get(Long rno) {
        log.info("get...." + rno);
        return mapper.read(rno);
    }

    @Override
    public int modify(ReplyVO vo) {
       log.info("modify....." + vo);
        return mapper.update(vo);
    }

    @Override
    public int remove(Long rno) {
        log.info("remove..." + rno);

        return mapper.delete(rno);
    }

    @Override
    public List<ReplyVO> getList(Criteria cri, Long bno) {
        log.info("get Reply List of a Board " + bno);

        return mapper.getListWithPaging(cri,bno);
    }
}
