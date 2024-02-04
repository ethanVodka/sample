package com.aaaaa.sample.dac.dao;

import org.seasar.doma.Dao;
import org.seasar.doma.Select;
import org.seasar.doma.boot.ConfigAutowireable;

import com.aaaaa.sample.dac.condition.SampleCondition;
import com.aaaaa.sample.dac.entity.SampleEntity;

@ConfigAutowireable
@Dao
public interface SampleDao {

    @Select
    public SampleEntity selectUserInfo(SampleCondition condition);
    
}
