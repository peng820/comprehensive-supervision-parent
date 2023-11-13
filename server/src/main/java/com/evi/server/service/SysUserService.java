package com.evi.server.service;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.service.IService;
import com.evi.common.core.util.R;
import com.evi.common.core.vo.LoginUser;
import com.evi.server.entity.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.Set;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author Lenovo
 * @since 2023-05-16
 */
public interface SysUserService extends IService<SysUser> {

    /**
     * 通过用户账号查询用户信息
     * @param username
     * @return
     */
    LoginUser getUserByName(String username);

    /**
     * 通过用户名获取用户权限集合
     *
     * @param username 用户名
     * @return 权限集合
     */
    Set<String> getUserPermissionsSet(String username);

    /**
     * 验证用户是否有效
     * @param sysUser
     * @return
     */
    R<String> checkUserIsEffective(SysUser sysUser);

    /**
     * 用户信息
     * @param sysUser
     * @return
     */
    R<JSONObject> userInfo(SysUser sysUser);

}
