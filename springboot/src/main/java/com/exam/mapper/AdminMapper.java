package com.exam.mapper;

import com.exam.entity.Admin;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.StatementType;

import java.util.List;

@Mapper
public interface AdminMapper {

    @Select("select adminName,sex,tel,email,cardId,role from admin")
    public List<Admin> findAll();

    @Select("select adminName,sex,tel,email,cardId,role from admin where adminId = #{adminId}")
    public Admin findById(Integer adminId);

    //@Delete("delete from admin where adminId = #{adminId}")
    @Delete("{call prd_admin_delete(#{adminId, mode=IN, jdbcType=INTEGER})}")
    @Options(statementType = StatementType.CALLABLE)
    public int deleteById(int adminId);

    //@Update("update admin set adminName = #{adminName},sex = #{sex}," +
    //        "tel = #{tel}, email = #{email},pwd = #{pwd},cardId = #{cardId},role = #{role} where adminId = #{adminId}")
    @Update("{call prd_insert_update_admin(#{adminId, mode=IN, jdbcType=INTEGER}, #{adminName, mode=IN, jdbcType=VARCHAR}, #{sex, mode=IN, jdbcType=VARCHAR}," +
            "#{tel, mode=IN, jdbcType=VARCHAR}, #{email, mode=IN, jdbcType=VARCHAR}, #{pwd, mode=IN, jdbcType=VARCHAR}, #{cardId, mode=IN, jdbcType=VARCHAR}, #{role, mode=IN, jdbcType=VARCHAR})}")
    @Options(statementType = StatementType.CALLABLE)
    public int update(Admin admin);
    //@Options(useGeneratedKeys = true,keyProperty = "adminId")
    //@Insert("insert into admin(adminName,sex,tel,email,pwd,cardId,role) " +
    //        "values(#{adminName},#{sex},#{tel},#{email},#{pwd},#{cardId},#{role})")
    @Options(useGeneratedKeys = true, keyProperty = "adminId", statementType = StatementType.CALLABLE)
    @Insert("{call prd_insert_update_admin(#{adminId, mode=IN, jdbcType=INTEGER}, #{adminName, mode=IN, jdbcType=VARCHAR}, #{sex, mode=IN, jdbcType=VARCHAR}," +
            "#{tel, mode=IN, jdbcType=VARCHAR}, #{email, mode=IN, jdbcType=VARCHAR}, #{pwd, mode=IN, jdbcType=VARCHAR}, #{cardId, mode=IN, jdbcType=VARCHAR}, #{role, mode=IN, jdbcType=VARCHAR})}")
    public int add(Admin admin);
}