package com.evi.server.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.evi.server.entity.SysMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 菜单权限表 Mapper 接口
 * </p>
 *
 * @author Lenovo
 * @since 2023-05-16
 */
public interface SysMenuMapper extends BaseMapper<SysMenu> {
    /**
     *   根据用户查询用户权限
     */
    List<SysMenu> queryByUser(@Param("username") String username);

    /**
     *  更具用户id查询用户权限菜单id
     * @param userId
     * @return
     */
    List<Long> queryRoleMenuByUserId(@Param("userId") Long userId);
}
