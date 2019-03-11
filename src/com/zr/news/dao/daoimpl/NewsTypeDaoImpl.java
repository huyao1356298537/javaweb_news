package com.zr.news.dao.daoimpl;

import com.zr.news.dao.NewsTypeDao;
import com.zr.news.entity.NewsType;
import com.zr.news.framework.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author : 张晋飞
 * date : 2019/3/11
 */
public class NewsTypeDaoImpl implements NewsTypeDao {
    @Override
    public List<NewsType> findAll() {
        List<NewsType> list = new ArrayList<>();

        String sql="select * from news_type";
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                NewsType newsType =  new NewsType();
                int typeId = rs.getInt("type_id");
                String typeName = rs.getString("type_name");
                newsType.setTypeId(typeId);
                newsType.setTypeName(typeName);
                list.add(newsType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs!=null)
                   rs.close();
                if(ps!=null)
                    ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JdbcUtils.close();
        }
        return list;
    }
}
