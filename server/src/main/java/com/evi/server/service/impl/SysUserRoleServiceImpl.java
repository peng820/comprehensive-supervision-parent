package com.evi.server.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.evi.server.entity.SysUserRole;
import com.evi.server.mapper.SysUserRoleMapper;
import com.evi.server.service.SysUserRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * <p>
 * 用户角色表 服务实现类
 * </p>
 *
 * @author Lenovo
 * @since 2023-05-16
 */
@Service
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRole> implements SysUserRoleService {

    @Override
    public Set<String> getUserRolesSet(String username) {
        List<String> roles = baseMapper.getRoleByUserName(username);
        return new HashSet<>(roles);
    }
}
