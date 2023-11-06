package com.evi.server.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.evi.server.entity.SysDept;
import com.evi.server.mapper.SysDeptMapper;
import com.evi.server.service.SysDeptService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 部门 服务实现类
 * </p>
 *
 * @author Lenovo
 * @since 2023-05-16
 */
@Service
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDept> implements SysDeptService {
    /**
     * 添加信息部门
     * @param dept 部门
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean saveDept(SysDept dept) {
        this.save(dept);
        return Boolean.TRUE;
    }

    /**
     * 删除部门
     * @param id 部门 ID
     * @return 成功、失败
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean removeDeptById(Long id) {

        this.removeById(id);
        this.remove(Wrappers.<SysDept>query().lambda().eq(SysDept::getParentId, id));

        return Boolean.TRUE;
    }

    /**
     * 更新部门
     * @param sysDept 部门信息
     * @return 成功、失败
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean updateDeptById(SysDept sysDept) {
        // 更新部门状态
        this.updateById(sysDept);
        return Boolean.TRUE;
    }
}
