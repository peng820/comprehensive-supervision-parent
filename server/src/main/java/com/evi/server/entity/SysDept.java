package com.evi.server.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 部门
 * </p>
 *
 * @author Lenovo
 * @since 2023-05-16
 */
@Data
@TableName("sys_dept")
public class SysDept implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    private Long deptId;

    /**
     * 名称
     */
    private String name;

    /**
     * 父节点
     */
    private Long parentId;

    /**
     * 排序
     */
    private Integer sortOrder;

    /**
     * 租户ID
     */
    private Long tenantId;

    /**
     * 删除标志
     */
    private String delFlag;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 创建账号
     */
    private String createBy;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;

    /**
     * 更新账号
     */
    private String updateBy;


    @Override
    public String toString() {
        return "SysDept{" +
            "deptId=" + deptId +
            ", name=" + name +
            ", parentId=" + parentId +
            ", sortOrder=" + sortOrder +
            ", tenantId=" + tenantId +
            ", delFlag=" + delFlag +
            ", createTime=" + createTime +
            ", createBy=" + createBy +
            ", updateTime=" + updateTime +
            ", updateBy=" + updateBy +
        "}";
    }
}
