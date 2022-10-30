package com.exam.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.exam.entity.ExamManage;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.StatementType;

import java.util.List;

@Mapper
public interface ExamManageMapper {
    @Select("select * from exam_manage")
    List<ExamManage> findAll();

    @Select("select * from exam_manage")
    IPage<ExamManage> findAll(Page page);

    @Select("select * from exam_manage where examCode = #{examCode}")
    ExamManage findById(Integer examCode);

    @Delete("{call prd_delete_exam(#{examCode, mode=IN, jdbcType=INTEGER})}")
    @Options(statementType = StatementType.CALLABLE)
    int delete(Integer examCode);

    //@Update("update exam_manage set description = #{description},source = #{source},paperId = #{paperId}," +
    //        "examDate = #{examDate},totalTime = #{totalTime},grade = #{grade},term = #{term}," +
    //       "major = #{major},institute = #{institute},totalScore = #{totalScore}," +
    //        "type = #{type},tips = #{tips} where examCode = #{examCode}")
    @Update("{call prd_insert_update_exam(#{examCode, mode=IN, jdbcType=INTEGER},#{description, mode=IN, jdbcType=VARCHAR}, #{source, mode=IN, jdbcType=VARCHAR}, #{paperId, mode=IN, jdbcType=INTEGER}," +
            "#{examDate, mode=IN, jdbcType=VARCHAR}, #{totalTime, mode=IN, jdbcType=VARCHAR}, #{grade, mode=IN, jdbcType=VARCHAR}," +
            "#{term, mode=IN, jdbcType=VARCHAR}, #{major, mode=IN, jdbcType=VARCHAR}, #{institute, mode=IN, jdbcType=VARCHAR}, #{totalScore, mode=IN, jdbcType=VARCHAR}," +
            "#{type, mode=IN, jdbcType=VARCHAR}, #{tips, mode=IN, jdbcType=VARCHAR})}")
    @Options(statementType = StatementType.CALLABLE)
    int update(ExamManage exammanage);

    //@Options(useGeneratedKeys = true,keyProperty = "examCode")
    //@Insert("insert into exam_manage(description,source,paperId,examDate,totalTime,grade,term,major,institute,totalScore,type,tips)" +
    //        " values(#{description},#{source},#{paperId},#{examDate},#{totalTime},#{grade},#{term},#{major},#{institute},#{totalScore},#{type},#{tips})")
    @Options(useGeneratedKeys = true, keyProperty = "examCode",statementType = StatementType.CALLABLE)
    @Insert("{call prd_insert_update_exam(#{examCode, mode=IN, jdbcType=INTEGER},#{description, mode=IN, jdbcType=VARCHAR},#{source, mode=IN, jdbcType=VARCHAR}, #{paperId, mode=IN, jdbcType=INTEGER}," +
            "#{examDate, mode=IN, jdbcType=VARCHAR}, #{totalTime, mode=IN, jdbcType=VARCHAR}, #{grade, mode=IN, jdbcType=VARCHAR}," +
            "#{term, mode=IN, jdbcType=VARCHAR}, #{major, mode=IN, jdbcType=VARCHAR}, #{institute, mode=IN, jdbcType=VARCHAR}, #{totalScore, mode=IN, jdbcType=VARCHAR}," +
            "#{type, mode=IN, jdbcType=VARCHAR}, #{tips, mode=IN, jdbcType=VARCHAR})}")
    int add(ExamManage exammanage);

    /**
     * 查询最后一条记录的paperId,返回给前端达到自增效果
     * @return paperId
     */
    @Select("select paperId from exam_manage order by paperId desc limit 1")
    ExamManage findOnlyPaperId();
}