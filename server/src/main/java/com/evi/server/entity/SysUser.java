package com.evi.server.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 用户表
 * </p>
 *
 * @author Lenovo
 * @since 2023-05-16
 */
@Data
@TableName("sys_user")
public class SysUser implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    private Long userId;

    private String username;

    private String password;

    /**
     * 昵称
     */
    private String nickname;

    /**
     * 部门ID
     */
    private Long deptId;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 修改人
     */
    private String updateBy;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 修改时间
     */
    private LocalDateTime updateTime;

    private Integer lockFlag;

    private Integer delFlag;


    @Override
    public String toString() {
        return "SysUser{" +
            "userId=" + userId +
            ", username=" + username +
            ", password=" + password +
            ", deptId=" + deptId +
            ", createBy=" + createBy +
            ", updateBy=" + updateBy +
            ", createTime=" + createTime +
            ", updateTime=" + updateTime +
            ", lockFlag=" + lockFlag +
            ", delFlag=" + delFlag +
        "}";
    }
}
