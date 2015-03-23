package me.wsx.drugdeal.persist.dao;

import me.wsx.drugdeal.persist.model.Drug;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

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

    public int deleteDrug(String id) {
        if (StringUtils.isEmpty(id)) {
            return -1;
        }
        return sqlSessionTemplate.delete("deleteDrug", id);
    }

    public int updateDrug(Drug drug) {
        if (drug == null) {
            return -1;
        }
        return sqlSessionTemplate.update("updateDrug", drug);
    }

    public Drug readDrug(String id) {
        if (StringUtils.isEmpty(id)) {
            return new Drug();
        }
        return (Drug)sqlSessionTemplate.selectOne("readDrug", id);
    }

    public int isDrugExisted(String id) {
        if (StringUtils.isEmpty(id)) {
            return 0;
        }
        return (int)sqlSessionTemplate.selectOne("isDrugExisted", id);
    }

    public List<Drug> blurReadDrugBySuoxie(String suoxie) {
        if (StringUtils.isEmpty(suoxie)) {
            return new ArrayList<Drug>();
        }
        String suoxieStr = "%"+suoxie+"%";
        return (List<Drug>)sqlSessionTemplate.selectList("blurReadDrugBySuoxie", suoxieStr);
    }

    public List<Drug> readAllDrug() {
        return (List<Drug>)sqlSessionTemplate.selectList("readAllDrug");
    }
}
