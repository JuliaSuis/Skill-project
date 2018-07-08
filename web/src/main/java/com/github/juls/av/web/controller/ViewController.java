package com.github.juls.av.web.controller;

import com.github.juls.av.core.db.domain.Node;
import com.github.juls.av.core.db.repo.LinksRepository;
import com.github.juls.av.core.db.repo.NodesRepository;
import com.github.juls.av.web.retrieve.AchievementsRetriever;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
public class ViewController {

    private final AchievementsRetriever achievementsRetriever;
    private final NodesRepository nodesRepository;
    private final LinksRepository linksRepository;

    @Autowired
    public ViewController(AchievementsRetriever achievementsRetriever,
                              NodesRepository nodesRepository, LinksRepository linksRepository) {
        this.achievementsRetriever = achievementsRetriever;
        this.nodesRepository = nodesRepository;
        this.linksRepository = linksRepository;
    }

    @GetMapping("/view")
    public String view() {
        return "view";
    }

    @GetMapping("/timeline")
    public String timeline() {
        return "timeline";
    }

    @GetMapping("/edit")
    public String edit() {
        return "edit";
    }

    @GetMapping("/main")
    public String main() {
        return "main";
    }

    @GetMapping("/signin")
    public String signin() {
        return "signin";
    }

    @GetMapping("/nodepage")
    public String nodepage() {
        return "nodepage";
    }

    @GetMapping("/gallery")
    public String gallery() {
        return "gallery";
    }

    @GetMapping("/view2")
    public ModelAndView view2() {
        ModelAndView mv = new ModelAndView("view2");

        List<Node> nodes = nodesRepository.findAllByOrderById2();
        List<String> times = new ArrayList<String>();

        for(Node n : nodes)
        {
            if(n.getTime().trim().isEmpty())
                continue;

            if(!times.contains(n.getTime()))
                times.add(n.getTime());
        }
        mv.addObject("nodes",nodes);
        mv.addObject("times", times);
        return mv;
    }
}
