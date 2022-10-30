package com.exam.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.exam.entity.MultiQuestion;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.StatementType;

import java.util.List;

//选择题
@Mapper
public interface MultiQuestionMapper {
    /**
     * select * from multiquestions where questionId in (
     * 	select questionId from papermanage where questionType = 1 and paperId = 1001
     * )
     */
    @Select("select * from multi_question where questionId in (select questionId from paper_manage where questionType = 1 and paperId = #{paperId})")
    List<MultiQuestion> findByIdAndType(Integer PaperId);

    @Select("select * from multi_question")
    IPage<MultiQuestion> findAll(Page page);

    /**
     * 查询最后一条记录的questionId
     * @return MultiQuestion
     */
    @Select("select questionId from multi_question order by questionId desc limit 1")
    MultiQuestion findOnlyQuestionId();

    //@Options(useGeneratedKeys = true,keyProperty = "questionId")
    //@Insert("insert into multi_question(subject,question,answerA,answerB,answerC,answerD,rightAnswer,analysis,section,level) " +
    //        "values(#{subject},#{question},#{answerA},#{answerB},#{answerC},#{answerD},#{rightAnswer},#{analysis},#{section},#{level})")
    int type = 3;
    @Options(useGeneratedKeys = true, keyProperty = "questionId", statementType = StatementType.CALLABLE)
    @Insert("{call prd_add_question(#{type, mode=IN, jdbcType=INTEGER}, #{subject, mode=IN, jdbcType=VARCHAR}, #{question, mode=IN, jdbcType=VARCHAR}, #{analysis, mode=IN, jdbcType=VARCHAR}, " +
            "#{level, mode=IN, jdbcType=VARCHAR}, #{section, mode=IN, jdbcType=VARCHAR}, #{rightAnswer, mode=IN, jdbcType=VARCHAR}, #{answerA, mode=IN, jdbcType=VARCHAR}, " +
            "#{answerB, mode=IN, jdbcType=VARCHAR}, #{answerC, mode=IN, jdbcType=VARCHAR}, #{answerD, mode=IN, jdbcType=VARCHAR})}")
    int add(MultiQuestion multiQuestion);

    @Select("select questionId from multi_question  where subject =#{subject} order by rand() desc limit #{pageNo}")
    List<Integer> findBySubject(String subject,Integer pageNo);


}