package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.LoginBean;
import com.dao.SupplierDao;
import com.dao.VendorDao;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

	@Autowired
    VendorDao vendorDao;

    @Autowired
    SupplierDao supplierDao;
	
	@GetMapping("/")
	public String home() {
		return "login";
	}
	
	@PostMapping("checklogin")
	public String checkLogin(@Validated LoginBean bean, HttpSession session, Model model) {
		String role = bean.getRole();
		if (role.equalsIgnoreCase("vendor")) {
	        bean = vendorDao.validate(bean.getName(), bean.getPassword()); // name used instead of username
	        if (bean != null) {
	            session.setAttribute("user", bean);
	            session.setAttribute("vendorId", bean.getId());
	            return "VenderDashboard";
	        }
	    } else if (role.equalsIgnoreCase("supplier")) {
	        bean  = supplierDao.validate(bean.getName(), bean.getPassword());
	        if (bean != null) {
	            session.setAttribute("user", bean);
	            return "SupplierDashboard";
	        }
	    }
		model.addAttribute("error", "Invalid username or password");
	    return "login";
	}
	
	@PostMapping("/signup")
    public String signup(@Validated LoginBean bean, Model model) {
		
        if (!bean.isPasswordMatching()) {
            model.addAttribute("error", "Passwords do not match");
            return "login";
        }
        else {
        	model.addAttribute("error"," ");
        }

        if (bean.getRole().equalsIgnoreCase("vendor")) {
            vendorDao.save(bean);
        } else if (bean.getRole().equalsIgnoreCase("supplier")) {
            supplierDao.save(bean);
        }

        model.addAttribute("success", "Account created successfully. Please login.");
        return "login";
	}
}
