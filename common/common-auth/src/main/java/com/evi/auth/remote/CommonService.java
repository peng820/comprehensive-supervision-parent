package com.evi.auth.remote;

import com.evi.common.core.util.R;
import com.evi.common.core.vo.LoginUser;
import lombok.AllArgsConstructor;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * @author Lenovo
 * 远程请求保存日志
 */

@Component
@AllArgsConstructor
public class CommonService {

    private ConfigurableEnvironment environment;

    /**
     * 查询用户角色信息
     * @param username
     * @return
     */
    public Set<String> queryUserRoles(String username) {
        RestTemplate template = new RestTemplate();
        StringBuffer url = new StringBuffer();
        url.append("http://localhost:");
        url.append(environment.getProperty("server.port"));
        url.append(environment.getProperty("server.servlet.context-path"));
        url.append("/sys/queryUserRoles");
        url.append("?");
        url.append("username={username}");
        Map<String, String> params = new HashMap<>();
        params.put("username", username);
        R<Set<String>> ret = template.getForObject(url.toString(), R.class, params);
        return ret.getData();
    }

    /**
     * 查询用户权限信息
     * @param username
     * @return
     */
    public Set<String> queryUserAuths(String username){
        RestTemplate template = new RestTemplate();
        StringBuffer url = new StringBuffer();
        url.append("http://localhost:");
        url.append(environment.getProperty("server.port"));
        url.append(environment.getProperty("server.servlet.context-path"));
        url.append("/sys/queryUserAuths");
        url.append("?");
        url.append("username={username}");
        Map<String, String> params = new HashMap<>();
        params.put("username", username);
        R<Set<String>> ret = template.getForObject(url.toString(), R.class, params);
        return ret.getData();
    }

    /**
     * 根据用户账号查询用户信息
     * @param username
     * @return
     */
    public LoginUser getUserByName(String username){
        RestTemplate template = new RestTemplate();
        StringBuffer url = new StringBuffer();
        url.append("http://localhost:");
        url.append(environment.getProperty("server.port"));
        url.append(environment.getProperty("server.servlet.context-path"));
        url.append("/sys/getUserByName");
        url.append("?");
        url.append("username={username}");
        Map<String, String> params = new HashMap<>();
        params.put("username", username);
        R<LoginUser> ret = template.getForObject(url.toString(), R.class, params);
        return ret.getData();
    }
}
