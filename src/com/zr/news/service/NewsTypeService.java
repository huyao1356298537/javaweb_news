package com.zr.news.service;

import com.zr.news.dao.NewsTypeDao;
import com.zr.news.dao.daoimpl.NewsTypeDaoImpl;
import com.zr.news.entity.NewsType;

import java.util.List;

/**
 * @author : 张晋飞
 * date : 2019/3/11
 */
public class NewsTypeService {

    private NewsTypeDao dao =  new NewsTypeDaoImpl();

    public List<NewsType> findAll(){
        return  dao.findAll();
    }
}
