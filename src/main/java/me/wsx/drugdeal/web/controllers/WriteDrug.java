package me.wsx.drugdeal.web.controllers;

import me.wsx.drugdeal.persist.dao.DaoImp;
import me.wsx.drugdeal.persist.model.Drug;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by wangshenxiang on 15-3-18.
 */
@Controller
public class WriteDrug {

    @Autowired
    private DaoImp daoImp;

    @RequestMapping(value = "/insertDrug", method = RequestMethod.POST)
    public String insertDrug(String id,
                          String name,
                          String spec,
                          double price,
                          String suoxie,
                          String product,
                          int numbers,
                          String memo,
                          Model model) {
        Drug drug = new Drug();
        drug.setId(id);
        drug.setName(name);
        drug.setSpec(spec);
        drug.setPrice(price);
        drug.setSuoxie(suoxie);
        drug.setProduct(product);
        drug.setNumbers(numbers);
        drug.setMemo(memo);

        model.addAttribute("uri", "/drugdeal/route/insertDrug");
        model.addAttribute("opName", "继续添加药物");
        try{
            daoImp.insertDrug(drug);
            return "opSuccess";
        } catch (Exception e) {
            model.addAttribute("error",e.toString());
            return "opFail";
        }
    }

    @RequestMapping(value = "/updateDrug", method = RequestMethod.POST)
    public String updateDrug(String id,
                             String name,
                             String spec,
                             double price,
                             String suoxie,
                             String product,
                             int numbers,
                             String memo,
                             Model model) {
        Drug drug = new Drug();
        drug.setId(id);
        drug.setName(name);
        drug.setSpec(spec);
        drug.setPrice(price);
        drug.setSuoxie(suoxie);
        drug.setProduct(product);
        drug.setNumbers(numbers);
        drug.setMemo(memo);

        model.addAttribute("uri", "/drugdeal/route/updateDrug");
        model.addAttribute("opName", "继续修改药物");
        try{
            daoImp.updateDrug(drug);
            return "opSuccess";
        } catch (Exception e) {
            model.addAttribute("error",e.toString());
            return "opFail";
        }
    }

    @RequestMapping(value = "/deleteDrug", method = RequestMethod.POST)
    public String deleteDrug(String id,
                             Model model) {

        model.addAttribute("uri", "/drugdeal/route/deleteDrug");
        model.addAttribute("opName", "继续删除药物");
        try{
            daoImp.deleteDrug(id);
            return "opSuccess";
        } catch (Exception e) {
            model.addAttribute("error",e.toString());
            return "opFail";
        }
    }

}
