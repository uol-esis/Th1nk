package de.uol.pgdoener.th1nk;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

@SpringBootApplication
@ConfigurationPropertiesScan
public class Th1nkApplication {
    public static void main(String[] args) {
        SpringApplication.run(Th1nkApplication.class, args);
    }
}
