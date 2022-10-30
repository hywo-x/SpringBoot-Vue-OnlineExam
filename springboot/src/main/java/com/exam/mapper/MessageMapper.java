package com.exam.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.exam.entity.Message;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.StatementType;

import java.util.List;

@Mapper
public interface MessageMapper {
    @Select("select id,id as temp_id,title,content,time from message order by id desc")
    @Results({
            @Result(property = "replays", column = "temp_id",many = @Many(select = "com.exam.mapper.ReplayMapper.findAllById"))
    })
    IPage<Message> findAll(Page page);

    @Select("select id,title,content,time from message where id = #{id}")
    @Results({
            @Result(property = "replays", column = "id",many = @Many(select = "com.exam.mapper.ReplayMapper.findAllById"))
    })
    Message findById(Integer id);

    @Delete("delete from message where id = #{id}")
    int delete(Integer id);

    //@Update("update message set title = #{title}, content = #{content}, time = #{time} where " +
    //       "id = #{id}")
    @Update("{call prd_insert_update_message(#{id, mode=IN, jdbcType=INTEGER}, #{title, mode=IN, jdbcType=VARCHAR}, " +
            "#{content, mode=IN, jdbcType=VARCHAR}, #{time, mode=IN, jdbcType=VARCHAR})}")
    @Options(statementType = StatementType.CALLABLE)
    int update(Message message);

    //@Options(useGeneratedKeys = true,keyProperty = "id")
    //@Insert("insert into message(title, content, time) values(#{title},#{content},#{time})")
    @Insert("{call prd_insert_update_message(#{id, mode=IN, jdbcType=INTEGER}, #{title, mode=IN, jdbcType=VARCHAR}, " +
            "#{content, mode=IN, jdbcType=VARCHAR}, #{time, mode=IN, jdbcType=VARCHAR})}")
    @Options(useGeneratedKeys = true, keyProperty = "id", statementType = StatementType.CALLABLE)
    int add(Message message);
}