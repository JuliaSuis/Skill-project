package com.github.juls.av.web.endpoints;

import com.github.juls.av.core.db.domain.Achievement;
import com.github.juls.av.core.db.domain.Link;
import com.github.juls.av.core.db.domain.Node;
import com.github.juls.av.core.db.repo.LinksRepository;
import com.github.juls.av.core.db.repo.NodesRepository;
import com.github.juls.av.web.retrieve.AchievementsRetriever;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@RestController
public class DataExportEndpoint {
    private static final Logger LOG = LoggerFactory.getLogger(DataExportEndpoint.class);

    private final AchievementsRetriever achievementsRetriever;
    private final NodesRepository nodesRepository;
    private final LinksRepository linksRepository;

    @Autowired
    public DataExportEndpoint(AchievementsRetriever achievementsRetriever,
                              NodesRepository nodesRepository, LinksRepository linksRepository) {
        this.achievementsRetriever = achievementsRetriever;
        this.nodesRepository = nodesRepository;
        this.linksRepository = linksRepository;
    }

    @GetMapping("/info")
    public List<Achievement> getAchievementsInfo() {
        try {
            return achievementsRetriever.getAchievements();
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return Collections.emptyList();
        }
    }

    @GetMapping("/data")
    public List<Node> exportData() {
        try {
            return nodesRepository.findAll();
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return Collections.emptyList();
        }
    }

    @GetMapping("/edges")
    public List<Link> exportEdges() {
        try {
            return linksRepository.findAll();
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            return Collections.emptyList();
        }
    }

    @RequestMapping(value="/links.json",method = RequestMethod.GET)
    public String exportLinks(
            @RequestParam(value = "nodes", required = false, defaultValue = "") int[] nodesFilter,
            @RequestParam(value = "time", required = false, defaultValue = "") String[] timeFilter,
            @RequestParam(value = "nodesCount", required = false, defaultValue = "-1") int nodesCount
        )
    {
        JSONObject o = new JSONObject();


        try {

            List<Node> nodes = nodesRepository.findAllByOrderById2();
            List<Link> links = linksRepository.findAll();

            List<Long> list = new ArrayList<Long>();
            if(nodesFilter.length > 0)
            {
                list.clear();
                for(int i : nodesFilter)
                {
                    list.add(new Long(i));
                }
                nodes = nodesRepository.filterIn(list);
                links = linksRepository.filterIn(list);
            }

            if(nodesCount != -1)
            {
                list.clear();
                for(int i = 0 ; i < nodesCount ; i++)
                {
                    list.add(nodes.get(i).getId2());
                }
                nodes = nodesRepository.filterIn(list);
                links = linksRepository.filterIn(list);
            }

            if(timeFilter.length > 0)
            {
                list.clear();
                List<String> times = Arrays.asList(timeFilter);
                list.add(new Long(0));
                for(Node n : nodes)
                {
                    if(times.contains(n.getTime()))
                        list.add(n.getId2());
                }
                nodes = nodesRepository.filterIn(list);
                links = linksRepository.filterIn(list);
            }

            JSONArray nodesArray = new JSONArray();
            for(Node n : nodes)
            {
                JSONObject node = new JSONObject();
                node.put("id",n.getId2());
                //node.put("label",n.getName()+ " - "+n.getText()+" - "+n.getTime());
                node.put("label",n.getName()+" - "+n.getTime());
                node.put("group",n.getTime());

                nodesArray.add(node);
            }

            JSONArray linksArray = new JSONArray();
            for(Link l : links)
            {
                JSONObject link = new JSONObject();
                link.put("source",l.getSource());
                link.put("target",l.getDestination());
                link.put("value",l.getValue());

                linksArray.add(link);
            }

            o.put("nodes",nodesArray);
            o.put("links",linksArray);

            return o.toString();
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            
            return o.toString();
        }
    }
}
