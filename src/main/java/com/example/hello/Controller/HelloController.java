package com.example.hello.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class HelloController {

    @RequestMapping(method = RequestMethod.GET, value = "/hello")
    public String sayHello() {
        return "Swagger Hello World";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/heart")
    public ModelAndView heart(ModelMap model) {
        return new ModelAndView("index", model);
    }

//    @RequestMapping(method = RequestMethod.GET, value = "/heart")
//    public String heart() {
//        return "index";
//    }
}