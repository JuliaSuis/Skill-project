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

    @GetMapping("/node0")
    public String node0(){ return "node0"; }

    @GetMapping("/node1")
    public String node1(){ return "node1"; }

    @GetMapping("/node2")
    public String node2(){ return "node2"; }

    @GetMapping("/node3")
    public String node3(){ return "node3"; }

    @GetMapping("/node4")
    public String node4(){ return "node4"; }

    @GetMapping("/node5")
    public String node5(){ return "node5"; }

    @GetMapping("/node6")
    public String node6(){ return "node6"; }

    @GetMapping("/node7")
    public String node7(){ return "node7"; }

    @GetMapping("/node8")
    public String node8(){ return "node8"; }

    @GetMapping("/node9")
    public String node9(){ return "node9"; }

    @GetMapping("/node10")
    public String node10(){ return "node10"; }

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

    @GetMapping("/view3")
    public ModelAndView view3() {
        ModelAndView mv = new ModelAndView("view3");

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
