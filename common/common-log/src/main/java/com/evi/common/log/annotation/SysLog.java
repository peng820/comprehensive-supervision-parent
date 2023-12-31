

package com.evi.common.log.annotation;

import java.lang.annotation.*;

/**
 * @author admin
 * @date 2018/6/28 操作日志注解
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SysLog {

    /**
     * 描述
     *
     * @return {String}
     */
    String value() default "";

    /**
     * 操作类型
     * @return
     */
    String type() default "";
}
