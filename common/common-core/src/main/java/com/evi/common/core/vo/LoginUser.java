package com.evi.common.core.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 * 在线用户信息
 * </p>
 *
 * @Author scott
 * @since 2018-12-20
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class LoginUser {

	/**
	 * 登录人id
	 */
	private String id;

	/**
	 * 登录人账号
	 */
	private String username;

	/**
	 * 登录人密码
	 */
	private String password;

	/**
	 * 昵称
	 */
	private String nickname;

    /**
     * 当前登录部门ID
     */
    private String deptId;

    /**
     * 当前登录部门名称
     */
    private String deptName;

	/**
	 * 状态(0：正常 1：冻结 ）
	 */
	private Integer lockFlag;
	
	private Integer delFlag;

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

	/**多租户id配置，编辑用户的时候设置*/
	private String relTenantIds;

    /** 数据权限 */
    private String dataPermission;

    private List<String> processRoles;

	/**排序*/
	private Integer userOrder;

}
