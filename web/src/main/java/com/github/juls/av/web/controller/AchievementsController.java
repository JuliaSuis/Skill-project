package com.github.juls.av.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AchievementsController {

    @RequestMapping("/achievements")
    public String achievesPage() {
        return "achievements";
    }

}
