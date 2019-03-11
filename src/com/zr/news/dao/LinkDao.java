package com.zr.news.dao;

import com.zr.news.entity.Link;

import java.util.List;

/**
 * @author : 张晋飞
 * date : 2019/3/11
 */
public interface LinkDao {


    public List<Link> findAll();
}
