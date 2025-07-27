package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.CartBean;

@Repository
public class CartDao {

    @Autowired
    JdbcTemplate jdbc;

    public void addToCart(CartBean item) {
        String sql = "INSERT INTO cart (vendor_id, item_name, unit, price, quantity) VALUES (?, ?, ?, ?, ?)";
        jdbc.update(sql, item.getVendorId(), item.getItemName(), item.getUnit(), item.getPrice(), item.getQuantity());
    }

    public List<CartBean> getCartItems(int vendorId) {
        String sql = "SELECT * FROM cart WHERE vendor_id = ?";  // Make sure this column matches DB
        return jdbc.query(sql, new Object[]{vendorId}, new BeanPropertyRowMapper<>(CartBean.class));
    }


    public void deleteItem(int id) {
        String sql = "DELETE FROM cart WHERE id = ?";
        jdbc.update(sql, id);
    }

    public void clearCart(int vendorId) {
        String sql = "DELETE FROM cart WHERE vendor_id = ?";
        jdbc.update(sql, vendorId);
    }
}
