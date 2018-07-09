package com.github.juls.av.utils;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class CsvToSql {
    private static final String NODES = "INSERT INTO NODES(ID,ID2,NAME,TEXT,TIME) VALUES (%d,%d,'%s','%s','%s');";
    private static final String LINKS= "INSERT INTO LINKS(ID,SOURCE,DESTINATION,VALUE) VALUES (%s,%s,%s,%s);";

    public static void main(String[] args) throws Exception {
        List<String> lines = Files.readAllLines(Paths.get(args[0]));

        List<String> nodes = new ArrayList<>();
        nodes.add("DROP TABLE IF EXISTS NODES;");
        nodes.add("CREATE TABLE NODES (ID INT PRIMARY KEY, ID2 INT, NAME VARCHAR(1024), TEXT VARCHAR(2048), TIME VARCHAR(127));");
        List<String> links = new ArrayList<>();
        links.add("DROP TABLE IF EXISTS LINKS;");
        links.add("CREATE TABLE IF NOT EXISTS LINKS (ID INT PRIMARY KEY, SOURCE INT, DESTINATION INT, VALUE DOUBLE);");
        for (int i = 2, linksId = 0; i < lines.size(); i++) {
            try {
                String[] arr = lines.get(i).split("\t");
                nodes.add(String.format(NODES, i, i,
                        arr[1].replaceAll("'", "''"), arr[5].replaceAll("'", "''"),
                        arr[3]));

                String link = arr[4];

                if (link == null || "".equals(link.trim()) || "/".equals(link.trim())) {
                    System.out.println("Skipping link at index " + i);
                    continue;
                }

                String[] ids = link.split(" ")[0].split(",");

                String s = link.split(" ")[1];
                String[] width = s.substring(1, s.length() - 1).split("/");

                for (int j = 0; j < ids.length; j++) {
                    links.add(String.format(LINKS, linksId++, i, ids[j], width[j]));
                }


            } catch (Exception e) {
                e.printStackTrace();
            }
        }


        System.out.println("---------------- NODES TABLE CREATION AND INSERTIONS ---------------");

        for (int i = 0; i < nodes.size(); i++)
            System.out.println(nodes.get(i));

        System.out.println("---------------- LINKS TABLE CREATION AND INSERTIONS ---------------");

        for (int i = 0; i < links.size(); i++)
            System.out.println(links.get(i));
    }

}
