package com.chenxurui.service.Impl;

import com.chenxurui.dao.TagMapper;
import com.chenxurui.pojo.Blog;
import com.chenxurui.pojo.Tag;
import com.chenxurui.service.TagService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TagServiceImpl implements TagService {

    @Autowired
    private TagMapper tagMapper;

    @Transactional
    @Override
    public void saveTag(Tag tag) {
        tagMapper.saveTag(tag);
    }

    @Override
    public Tag getTagById(Long id) {
        return tagMapper.getTagById(id);
    }

    @Override
    public Tag getTagByName(String name) {
        return tagMapper.getTagByName(name);
    }

    @Override
    public List<Tag> getAllTag() {
        return tagMapper.getAllTag();
    }

    @Override
    public void updateTag(Tag tag) {
        tagMapper.updateTag(tag);
    }

    @Override
    public void deleteTag(Long id) {
        tagMapper.deleteTag(id);
    }

    @Override
    public List<Tag> getAllTag(int pageNum) {

        PageHelper.startPage(pageNum, 9);
        return tagMapper.getAllTag();
    }

    @Override
    public int getAllTagNum() {
        return tagMapper.getAllTagNum();
    }
}
