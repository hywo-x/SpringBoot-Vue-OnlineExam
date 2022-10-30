package com.exam.serviceimpl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.exam.entity.Student;

import com.exam.entity.Student1;
import com.exam.util.Export;

import com.exam.exception.BasicException;
import com.exam.mapper.StudentMapper;
import com.exam.service.StudentService;
import com.exam.util.UploadUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.sql.SQLException;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentMapper;


    @Override
    public IPage<Student1> findAll(Page<Student1> page) {
        return studentMapper.findAll(page);
    }

    // @Override
    // public IPage<Student1> findAll() {
    //     return studentMapper.findAll();
    // }

    @Override
    public Student findById(Integer studentId) throws SQLException {
        return studentMapper.findById(studentId);
    }

    @Override
    public int deleteById(Integer studentId) {
        return studentMapper.deleteById(studentId);
    }

    @Override
    public int update(Student student) {
        return studentMapper.update(student);
    }

    @Override
    public int updatePwd(Student student) {
        return studentMapper.updatePwd(student);
    }

    @Override
    public int add(Student student) {
        return studentMapper.add(student);
    }

    @Override
    public int exportStudent() {
        try{
            List<Student1> student1List = studentMapper.findAll();
            Export export = new Export();
            export.exportStudent(student1List);
            return 1;
        } catch (Exception e){
            return 2;
        }
    }

    @Override
    public List<Student> findAllStudent(){
        return studentMapper.findAllStudent();
    }
    
    public String upload(MultipartFile file, String path, Integer studentId) {
        Student student = studentMapper.findById(studentId);
        if (student == null) {
            throw new BasicException(HttpStatus.BAD_REQUEST.value(), "参数错误，不存在！");
        }
        if (!StringUtils.isEmpty(student.getImage())) {
            UploadUtils.removeFile(student.getImage());
        }
        String fullPath  = UploadUtils.uploadPicture(file, path);
        student.setImage(fullPath);
        studentMapper.update(student);
        return fullPath;

    }
}
