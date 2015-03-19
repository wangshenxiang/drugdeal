package me.wsx.drugdeal.web.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by wangshenxiang on 15-3-18.
 */
@RestController
public class OpDrug {

    @RequestMapping(value = "/regDrug", method = RequestMethod.GET)
    public int regDrug() {
        return 1;
    }
}
