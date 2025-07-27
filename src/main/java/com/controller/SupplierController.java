package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bean.FeedbackBean;
import com.bean.LoginBean;
import com.bean.MaterialBean;
import com.bean.OrderBean;
import com.dao.FeedbackDao;
import com.dao.MaterialDao;
import com.dao.OrderDao;

import jakarta.servlet.http.HttpSession;

@Controller
public class SupplierController {
	@Autowired
	MaterialDao materialDao;
	
	@Autowired
    OrderDao orderDao;
	
	@Autowired
	FeedbackDao feedbackDao;
	
	@GetMapping("supplier/dashboard")
	public String dashboard() {
		return "SupplierDashboard";
	}
	
	@GetMapping("supplier/ManageMaterials")
	public String supplierDashboard() {
		return "ManageMaterials";
	}
	
	@PostMapping("addmaterial")
	public String addMaterials(@ModelAttribute MaterialBean bean) {
		System.out.println(">>> Material submitted: " + bean.getMaterialname());
		materialDao.saveMaterial(bean);
		return "ManageMaterials";
	}

	
	@GetMapping("supplier/ViewOrders")
	public String viewOrders(Model model) {
	    List<OrderBean> orders = orderDao.getAllOrders();
	    model.addAttribute("orders", orders);
	    return "ViewOrder"; 
	}
	
	@GetMapping("supplier/feedback")
	public String viewFeedback(HttpSession session, Model model) {
	    LoginBean vendor = (LoginBean) session.getAttribute("user");
	    if (vendor == null) return "redirect:/"; // session expired

	    List<FeedbackBean> feedbackList = feedbackDao.getAllFeedbackForVendor(vendor.getId());
	    model.addAttribute("feedbackList", feedbackList);

	    return "Feedback"; // JSP file
	}
}
