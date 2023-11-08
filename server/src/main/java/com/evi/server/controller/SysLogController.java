package com.evi.server.controller;


import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.evi.common.core.util.R;
import com.evi.common.log.dto.SysLogDTO;
import com.evi.common.log.remote.LogRestApi;
import com.evi.server.service.SysLogService;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 日志表 前端控制器
 * </p>
 *
 * @author admin
 * @since 2017-11-20
 */
@RestController
@AllArgsConstructor
@RequestMapping("/log")
@Api(value = "log", tags = "日志管理模块")
public class SysLogController implements LogRestApi {

    private final SysLogService sysLogService;

    /**
     * 简单分页查询
     *
     * @param page   分页对象
     * @param sysLog 系统日志
     * @return
     */
    @GetMapping("/page")
    public R getLogPage(Page page, SysLogDTO sysLog) {
        return R.ok(sysLogService.getLogByPage(page, sysLog));
    }

    /**
     * 删除日志
     *
     * @param id ID
     * @return success/false
     */
    @DeleteMapping("/{id}")
    public R removeById(@PathVariable Long id) {
        return R.ok(sysLogService.removeById(id));
    }

    /**
     * 批量删除日志
     *
     * @param ids ID
     * @return success/false
     */
    @DeleteMapping
    public R removeByIds(@RequestBody Long[] ids) {
        return R.ok(sysLogService.removeByIds(CollUtil.toList(ids)));
    }

    /**
     * 插入日志
     *
     * @param sysLog 日志实体
     * @return success/false
     */
    @PostMapping("/save")
    public R save(@RequestBody SysLogDTO sysLog) {
        return R.ok(sysLogService.saveLog(sysLog));
    }

    @Override
    public void saveLog(SysLogDTO sysLog) {
        this.save(sysLog);
    }
}
