package com.exam.mapper;

import com.exam.entity.Admin;
import com.exam.entity.Student;
import com.exam.entity.Teacher;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.StatementType;

import java.util.List;

import static org.apache.ibatis.mapping.StatementType.*;

@Mapper
public interface LoginMapper {

    @Select("select * from admin where adminId = #{username} and pwd = #{password}")
    //@Select("{call prd_login_admin(#{username, mode=IN, jdbcType=INTEGER}, #{password, mode=IN, jdbcType=VARCHAR}, #{adminId, mode=OUT, jdbcType=INTEGER}," +
    //        "#{adminName, mode=OUT, jdbcType=VARCHAR}, #{sex, mode=OUT, jdbcType=VARCHAR}, #{tel, mode=OUT, jdbcType=VARCHAR}, #{email, mode=OUT, jdbcType=VARCHAR}," +
    //       "#{cardId, mode=OUT, jdbcType=VARCHAR}, #{role, mode=OUT, jdbcType=VARCHAR})}")
    //select语句改存储过程不太好改，这段不要使用
    public Admin adminLogin(Integer username, String password);

    @Select("select teacherId,teacherName,institute,sex,tel,email,cardId," +
            "type,role from teacher where teacherId = #{username} and pwd = #{password}")
    public Teacher teacherLogin(Integer username, String password);

    @Select("select studentId,studentName,grade,major,clazz,institute,tel," +
            "email,cardId,sex,role from student where studentId = #{username} and pwd = #{password}")
    public Student studentLogin(Integer username,String password);
}