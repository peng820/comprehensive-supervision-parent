package com.evi.common.log.remote;

import com.evi.common.log.dto.SysLogDTO;
import lombok.AllArgsConstructor;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.web.client.RestTemplate;

/**
 * @author Lenovo
 * 远程请求保存日志
 */
@AllArgsConstructor
public class RemoteLogService {

    private ConfigurableEnvironment environment;

    public void saveLog(SysLogDTO logDTO) {
        RestTemplate template = new RestTemplate();
        String url = "http://localhost:" + environment.getProperty("server.port") + environment.getProperty("server.servlet.context-path") + "/log/save";
        String s = template.postForObject(url, logDTO, String.class);
        System.out.println(s);
    }

}
