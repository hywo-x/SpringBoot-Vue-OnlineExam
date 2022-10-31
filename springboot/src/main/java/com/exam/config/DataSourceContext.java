package com.exam.config;

/**
 * 数据源上下文
 */
public class DataSourceContext {

    // 用于记录每个线程需要使用的数据源关键字，并提供切换，读取，清除数据源配置信息的方法
    private static final ThreadLocal<String> contextHolder = new ThreadLocal<>();

    public static void setDateSource(String value) {
        contextHolder.set(value);
    }

    public static String getDateSource() {
        return contextHolder.get();
    }

    public static void clearDateSource() {
        contextHolder.remove();
    }
}
