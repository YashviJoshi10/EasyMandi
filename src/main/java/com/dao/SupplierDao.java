package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DataAccessUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.LoginBean;

@Repository
public class SupplierDao {
    @Autowired JdbcTemplate jdbc;

    public LoginBean validate(String username, String password) {
        String sql = "SELECT * FROM suppliers WHERE name=? AND password=?";
        try {
            List<LoginBean> result = jdbc.query(sql, new Object[]{username, password}, (rs, rowNum) -> {
                LoginBean user = new LoginBean();
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setRole("supplier");
                return user;
            });

            return DataAccessUtils.singleResult(result);
        } catch (Exception e) {
            e.printStackTrace(); // For debugging
            return null;
        }
    }


    public void save(LoginBean supplier) {
        String sql = "INSERT INTO suppliers(password, name, email) VALUES (?, ?, ?)";
        jdbc.update(sql,supplier.getPassword(), supplier.getName(), supplier.getEmail());
    }
}

