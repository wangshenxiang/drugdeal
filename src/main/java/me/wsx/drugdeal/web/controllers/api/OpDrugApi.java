package me.wsx.drugdeal.web.controllers.api;

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
public class OpDrugApi {

    @Autowired
    private DaoImp daoImp;

    @RequestMapping(value = "/readDrug", method = RequestMethod.GET)
    public Drug readDrug(String id) {
        return daoImp.readDrug(id);
    }

    @RequestMapping(value = "/readAllDrug", method = RequestMethod.GET)
    public List<Drug> readAllDrug() {
        return daoImp.readAllDrug();
    }

    @RequestMapping(value = "/isDrugExisted", method = RequestMethod.GET)
    public int isDrugExisted(String id) {
        return daoImp.isDrugExisted(id);
    }

    @RequestMapping(value = "/blurReadDrugBySuoxie", method = RequestMethod.GET)
    public List<Drug> blurReadDrugBySuoxie(String suoxie) {
        suoxie = suoxie.toUpperCase();
        return daoImp.blurReadDrugBySuoxie(suoxie);
    }

    @RequestMapping(value = "/subDrugNumbers", method = RequestMethod.GET)
    public int subDrugNumbers(String id, int num) {
        try {
            Drug drug = daoImp.readDrug(id);
            int oldNum = drug.getNumbers();
            int newNum = oldNum - num;
            if (newNum < 0) {
                return 0;
            }
            drug.setNumbers(newNum);
            daoImp.updateDrug(drug);
            return 1;
        } catch (Exception e) {
            return -1;
        }
    }

    @RequestMapping(value = "/addDrugNumbers", method = RequestMethod.GET)
    public int addDrugNumbers(String id, int num) {
        try {
            Drug drug = daoImp.readDrug(id);
            int oldNum = drug.getNumbers();
            int newNum = oldNum + num;
            if (newNum < 0) {
                return 0;
            }
            drug.setNumbers(newNum);
            daoImp.updateDrug(drug);
            return 1;
        } catch (Exception e) {
            return -1;
        }
    }
}
