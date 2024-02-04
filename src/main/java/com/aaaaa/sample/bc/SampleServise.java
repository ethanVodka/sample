package com.aaaaa.sample.bc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aaaaa.sample.dac.condition.SampleCondition;
import com.aaaaa.sample.dac.dao.SampleDao;
import com.aaaaa.sample.dac.entity.SampleEntity;
import com.aaaaa.sample.ic.dto.InDto;

@Service
public class SampleServise {
    
    @Autowired
    SampleCondition condition;

    @Autowired
    SampleDao dao;

    public SampleEntity getUser(InDto dto){
        SampleCondition condition = new SampleCondition();
        SampleEntity entity = new SampleEntity();
        
        condition.setId(dto.getId());
        entity =  dao.selectUserInfo(condition);

        return entity;
    }

}
