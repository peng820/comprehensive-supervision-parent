package com.evi.server.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.evi.server.entity.SysDept;

/**
 * <p>
 * 部门 服务类
 * </p>
 *
 * @author Lenovo
 * @since 2023-05-16
 */
public interface SysDeptService extends IService<SysDept> {

    /**
     * 添加信息部门
     * @param sysDept
     * @return
     */
    Boolean saveDept(SysDept sysDept);

    /**
     * 删除部门
     * @param id 部门 ID
     * @return 成功、失败
     */
    Boolean removeDeptById(Long id);

    /**
     * 更新部门
     * @param sysDept 部门信息
     * @return 成功、失败
     */
    Boolean updateDeptById(SysDept sysDept);

}
