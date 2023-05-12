package com.lec.hello.controller;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyController {
    @GetMapping("/")
    public String index(Model model){
        model.addAttribute("greeting", "hello, 스프링");
        return "home";
    }
    @GetMapping("confirm")
    @ResponseBody
    public String confirmString(@RequestParam(value="name",
            required = false,
            defaultValue = "마길동") String name){
        return name + "님 반갑습니다";
    }
    @GetMapping("json")
    @ResponseBody
    public Person json(@RequestParam(value = "name",
                        required = false,
                        defaultValue = "홍길동") String name,
                       @RequestParam(value="age",
                       required = false,
                       defaultValue = "0") int age){
        Person person = new Person(name, age);
        return person;
    }
    @Data
    @AllArgsConstructor
    static class Person{
        private String name;
        private int age;
    }
}









