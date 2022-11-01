package com.exam.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.DependsOn;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

@Component
public class DateSourceComponent {

    @Resource
    private MasterDataSourceConfig masterDataSourceConfig;

    @Resource
    private SlaveDataSourceConfig slaveDataSourceConfig;

    @Bean(name = "master")
    public DataSource masterDataSource() {
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setUrl(masterDataSourceConfig.getUrl());
        dataSource.setUsername(masterDataSourceConfig.getUsername());
        dataSource.setPassword(masterDataSourceConfig.getPassword());
        dataSource.setDriverClassName(masterDataSourceConfig.getDriverClassName());
        return dataSource;
    }

    @Bean(name = "slave")
    public DataSource slaveDataSource() {
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setUrl(slaveDataSourceConfig.getUrl());
        dataSource.setUsername(slaveDataSourceConfig.getUsername());
        dataSource.setPassword(slaveDataSourceConfig.getPassword());
        dataSource.setDriverClassName(slaveDataSourceConfig.getDriverClassName());
        return dataSource;
    }

    @Autowired
    @Qualifier("master")
    private DataSource masterDateSource;


    @Autowired
    @Qualifier("slave")
    private DataSource slaveDateSource;


    @Primary
    @DependsOn({"master", "slave"}) // 解决数据库循环和依赖的问题
    @Bean(name = "multiDataSource")
    public MultiRouteDataSource exampleRouteDateSource() {
        MultiRouteDataSource multiRouteDataSource = new MultiRouteDataSource();
        Map<Object, Object> targetDateSource = new HashMap<>();
        targetDateSource.put("master", masterDateSource);
        targetDateSource.put("slave", slaveDateSource);
        multiRouteDataSource.setTargetDataSources(targetDateSource);
        multiRouteDataSource.setDefaultTargetDataSource(slaveDateSource);
        return multiRouteDataSource;
    }

}
