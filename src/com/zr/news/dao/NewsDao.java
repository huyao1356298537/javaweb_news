package com.zr.news.dao;

import com.zr.news.entity.News;

import java.util.List;

/**
 * @author : 张晋飞
 * date : 2019/3/11
 */
public interface NewsDao {

    public List<News> findAll();

    public List<News> findImageNews();

    public News findHeadNews();

    public List<News> findNewNews();

    public List<News> findHotNews();

    public List<News> findNewsByType(int typeId);

}
