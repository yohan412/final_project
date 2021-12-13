package com.mvc.fotsal.model.biz;

import com.mvc.fotsal.model.dao.GameDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GameBizImpl implements GameBiz{
    @Autowired
    private GameDao gameDao;



}
