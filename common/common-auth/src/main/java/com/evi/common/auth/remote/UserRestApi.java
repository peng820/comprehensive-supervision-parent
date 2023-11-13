package com.evi.common.auth.remote;

import com.evi.common.core.util.R;
import com.evi.common.core.vo.LoginUser;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Set;

public interface UserRestApi {

    /**
     * 获取用户权限
     * @param username
     * @return
     */
    Set<String> queryUserRoles(String username);

    /**
     * 查询用户权限信息
     * @param username
     * @return
     */
    Set<String> queryUserAuths(String username);

    /**
     * 根据用户账号查询用户信息
     * @param username
     * @return
     */
    LoginUser getUserByName(String username);
}
