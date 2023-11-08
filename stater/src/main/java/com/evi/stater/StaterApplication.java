package com.evi.stater;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author Lenovo
 */
@SpringBootApplication
@MapperScan({"com.evi.**.mapper"})
@ComponentScan(basePackages = {"com.evi.server"})
public class StaterApplication {

    public static void main(String[] args) {
        SpringApplication.run(StaterApplication.class, args);
    }

}
