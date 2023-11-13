package com.evi.server.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.evi.server.entity.SysUserRole;

import java.util.Set;

/**
 * <p>
 * 用户角色表 服务类
 * </p>
 *
 * @author Lenovo
 * @since 2023-05-16
 */
public interface SysUserRoleService extends IService<SysUserRole> {

    /**
     * 通过用户名获取用户角色集合
     *
     * @param username 用户名
     * @return 角色集合
     */
    Set<String> getUserRolesSet(String username);

}
