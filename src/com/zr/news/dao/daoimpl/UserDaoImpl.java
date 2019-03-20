package com.zr.news.dao.daoimpl;

import com.zr.news.entity.User;
import com.zr.news.framework.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

/**
 * @author : 张晋飞
 * date : 2019/3/19
 */
public class UserDaoImpl {

    QueryRunner qr = new QueryRunner();
    public User queryOne(String username){

       String sql="select * from user where username = ?";
        try {
            User user = qr.query(JdbcUtils.getConnection(), sql, new BeanHandler<>(User.class),username);
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


}
