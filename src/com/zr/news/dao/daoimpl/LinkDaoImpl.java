package com.zr.news.dao.daoimpl;

import com.zr.news.dao.LinkDao;
import com.zr.news.entity.Link;
import com.zr.news.entity.PageBean;
import com.zr.news.framework.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;

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

    private QueryRunner qr = new QueryRunner();
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

    @Override
    public int getConut() {

        String sql="select count(*) count from link ";
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                int count = rs.getInt("count");
                return count;
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
        return 0;
    }

    @Override
    public List<Link> queryPageList(PageBean pageBean) {
        List<Link> list = new ArrayList<>();
        String sql="select * from link order by link_order limit ?,?";
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1,pageBean.getIndex());
            ps.setInt(2,pageBean.getPageCount());
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

    @Override
    public int addLink(Link link) {
        String sql="insert into link(link_name,link_url,email,link_order) values (?,?,?,?)";
        try {
            int i = qr.update(JdbcUtils.getConnection(),sql,
                    link.getLinkName(), link.getLinkUrl(), link.getEmail(), link.getLinkOrder());
            return i;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int deleteLink(int linkId) {
        String sql="delete from link where link_id = ?";
        try {
            int i = qr.update(JdbcUtils.getConnection(),sql,linkId);
            return i;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int updateLink(Link link) {
        String sql="update link set link_name = ? ,link_url = ? ,email = ? ,link_order = ? where link_id=?";
        try {
            int i = qr.update(JdbcUtils.getConnection(),sql,
                    link.getLinkName(), link.getLinkUrl(), link.getEmail(), link.getLinkOrder(),link.getLinkId());
            return i;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public Link queryOne(int linkId) {

        String sql="select * from link  where link_id = ?";
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            Connection connection = JdbcUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1,linkId);
            rs = ps.executeQuery();
            while (rs.next()){
                String linkName = rs.getString("link_name");
                String email = rs.getString("email");
                String linkUrl = rs.getString("link_url");
                int linkOrder = rs.getInt("link_order");
                Link link =  new Link(linkId,linkName,email,linkUrl,linkOrder);
                return link;
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
        return null;
    }
}
