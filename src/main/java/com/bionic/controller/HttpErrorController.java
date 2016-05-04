package com.bionic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HttpErrorController {

    @RequestMapping("/404")
    public String error404(){
        return "/http-pages/404";
    }

    @RequestMapping("/400")
    public String error400(){
        return "/http-pages/400";
    }

    @RequestMapping("/500")
    public String error500(Exception e, Model model){
        StackTraceElement[] stack = e.getStackTrace();
        StringBuilder sb = new StringBuilder();
        for(StackTraceElement el : stack) {
            sb.append(el.toString()).append(System.lineSeparator());
        }
        model.addAttribute("error", sb.toString());
        return "/http-pages/500";
    }
}
