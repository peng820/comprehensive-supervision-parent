  

package com.evi.common.log;

import com.evi.common.log.aspect.SysLogAspect;
import com.evi.common.log.event.SysLogListener;
import com.evi.common.log.remote.RemoteLogService;
import lombok.AllArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.scheduling.annotation.EnableAsync;

import javax.annotation.Resource;

/**
 * 日志自动配置
 */
@EnableAsync
@Configuration
@AllArgsConstructor
@ConditionalOnWebApplication
public class LogAutoConfiguration {

	@Resource
	private ConfigurableEnvironment environment;

	@Bean
	public RemoteLogService remoteLogService(){
		return new RemoteLogService(environment);
	}

	@Bean
	public SysLogListener sysLogListener() {
		return new SysLogListener(remoteLogService());
	}

	@Bean
	public SysLogAspect sysLogAspect(ApplicationEventPublisher publisher) {
		return new SysLogAspect(publisher);
	}

}
