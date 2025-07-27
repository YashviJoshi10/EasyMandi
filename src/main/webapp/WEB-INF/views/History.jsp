<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.bean.OrderBean" %>
<%
    List<OrderBean> orders = (List<OrderBean>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Order History - Vendor Portal</title>
  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

  <style>
    body {
      background-color: #f8f9fa;
    }
    .btn.active {
      background-color: #0d6efd !important;
      color: white !important;
    }
  </style>
</head>
<body>

<!-- ✅ Sticky Navbar -->
<nav class="navbar navbar-light bg-white shadow-sm sticky-top">
  <div class="container">
    <a class="navbar-brand fw-bold text-primary" href="dashboard.html">
      <i class="bi bi-box-seam"></i> Vendor Portal
    </a>
    <div>
      <a href="${pageContext.request.contextPath}/vender/dashboard" class="btn btn-sm btn-outline-primary me-2 active"><ion-icon name="home-outline"></ion-icon> Dashboard</a>
      <a href="${pageContext.request.contextPath}/vender/showmaterials" class="btn btn-sm btn-outline-success me-2"><ion-icon name="cube-outline"></ion-icon> Materials</a>
      <a href="${pageContext.request.contextPath}/vender/cart" class="btn btn-sm btn-outline-warning me-2"><ion-icon name="cart-outline"></ion-icon> Cart</a>
      <a href="${pageContext.request.contextPath}/vender/history" class="btn btn-sm btn-outline-info me-2"><ion-icon name="bag-check-outline"></ion-icon> History</a>
      <a href="${pageContext.request.contextPath}/" class="btn btn-sm btn-outline-primary me-2" id="logoutBtn"><ion-icon name="log-out-outline"></ion-icon> LogOut</a>
    </div>
  </div>
</nav>

<!-- ✅ Content -->
<div class="container mt-5">
  <h3><i class="bi bi-clock-history"></i> Order History</h3>
  <p class="text-muted">Here are your recent raw material orders:</p>

  <div class="table-responsive">
    <table class="table table-bordered bg-white">
      <thead class="table-light">
        <tr>
          <th>Date</th>
          <th>Items</th>
          <th>Total Cost (₹)</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
        <% if (orders != null && !orders.isEmpty()) {
		       for (OrderBean order : orders) {
		%>
		<tr>
		    <td><%= order.getId() %></td>
		    <td><%= order.getMaterial() %> (<%= order.getQuantity() %>)</td>
		    <td>₹<%= order.getQuantity() * 10 %></td> <!-- Replace 10 with actual price logic if needed -->
		    <td>
		        <span class="badge 
		            <%= "Pending".equals(order.getStatus()) ? "bg-warning" :
		                 "Delivered".equals(order.getStatus()) ? "bg-success" :
		                 "Cancelled".equals(order.getStatus()) ? "bg-danger" : "bg-secondary" %>">
		            <%= order.getStatus() %>
		        </span>
		    </td>
		</tr>
		<%    }
		   } else { %>
		<tr>
		    <td colspan="4" class="text-center">No order history found.</td>
		</tr>
		<% } %>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>