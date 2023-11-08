package com.evi.auth;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan("com.evi.auth") // 这里是你的@Component所在的包路径
public class AuthComponentAutoConfiguration {
}
