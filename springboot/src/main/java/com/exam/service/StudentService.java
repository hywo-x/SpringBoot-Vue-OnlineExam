package com.exam.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.exam.entity.Student;

import com.exam.entity.Student1;

import org.springframework.web.multipart.MultipartFile;


import java.sql.SQLException;
import java.util.List;

public interface StudentService {

    IPage<Student1> findAll(Page<Student1> page);

    // IPage<Student1> findAll();

    Student findById(Integer studentId) throws SQLException;

    int deleteById(Integer studentId);

    int update(Student student);

    int updatePwd(Student student);
    int add(Student student);


    int exportStudent();

    List<Student> findAllStudent();

    String upload(MultipartFile file, String path, Integer studentId);

}
