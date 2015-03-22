package me.wsx.drugdeal.web.controllers;

import me.wsx.drugdeal.persist.dao.DaoImp;
import me.wsx.drugdeal.persist.model.Drug;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wangshenxiang on 15-3-19.
 */
@RestController
public class ReadDrug {

    @Autowired
    private DaoImp daoImp;

    @RequestMapping(value = "/readDrug", method = RequestMethod.GET)
    public Drug readDrug(String id) {
        return daoImp.readDrug(id);
    }

    @RequestMapping(value = "/isDrugExisted", method = RequestMethod.GET)
    public int isDrugExisted(String id) {
        return daoImp.isDrugExisted(id);
    }

    @RequestMapping(value = "/blurReadDrugBySuoxie", method = RequestMethod.GET)
    public List<Drug> blurReadDrugBySuoxie(String suoxie) {
        return daoImp.blurReadDrugBySuoxie(suoxie);
    }
}
