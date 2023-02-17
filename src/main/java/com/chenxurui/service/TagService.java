package com.chenxurui.service;

import com.chenxurui.pojo.Tag;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TagService {

    public void saveTag(Tag tag);

    public Tag getTagById(@Param("id") Long id);

    public Tag getTagByName(@Param("name") String name);

    public List<Tag> getAllTag();

    public void updateTag(Tag tag);

    public void deleteTag(Long id);

    public List<Tag> getAllTag(int pageNum);

    public int getAllTagNum();
}
