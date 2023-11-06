  

package com.evi.common.log.aspect;

import com.evi.common.log.annotation.SysLog;
import com.evi.common.log.dto.SysLogDTO;
import com.evi.common.log.event.SysLogEvent;
import com.evi.common.log.util.LogTypeEnum;
import com.evi.common.log.util.SysLogUtils;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.context.ApplicationEventPublisher;

/**
 * 操作日志使用spring event异步入库
 *
 * @author L.cm
 */
@Slf4j
@Aspect
@RequiredArgsConstructor
public class SysLogAspect {

	private final ApplicationEventPublisher publisher;

	@SneakyThrows
	@Around("@annotation(sysLog)")
	public Object around(ProceedingJoinPoint point, SysLog sysLog) {
		String strClassName = point.getTarget().getClass().getName();
		String strMethodName = point.getSignature().getName();
		log.debug("[类名]:{},[方法]:{}", strClassName, strMethodName);

		SysLogDTO logDTO = SysLogUtils.getSysLog();
		logDTO.setTitle(sysLog.value());
		// 发送异步日志事件
		Long startTime = System.currentTimeMillis();
		Object obj;
		try {
			obj = point.proceed();
		}
		catch (Exception e) {
			logDTO.setLogType(LogTypeEnum.ERROR.getType());
			logDTO.setException(e.getMessage());
			throw e;
		}
		finally {
			Long endTime = System.currentTimeMillis();
			logDTO.setTime(endTime - startTime);
//			logDTO.setTenantId(Long.parseLong(tenantKeyStrResolver.key()));
			publisher.publishEvent(new SysLogEvent(logDTO));
		}
		return obj;
	}

}
