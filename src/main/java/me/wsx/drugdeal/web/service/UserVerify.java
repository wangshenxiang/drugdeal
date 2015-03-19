package me.wsx.drugdeal.web.service;

import org.springframework.stereotype.Service;

/**
 * Created by wangshenxiang on 15-3-18.
 */
@Service
public class UserVerify {

    public boolean doVerify(String name, String pwd) {
        if ("admin".equals(name) && "admin".equals(pwd)) {
            return true;
        }
        else {
            return false;
        }
    }
}
