package com.evi.server.controller;

import com.evi.common.auth.remote.UserRestApi;
import com.evi.common.core.vo.LoginUser;
import com.evi.server.service.SysUserRoleService;
import com.evi.server.service.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RestController;

import java.util.Set;

/**
 * @author Lenovo
 */
@RestController
@RequiredArgsConstructor
public class ShiroController implements UserRestApi {

    final SysUserService sysUserService;
    final SysUserRoleService sysUserRoleService;


    @Override
    public Set<String> queryUserRoles(String username) {
        return sysUserRoleService.getUserRolesSet(username);
    }

    @Override
    public Set<String> queryUserAuths(String username) {
        return sysUserService.getUserPermissionsSet(username);
    }

    @Override
    public LoginUser getUserByName(String username) {
        return sysUserService.getUserByName(username);
    }
}
