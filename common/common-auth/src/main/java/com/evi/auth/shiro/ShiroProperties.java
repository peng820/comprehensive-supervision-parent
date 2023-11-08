package com.evi.auth.shiro;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.List;

@Data
@Component
@ConfigurationProperties(prefix = "shiro")
public class ShiroProperties {

    List<String> excludeUrls;
}
