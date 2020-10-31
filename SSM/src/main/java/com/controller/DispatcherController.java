package com.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class DispatcherController {
    //这个是用来转发的功能
    @RequestMapping("/go_backend")
    public String target(String target)
    {
        System.out.println("到这里了没有"+target);
        return target;
    }

}
