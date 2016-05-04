package com.bionic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

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
    public String error500(HttpServletRequest request, Exception e, Model model){
        model.addAttribute("error", e.getMessage());
        return "/http-pages/500";
    }
}
