package com.github.juls.av.core.db.domain;

import javax.persistence.*;

@Entity
@Table(name = "NODES")
public class Node {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private long id2;
    private String name;
    private String text;
    private String time;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getId2() {
        return id2;
    }

    public void setId2(long id2) {
        this.id2 = id2;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
