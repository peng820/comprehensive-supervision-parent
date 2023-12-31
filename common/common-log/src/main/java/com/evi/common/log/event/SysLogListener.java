

package com.evi.common.log.event;

import com.evi.common.log.dto.SysLogDTO;
import com.evi.common.log.remote.LogRestApi;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.core.annotation.Order;
import org.springframework.scheduling.annotation.Async;

/**
 * @author admin 异步监听日志事件
 */
@Slf4j
@AllArgsConstructor
public class SysLogListener {

    private final LogRestApi logRestApi;

    @Async
    @Order
    @EventListener(SysLogEvent.class)
    public void saveSysLog(SysLogEvent event) {
        SysLogDTO sysLog = event.getSysLog();
        logRestApi.saveLog(sysLog);
    }

}
