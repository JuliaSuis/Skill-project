package com.github.juls.av.utils;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

public class CsvToJson {

    public static void main(String[] args) throws Exception {
        List<String> lines = Files.readAllLines(Paths.get(args[0]));
        JSONObject body = new JSONObject();

        JSONObject title = new JSONObject();

        // title generation
        String[] heads = lines.get(2).split("\t");
        JSONObject hMedia = new JSONObject();
        hMedia.put("url", "/pic/" + heads[6]);
        hMedia.put("caption", "caption");
        title.put("media", hMedia);

        JSONObject hText = new JSONObject();
        hText.put("headline", "Mathematical discoveries<br/> 1850 BCE - 1899");
        hText.put("text", "<p>The data are presented from the view of time axis.</p>");
        title.put("text", hText);

        body.put("title", title);

        JSONArray events = new JSONArray();
        for (int i = 3; i < lines.size(); i++) {
            try {
                String[] line = lines.get(i).split("\t");

                JSONObject media = new JSONObject();
                media.put("url", "/pic/" + line[6]);
                media.put("link", "https://www.frustfrei-lernen.de/mathematik/geometrie-volumen-oberflaeche-fass-kugel.html");

                JSONObject start_date = new JSONObject();
                start_date.put("year", parseDate(line[3]));

                JSONObject text = new JSONObject();
                text.put("headline", line[1]);
                text.put("text", line[5]);

                JSONObject elem = new JSONObject();
                elem.put("media", media);
                elem.put("start_date", start_date);
                elem.put("text", text);

                events.add(elem);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        body.put("events", events);

        System.out.println(body.toJSONString());
    }

    private static int parseDate(String date) {
        try {
            date = date.trim();
            if (date.contains("BC")) {
                return -1 * Integer.parseInt(date.substring(0, date.indexOf(' ')));
            } else {
                return Integer.parseInt(date);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return -99999;
        }
    }

}
