package com.exam.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.exam.entity.Teacher;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.StatementType;

import java.util.List;

@Mapper
public interface TeacherMapper {

    @Select("select * from teacher")
    IPage<Teacher>  findAll(Page page);

    @Select("select * from teacher")
    public List<Teacher> findAll();

    @Select("select * from teacher where teacherId = #{teacherId}")
    public Teacher findById(Integer teacherId);

    @Delete("delete from teacher where teacherId = #{teacherId}")
    public int deleteById(Integer teacherId);

    //@Update("update teacher set teacherName = #{teacherName},sex = #{sex}," +
    //"tel = #{tel}, email = #{email},pwd = #{pwd},cardId = #{cardId}," +
    //       "role = #{role},institute = #{institute},type = #{type} where teacherId = #{teacherId}")
    @Update("{call prd_insert_update_teacher(#{teacherId, mode=IN, jdbcType=INTEGER}, #{teacherName, mode=IN, jdbcType=VARCHAR}, #{sex, mode=IN, jdbcType=VARCHAR}," +
            "#{tel, mode=IN, jdbcType=VARCHAR}, #{email, mode=IN, jdbcType=VARCHAR}, #{pwd, mode=IN, jdbcType=VARCHAR}, #{cardId, mode=IN, jdbcType=VARCHAR}," +
            "#{role, mode=IN, jdbcType=VARCHAR}, #{type, mode=IN, jdbcType=VARCHAR}, #{institute, mode=IN, jdbcType=VARCHAR})}")
    @Options(statementType = StatementType.CALLABLE)
    public int update(Teacher teacher);

    //@Options(useGeneratedKeys = true,keyProperty = "teacherId")
    //@Insert("insert into teacher(teacherName,sex,tel,email,pwd,cardId,role,type,institute) " +
    //        "values(#{teacherName},#{sex},#{tel},#{email},#{pwd},#{cardId},#{role},#{type},#{institute})")
    @Options(useGeneratedKeys = true, keyProperty = "teacherId", statementType = StatementType.CALLABLE)
    @Insert("{call prd_insert_update_teacher(#{teacherId, mode=IN, jdbcType=INTEGER}, #{teacherName, mode=IN, jdbcType=VARCHAR}, #{sex, mode=IN, jdbcType=VARCHAR}," +
            "#{tel, mode=IN, jdbcType=VARCHAR}, #{email, mode=IN, jdbcType=VARCHAR}, #{pwd, mode=IN, jdbcType=VARCHAR}, #{cardId, mode=IN, jdbcType=VARCHAR}," +
            "#{role, mode=IN, jdbcType=VARCHAR}, #{type, mode=IN, jdbcType=VARCHAR}, #{institute, mode=IN, jdbcType=VARCHAR})}")
    public int add(Teacher teacher);
}