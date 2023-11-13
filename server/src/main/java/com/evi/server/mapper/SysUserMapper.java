package com.evi.server.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.evi.server.entity.SysUser;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author Lenovo
 * @since 2023-05-16
 */
public interface SysUserMapper extends BaseMapper<SysUser> {

    @Select("select * from  sys_user  where username = #{username} and del_flag = 0")
    SysUser getUserByName(@Param("username") String username);
}
