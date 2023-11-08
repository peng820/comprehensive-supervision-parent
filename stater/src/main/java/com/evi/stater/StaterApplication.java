package com.evi.stater;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan({"com.evi.**.mapper"})
public class StaterApplication {

    public static void main(String[] args) {
        SpringApplication.run(StaterApplication.class, args);
    }

}
