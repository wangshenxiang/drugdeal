package me.wsx.drugdeal.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by wangshenxiang on 15-3-19.
 */
@Controller
public class Route {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home() {
        return "home";
    }

    @RequestMapping(value = "/route/insertDrug", method = RequestMethod.GET)
    public String insertDrug() {
        return "insertDrug";
    }

    @RequestMapping(value = "/route/deleteDrug", method = RequestMethod.GET)
    public String deleteDrug() {
        return "deleteDrug";
    }

    @RequestMapping(value = "/route/updateDrug", method = RequestMethod.GET)
    public String updateDrug() {
        return "updateDrug";
    }

    @RequestMapping(value = "/route/blurReadDrugBySuoxie", method = RequestMethod.GET)
    public String blurReadDrugBySuoxie() {
        return "blurReadDrugBySuoxie";
    }
}
