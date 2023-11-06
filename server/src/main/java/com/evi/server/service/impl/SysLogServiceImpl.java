package com.evi.server.service.impl;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.evi.common.log.dto.SysLogDTO;
import com.evi.server.entity.SysLog;
import com.evi.server.mapper.SysLogMapper;
import com.evi.server.service.SysLogService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 日志表 服务实现类
 * </p>
 *
 * @author Lenovo
 * @since 2023-05-16
 */
@Service
public class SysLogServiceImpl extends ServiceImpl<SysLogMapper, SysLog> implements SysLogService {
    @Override
    public Page getLogByPage(Page page, SysLogDTO sysLog) {

        LambdaQueryWrapper<SysLog> wrapper = Wrappers.lambdaQuery();
        if (StrUtil.isNotBlank(sysLog.getLogType())) {
            wrapper.eq(SysLog::getLogType, sysLog.getLogType());
        }

        if (ArrayUtil.isNotEmpty(sysLog.getCreateTime())) {
            wrapper.ge(SysLog::getCreateTime, sysLog.getCreateTime()[0]).le(SysLog::getCreateTime,
                    sysLog.getCreateTime()[1]);
        }

        return baseMapper.selectPage(page, wrapper);
    }

    /**
     * 插入日志
     *
     * @param sysLog 日志对象
     * @return true/false
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean saveLog(SysLogDTO sysLog) {
        SysLog log = new SysLog();
        BeanUtils.copyProperties(sysLog, log, "createTime");
        baseMapper.insert(log);
        return Boolean.TRUE;
    }
}
