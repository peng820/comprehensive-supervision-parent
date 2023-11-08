package com.evi.common.log.remote;

import com.evi.common.log.dto.SysLogDTO;

public interface LogRestApi {

    /**
     * 保存日志
     * @param logDTO
     */
    void saveLog(SysLogDTO logDTO);
}
