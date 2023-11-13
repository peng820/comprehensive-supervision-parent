package com.evi.server.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.evi.common.core.constant.UserConstant;
import com.evi.common.core.util.R;
import com.evi.server.entity.SysUser;
import com.evi.server.entity.in.Login;
import com.evi.server.service.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class LoginController {

    final SysUserService userService;


    @PostMapping("login")
    public R login(@RequestBody Login login) {
        LambdaQueryWrapper<SysUser> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(SysUser::getUsername, login.getUserName());
        SysUser user = userService.getOne(queryWrapper);
        // 用户状态验证
        R<String> r = userService.checkUserIsEffective(user);
        if (R.OK_CODE != r.getCode()) {
            return r;
        }
        // 密码验证
        if (!UserConstant.PASSWORD_DEFAULT.equals(login.getPassword())) {
            if(!login.getPassword().equals(user.getPassword())){
                return R.failed("用户名或密码错误");
            }
        }
        return userService.userInfo(user);
    }
}
