package com.zr.news.dao.daoimpl;

import com.zr.news.dao.LinkDao;
import com.zr.news.entity.Link;
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
public class LinkDaoImpl implements LinkDao {

    @Override
    public List<Link> findAll() {
        List<Link> list = new ArrayList<>();

        String sql="select * from link order by link_order";
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){

                int linkId = rs.getInt("link_id");
                String linkName = rs.getString("link_name");
                String email = rs.getString("email");
                String linkUrl = rs.getString("link_url");
                int linkOrder = rs.getInt("link_order");
                Link link =  new Link(linkId,linkName,email,linkUrl,linkOrder);
                list.add(link);
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
