package com.exam.serviceimpl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.exam.entity.Student;
import com.exam.entity.Student1;
import com.exam.mapper.StudentMapper;
import com.exam.service.StudentService;
import com.exam.util.Export;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
