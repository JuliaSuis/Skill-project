package com.github.juls.av.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

@SpringBootApplication(scanBasePackages = "com.github.juls.av")
public class Bootstrapper extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(Bootstrapper.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(Bootstrapper.class);
    }

}
