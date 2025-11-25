package de.uol.pgdoener.th1nk;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

@SpringBootApplication
@ConfigurationPropertiesScan
public class Th1nkApplication {
    public static void main(String[] args) {
        //System.out.println(org.hibernate.Version.getVersionString());
        SpringApplication.run(Th1nkApplication.class, args);
    }
}
