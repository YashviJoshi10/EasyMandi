package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.CartBean;
import com.bean.LoginBean;
import com.bean.MaterialBean;
import com.bean.OrderBean;
import com.dao.CartDao;
import com.dao.MaterialDao;
import com.dao.OrderDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class VenderController {
	
	@Autowired
    private MaterialDao materialDao;

    @Autowired
    private OrderDao orderDao;

    @Autowired
    CartDao cartDao;
	
	@GetMapping("vender/dashboard")
	public String vendorDashboard() {
		return "VenderDashboard";
	}
	
	@GetMapping("/vender/showmaterials")
	public String showMaterials(HttpServletRequest request) {
		List<MaterialBean> materiallist = materialDao.getAllMaterials();
	    request.setAttribute("materials", materiallist);
		return "ShowMaterials";
	}
	
	@GetMapping("/vender/cart")
    public String viewCart(HttpSession session, Model model) {
		LoginBean user = (LoginBean) session.getAttribute("user");
		if (user == null) {
			return "redirect:/"; 
		}
		int vendorId = user.getId();
		List<CartBean> cartItems = cartDao.getCartItems(vendorId);
		model.addAttribute("cartItems", cartItems);
		return "Cart";

    }

    @PostMapping("/vender/addtocart")
    public String addToCart(@ModelAttribute CartBean item, HttpSession session) {
        LoginBean user = (LoginBean) session.getAttribute("user");
        if (user == null) {
            return "redirect:/"; // or wherever your login page is
        }
        item.setVendorId(user.getId());
//        System.out.println("Adding: " + item.getItemName() + ", " + item.getUnit() + ", " + item.getPrice() + ", " + item.getQuantity());
        cartDao.addToCart(item);
        return "redirect:/vender/showmaterials";
    }

    @GetMapping("/vender/deleteCartItem/{id}")
    public String deleteItem(@PathVariable int id) {
        cartDao.deleteItem(id);
        return "redirect:/vender/cart";
    }

    @PostMapping("/vender/placeOrder")
    public String placeOrder(HttpSession session) {
        LoginBean user = (LoginBean) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login"; // or home page
        }

        int vendorId = user.getId();  // Now correctly fetches vendor ID
        List<CartBean> cartItems = cartDao.getCartItems(vendorId);

        for (CartBean item : cartItems) {
            OrderBean order = new OrderBean();
            order.setVendor(vendorId);
            order.setMaterial(item.getItemName());
            order.setQuantity(item.getQuantity());
            order.setStatus("Pending");
            orderDao.saveOrder(order);
        }

        cartDao.clearCart(vendorId);
        return "redirect:/vender/cart";
    }
    
    @GetMapping("/vender/history")
    public String viewOrderHistory(HttpSession session, Model model) {
        LoginBean user = (LoginBean) session.getAttribute("user");
        if (user == null) {
            return "redirect:/";
        }

        List<OrderBean> orders = orderDao.getOrdersByVendor(user.getId());
        model.addAttribute("orders", orders);
        return "History"; // this should map to OrderHistory.jsp
    }
}
