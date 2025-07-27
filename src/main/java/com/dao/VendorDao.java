package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DataAccessUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.LoginBean;

@Repository
public class VendorDao {
    @Autowired JdbcTemplate jdbc;

    public LoginBean validate(String username, String password) {
        String sql = "SELECT * FROM vendors WHERE name=? AND password=?";
        try {
            List<LoginBean> result = jdbc.query(sql, new Object[]{username, password}, (rs, rowNum) -> {
                LoginBean user = new LoginBean();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setRole("vender");
                return user;
            });

            return DataAccessUtils.singleResult(result);
        } catch (Exception e) {
            e.printStackTrace(); // For debugging
            return null;
        }
    }


    public void save(LoginBean vendor) {
        String sql = "INSERT INTO vendors(password, name, email) VALUES (?, ?, ?)";
        jdbc.update(sql,vendor.getPassword(), vendor.getName(), vendor.getEmail());
    }
}

