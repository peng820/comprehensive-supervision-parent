  

package com.evi.common.core.util;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 响应信息主体
 *
 * @param <T>
 * @author admin
 */
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@ApiModel(value = "响应信息主体")
public class R<T> implements Serializable {

	private static final long serialVersionUID = 1L;

	//正常
	public static int OK_CODE = 0;

	//错误
	public static int FAILED_CODE = 1;

	//未登录
	public static int NOT_LOGIN = 2;

	//登录已过期
	public static int PAST_DUE = 3;

	//验证码过期
	public static int VERIFICATION_CODE = 4;

	//无效的token
	public static int INVALID_TOKEN = 5;

	//未授权的接口
	public static int UNAUTHORIZATION = 6;

	@Getter
	@Setter
	@ApiModelProperty(value = "返回标记：成功标记=0，失败标记=1")
	private int code;

	@Getter
	@Setter
	@ApiModelProperty(value = "返回信息")
	private String msg;

	@Getter
	@Setter
	@ApiModelProperty(value = "数据")
	private T data;

	public static <T> R<T> ok() {
		return restResult(null, OK_CODE, null);
	}

	public static <T> R<T> ok(T data) {
		return restResult(data, OK_CODE, null);
	}

	public static <T> R<T> ok(T data, String msg) {
		return restResult(data, OK_CODE, msg);
	}

	public static <T> R<T> failed() {
		return restResult(null, FAILED_CODE, null);
	}

	public static <T> R<T> failed(String msg) {
		return restResult(null, FAILED_CODE, msg);
	}

	public static <T> R<T> failed(T data) {
		return restResult(data, FAILED_CODE, null);
	}

	public static <T> R<T> failed(T data, String msg) {
		return restResult(data, FAILED_CODE, msg);
	}

	public static <T> R<T> failed(T data, int code, String msg) {
		return restResult(data, code, msg);
	}

	private static <T> R<T> restResult(T data, int code, String msg) {
		R<T> apiResult = new R<>();
		apiResult.setCode(code);
		apiResult.setData(data);
		apiResult.setMsg(msg);
		return apiResult;
	}

}
