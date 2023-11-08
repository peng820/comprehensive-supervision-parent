package com.evi.common.log.remote;

import com.evi.common.log.dto.SysLogDTO;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.web.client.RestTemplate;

/**
 * @author Lenovo
 * 远程请求保存日志
 */
@AllArgsConstructor
public class RemoteLogService {

    private static final Logger logger = LoggerFactory.getLogger(RemoteLogService.class);

    private ConfigurableEnvironment environment;

    public void saveLog(SysLogDTO logDTO) {
        RestTemplate template = new RestTemplate();
        String url = "http://localhost:" + environment.getProperty("server.port") + environment.getProperty("server.servlet.context-path") + "/log/save";
        try {
            String s = template.postForObject(url, logDTO, String.class);
            logger.info("日志保存:{}",s);
        }catch (Exception e){
            logger.error("日志保存失败",e);
        }
    }

}
