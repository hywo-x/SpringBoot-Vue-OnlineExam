package com.exam.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.exam.entity.JudgeQuestion;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.StatementType;

import java.util.List;

//判断题

@Mapper
public interface JudgeQuestionMapper {

    @Select("select * from judge_question where questionId in (select questionId from paper_manage where questionType = 3 and paperId = #{paperId})")
    List<JudgeQuestion> findByIdAndType(Integer paperId);

    @Select("select * from judge_question")
    IPage<JudgeQuestion> findAll(Page page);

    /**
     * 查询最后一条记录的questionId
     * @return JudgeQuestion
     */
    @Select("select questionId from judge_question order by questionId desc limit 1")
    JudgeQuestion findOnlyQuestionId();

    //@Insert("insert into judge_question(subject,question,answer,analysis,level,section) values " +
    //        "(#{subject},#{question},#{answer},#{analysis},#{level},#{section})")
    @Options(useGeneratedKeys = true, keyProperty = "questionId", statementType = StatementType.CALLABLE)
    @Insert("{call prd_add_question(#{type, mode=IN, jdbcType=INTEGER}, #{subject, mode=IN, jdbcType=VARCHAR}, #{question, mode=IN, jdbcType=VARCHAR}, #{analysis, mode=IN, jdbcType=VARCHAR}, " +
            "#{level, mode=IN, jdbcType=VARCHAR}, #{section, mode=IN, jdbcType=VARCHAR}, #{answer, mode=IN, jdbcType=VARCHAR}, #{answer, mode=IN, jdbcType=VARCHAR}, " +
            "#{answer, mode=IN, jdbcType=VARCHAR}, #{answer, mode=IN, jdbcType=VARCHAR}, #{answer, mode=IN, jdbcType=VARCHAR})}")
    int add(JudgeQuestion judgeQuestion);

    @Select("select questionId from judge_question  where subject=#{subject}  order by rand() desc limit #{pageNo}")
    List<Integer> findBySubject(String subject,Integer pageNo);
}