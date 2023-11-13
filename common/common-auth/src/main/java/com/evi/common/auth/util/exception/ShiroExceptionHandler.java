package com.evi.common.auth.util.exception;

import com.evi.common.core.util.R;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
@Slf4j
public class ShiroExceptionHandler {

    @ExceptionHandler(AuthenticationException.class)
    public R<?> handleAuthenticationException(AuthenticationException e){
        log.error("身份验证过程中的错误", e);
        return R.failed(-1,"身份验证错误，请联系管理员授权");
    }

    @ExceptionHandler({UnauthorizedException.class, AuthorizationException.class})
    public R<?> handleAuthorizationException(AuthorizationException e){
        log.error(e.getMessage(), e);
        return R.failed(510,"没有权限，请联系管理员授权");
    }

}
