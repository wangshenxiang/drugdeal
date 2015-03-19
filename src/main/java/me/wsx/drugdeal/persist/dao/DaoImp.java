package me.wsx.drugdeal.persist.dao;

import me.wsx.drugdeal.persist.model.Drug;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by wangshenxiang on 15-3-19.
 */
@Repository
public class DaoImp {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public int insertDrug(Drug drug) {
        if (drug == null) {
            return -1;
        }
        return sqlSessionTemplate.insert("insertDrug", drug);
    }
}
