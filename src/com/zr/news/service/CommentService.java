package com.zr.news.service;

import com.zr.news.dao.CommentDao;
import com.zr.news.dao.daoimpl.CommentDaoImpl;
import com.zr.news.entity.Comment;

/**
 * @author : 张晋飞
 * date : 2019/3/19
 */
public class CommentService {

    private CommentDao dao =new CommentDaoImpl();
    public int addComment(Comment comment){
        return dao.addComment(comment);

    }
}
