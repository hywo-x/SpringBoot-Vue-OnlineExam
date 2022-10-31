package com.exam.config;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;
import org.springframework.lang.Nullable;

public class MultiRouteDataSource extends AbstractRoutingDataSource {

    @Nullable
    @Override
    protected Object determineCurrentLookupKey() {
        // 通过绑定线程的数据源上下文实现多数据源的动态切换
        return DataSourceContext.getDateSource();
    }
}
