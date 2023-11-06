package com.evi.server.controller;


import com.evi.common.core.util.R;
import com.evi.common.log.annotation.SysLog;
import com.evi.server.entity.SysDept;
import com.evi.server.service.SysDeptService;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

/**
 * <p>
 * 部门 前端控制器
 * </p>
 *
 * @author Lenovo
 * @since 2023-05-16
 */
@RestController
@AllArgsConstructor
@RequestMapping("/dept")
@Api(value = "dept", tags = "部门管理模块")
public class SysDeptController {

    private final SysDeptService sysDeptService;

    /**
     * 通过ID查询
     *
     * @param id ID
     * @return SysDept
     */
    @GetMapping("/{id}")
    public R getById(@PathVariable Long id) {
        return R.ok(sysDeptService.getById(id));
    }

    /**
     * 添加
     *
     * @param sysDept 实体
     * @return success/false
     */
    @SysLog("添加部门")
    @PostMapping
    public R save(@RequestBody SysDept sysDept) {
        return R.ok(sysDeptService.saveDept(sysDept));
    }

    /**
     * 删除
     *
     * @param id ID
     * @return success/false
     */
    @SysLog("删除部门")
    @DeleteMapping("/{id}")
    public R removeById(@PathVariable Long id) {
        return R.ok(sysDeptService.removeDeptById(id));
    }

    /**
     * 编辑
     *
     * @param sysDept 实体
     * @return success/false
     */
    @SysLog("编辑部门")
    @PutMapping
    public R update(@RequestBody SysDept sysDept) {
        sysDept.setUpdateTime(LocalDateTime.now());
        return R.ok(sysDeptService.updateDeptById(sysDept));
    }

    /**
     * 查询本机构
     */
    @GetMapping(value = "/getDept/{deptId}")
    public R<SysDept> getDept(@PathVariable Long deptId) {
        SysDept sysDept = sysDeptService.getById(deptId);
        return R.ok(sysDept);
    }

}
