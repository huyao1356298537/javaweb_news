package com.zr.news.service;

import com.zr.news.dao.NewsTypeDao;
import com.zr.news.dao.daoimpl.NewsTypeDaoImpl;
import com.zr.news.entity.NewsType;
import com.zr.news.entity.PageBean;

import java.util.List;

/**
 * @author : huyao
 * date : 2019/3/11
 */
public class NewsTypeService {

    private NewsTypeDao dao =  new NewsTypeDaoImpl();

    public List<NewsType> findAll(){
        return  dao.findAll();
    }
    public List<NewsType> queryByPage(PageBean pageBean){
        return  dao.queryByPage(pageBean);
    }
    public NewsType findTypeById(int typeId){
        return  dao.findTypeById(typeId);
    }
}
