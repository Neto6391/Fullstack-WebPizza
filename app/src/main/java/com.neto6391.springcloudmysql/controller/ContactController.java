package com.neto6391.springcloudhello.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ContactController {
    
    @RequestMapping("/")
    public String home() {
        return "Hello World";
    }
}