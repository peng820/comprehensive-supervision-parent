package com.evi.server.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.evi.server.entity.SysUserRole;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 * 用户角色表 Mapper 接口
 * </p>
 *
 * @author Lenovo
 * @since 2023-05-16
 */
public interface SysUserRoleMapper extends BaseMapper<SysUserRole> {
    @Select("select role_code from sys_role where role_id in (select role_id from sys_user_role where user_id = (select user_id from sys_user where username=#{username}))")
    List<String> getRoleByUserName(@Param("username") String username);
}
