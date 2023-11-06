package com.evi.server.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.evi.server.entity.SysUser;
import com.evi.server.mapper.SysUserMapper;
import com.evi.server.service.SysUserService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author Lenovo
 * @since 2023-05-16
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

}
