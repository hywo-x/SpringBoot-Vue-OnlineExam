package com.exam.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Target;

/**
 * 登录注解
 */
@Target({ElementType.METHOD, ElementType.TYPE})
public @interface CheckLogin {
}
