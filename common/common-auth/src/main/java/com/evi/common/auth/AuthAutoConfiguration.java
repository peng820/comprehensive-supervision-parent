package com.evi.common.auth;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan("com.evi.common.auth") // 这里是你的@Component所在的包路径
public class AuthAutoConfiguration {
}
