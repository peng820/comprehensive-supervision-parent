package com.evi.server.service.impl;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.evi.common.core.constant.CommonConstant;
import com.evi.common.core.constant.UserConstant;
import com.evi.common.core.util.JwtUtil;
import com.evi.common.core.util.R;
import com.evi.common.core.util.RedisUtil;
import com.evi.common.core.vo.LoginUser;
import com.evi.server.entity.SysDept;
import com.evi.server.entity.SysMenu;
import com.evi.server.entity.SysUser;
import com.evi.server.mapper.SysMenuMapper;
import com.evi.server.mapper.SysUserMapper;
import com.evi.server.service.SysDeptService;
import com.evi.server.service.SysUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

    @Resource
    SysMenuMapper sysMenuMapper;

    @Resource
    SysDeptService sysDeptService;

    @Resource
    RedisUtil redisUtil;

    @Override
    public LoginUser getUserByName(String username) {

        if (StrUtil.isEmpty(username)) {
            return null;
        }
        LoginUser loginUser = new LoginUser();
        SysUser sysUser = baseMapper.getUserByName(username);
        if (sysUser == null) {
            return null;
        }
        BeanUtils.copyProperties(sysUser, loginUser);
        SysDept sysDept = sysDeptService.getById(sysUser.getDeptId());
        loginUser.setDeptName(sysDept.getName());
        List<Long> roles = sysMenuMapper.queryRoleMenuByUserId(sysUser.getUserId());
        loginUser.setProcessRoles(roles);
        return loginUser;
    }

    @Override
    public Set<String> getUserPermissionsSet(String username) {
        Set<String> permissionSet = new HashSet<>();
        List<SysMenu> permissionList = sysMenuMapper.queryByUser(username);
        for (SysMenu po : permissionList) {
            if (StrUtil.isNotEmpty(po.getPermission())) {
                permissionSet.add(po.getPermission());
            }
        }
        return permissionSet;
    }

    /**
     * 用户信息
     *
     * @param sysUser
     * @return
     */
    @Override
    public R<JSONObject> userInfo(SysUser sysUser) {
        String password = sysUser.getPassword();
        String username = sysUser.getUsername();
        // 生成token
        String token = JwtUtil.sign(username, password);
        // 设置token缓存有效时间
        redisUtil.set(CommonConstant.PREFIX_USER_TOKEN + token, token);
        long expires = JwtUtil.EXPIRE_TIME * 2 / 1000;
        redisUtil.expire(CommonConstant.PREFIX_USER_TOKEN + token, expires);

        // 获取用户部门信息
        JSONObject obj = new JSONObject();
        SysDept dept = sysDeptService.getById(sysUser.getDeptId());
        obj.put("dept", dept);
        if (dept == null) {
            return R.failed(null, R.FAILED_CODE, "账号未分配部门");
        }
        obj.put("token", token);
        obj.put("userInfo", baseMapper.getUserByName(username));
        return R.ok(obj, "登录成功");
    }

    @Override
    public R<String> checkUserIsEffective(SysUser sysUser) {
        //情况1：根据用户信息查询，该用户不存在
        if (sysUser == null) {
            return R.failed("该用户不存在，请注册");
        }
        if (UserConstant.DEL_FLAG_1.equals(sysUser.getDelFlag())) {
            return R.failed("该用户已注销");
        }
        //情况3：根据用户信息查询，该用户已冻结
        if (UserConstant.STATUS_DISABLE.equals(sysUser.getLockFlag())) {
            return R.failed("该用户已冻结");
        }
        return R.ok();
    }
}
