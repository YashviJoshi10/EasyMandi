package com.dao;

import com.bean.FeedbackBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.util.List;

@Repository
public class FeedbackDao {

    @Autowired
    JdbcTemplate jdbc;

    public List<FeedbackBean> getAllFeedbackForVendor(int vendorId) {
        String sql = "SELECT * FROM vendor_feedback WHERE vendor_id = ?";
        return jdbc.query(sql, new Object[]{vendorId}, (ResultSet rs, int rowNum) -> {
            FeedbackBean bean = new FeedbackBean();
            bean.setId(rs.getInt("id"));
            bean.setVendorId(rs.getInt("vendor_id"));
            bean.setFeedback(rs.getString("feedback"));
            bean.setRating(rs.getInt("rating"));
            return bean;
        });
    }
}
