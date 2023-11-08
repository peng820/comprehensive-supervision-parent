package com.evi.server;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan({"com.evi.**.mapper"})
@ComponentScan(basePackages = {"com.evi.server"})
public class ServerComponentAutoConfiguration {
}
