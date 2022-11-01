package com.exam.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
@Data
public class SlaveDataSourceConfig {

    @Value("${spring.datasource.dynamic.datasource.slave.url}")
    private String url;

    @Value("${spring.datasource.dynamic.datasource.slave.username}")
    private String username;

    @Value("${spring.datasource.dynamic.datasource.slave.password}")
    private String password;

    @Value("${spring.datasource.dynamic.datasource.slave.driver-class-name}")
    private String driverClassName;

}