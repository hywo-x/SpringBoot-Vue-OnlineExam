package com.exam.mapper;

import com.exam.entity.Replay;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.StatementType;

import java.util.List;

@Mapper
public interface ReplayMapper {

    @Select("select messageId,replayId,replay,replayTime from replay")
    List<Replay> findAll();

    @Select("select messageId,replayId,replay,replayTime from replay where messageId = #{messageId}")
    List<Replay> findAllById(Integer messageId);

    @Select("select messageId,replayId,replay,replayTime from replay where messageId = #{messageId}")
    Replay findById(Integer messageId);

    @Delete("delete from replay where replayId = #{replayId}")
    int delete(Integer replayId);

    //@Update("update replay set title = #{title}, replay = #{replay}, replayTime = #{replayTime} where replayId = #{replayId}")
    @Update("{call prd_insert_update_reply(#{replayId, mode=IN, jdbcType=INTEGER}, #{messageId, mode=IN, jdbcType=INTEGER}, " +
            "#{replay, mode=IN, jdbcType=VARCHAR}, #{replayTime, mode=IN, jdbcType=VARCHAR})}")
    @Options(statementType = StatementType.CALLABLE)
    int update(Replay replay);

    //@Options(useGeneratedKeys = true,keyProperty = "replayId")
    //@Insert("insert into replay(messageId,replay,replayTime) values(#{messageId}, #{replay},#{replayTime})")
    @Options(useGeneratedKeys = true, keyProperty = "replayId", statementType = StatementType.CALLABLE)
    @Update("{call prd_insert_update_reply(#{replayId, mode=IN, jdbcType=INTEGER}, #{messageId, mode=IN, jdbcType=INTEGER}, " +
            "#{replay, mode=IN, jdbcType=VARCHAR}, #{replayTime, mode=IN, jdbcType=VARCHAR})}")//该过程有四个参数，所以不要删除！
    int add(Replay replay);
}