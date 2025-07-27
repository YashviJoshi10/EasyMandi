package com.dao;

//import java.sql.ResultSet;
//import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.OrderBean;

@Repository
public class OrderDao {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<OrderBean> getAllOrders() {
        String sql = "SELECT * FROM orders";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(OrderBean.class));
    }
    
    public void saveOrder(OrderBean order) {
        String sql = "INSERT INTO orders (vendor, material, quantity, status) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, order.getVendor(), order.getMaterial(), order.getQuantity(), order.getStatus());
    }
    
    public List<OrderBean> getOrdersByVendor(int vendorId) {
        String sql = "SELECT * FROM orders WHERE vendor = ?";
        return jdbcTemplate.query(sql, new Object[]{vendorId}, new BeanPropertyRowMapper<>(OrderBean.class));
    }
}
