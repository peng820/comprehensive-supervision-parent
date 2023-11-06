package com.evi.server.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.evi.common.log.dto.SysLogDTO;
import com.evi.server.entity.SysLog;

/**
 * <p>
 * 日志表 服务类
 * </p>
 *
 * @author Lenovo
 * @since 2023-05-16
 */
public interface SysLogService extends IService<SysLog> {

    /**
     * 分页查询日志
     * @param page
     * @param sysLog
     * @return
     */
    Page getLogByPage(Page page, SysLogDTO sysLog);

    /**
     * 插入日志
     * @param sysLog 日志对象
     * @return true/false
     */
    Boolean saveLog(SysLogDTO sysLog);

}
