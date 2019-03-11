package com.zr.news.service;

import com.zr.news.dao.LinkDao;
import com.zr.news.dao.daoimpl.LinkDaoImpl;
import com.zr.news.entity.Link;

import java.util.List;

/**
 * @author : 张晋飞
 * date : 2019/3/11
 */
public class LinkService {

    private LinkDao dao = new LinkDaoImpl();

    public List<Link> findAll(){
        return  dao.findAll();
    }
}
