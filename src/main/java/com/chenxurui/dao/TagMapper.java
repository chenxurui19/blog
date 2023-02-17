package com.chenxurui.dao;

import com.chenxurui.pojo.Tag;
import com.chenxurui.pojo.Type;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TagMapper {

    public void saveTag(Tag tag);

    public Tag getTagById(@Param("id") Long id);

    public Tag getTagByName(@Param("name") String name);

    public List<Tag> getAllTag();

    public void updateTag(Tag tag);

    public void deleteTag(Long id);

    public int getAllTagNum();
}
