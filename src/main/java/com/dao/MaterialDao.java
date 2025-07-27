package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.MaterialBean;

@Repository
public class MaterialDao {
	@Autowired JdbcTemplate jdbc;

    public void saveMaterial(MaterialBean material) {
        String sql = "INSERT INTO raw_materials(materialname, materialtype, materialquantity, materialprice) VALUES (?, ?, ?, ?)";
        jdbc.update(sql,material.getMaterialname(), material.getMaterialtype(), material.getMaterialquantity(), material.getMaterialprice());
    }
    
    public List<MaterialBean> getAllMaterials() {
    	String sql = "SELECT materialname, materialtype, materialquantity, materialprice FROM raw_materials";
        return jdbc.query(sql, new BeanPropertyRowMapper<>(MaterialBean.class));
    }
}
