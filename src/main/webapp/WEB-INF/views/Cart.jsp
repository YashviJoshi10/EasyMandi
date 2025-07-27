<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.bean.CartBean" %>
<%
    List<CartBean> cartItems = (List<CartBean>) request.getAttribute("cartItems");
com.bean.LoginBean user = (com.bean.LoginBean) session.getAttribute("user");
int vendorId = user != null ? user.getId() : 0;
    int total = 0;
%>
<html>
<head>
    <title>Vendor Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f9f9f9;
        }

        .navbar {
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .cart-table {
            margin: 40px auto;
            width: 85%;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }

        .cart-table th {
            background-color: #f1f1f1;
            text-align: center;
        }

        .cart-table td {
            text-align: center;
            vertical-align: middle;
        }

        .btn-danger {
            border-radius: 5px;
        }

        .btn-order {
            margin-top: 20px;
            float: right;
            margin-right: 8%;
        }

        .total-amount {
            margin-top: 20px;
            text-align: right;
            padding-right: 8%;
            font-size: 18px;
        }
    </style>
</head>
<body>
<!-- ======= NAVBAR ======= -->
<nav class="navbar navbar-expand-lg navbar-light bg-white">
    <div class="container-fluid px-4">
        <a class="navbar-brand text-primary fw-bold" href="#">
            <i class="fas fa-box"></i> Vendor Portal
        </a>
        <div class="collapse navbar-collapse justify-content-end">
            <div>
		      <a href="${pageContext.request.contextPath}/vender/dashboard" class="btn btn-sm btn-outline-primary me-2 active"><ion-icon name="home-outline"></ion-icon> Dashboard</a>
		      <a href="${pageContext.request.contextPath}/vender/showmaterials" class="btn btn-sm btn-outline-success me-2"><ion-icon name="cube-outline"></ion-icon> Materials</a>
		      <a href="${pageContext.request.contextPath}/vender/cart" class="btn btn-sm btn-outline-warning me-2"><ion-icon name="cart-outline"></ion-icon> Cart</a>
		      <a href="${pageContext.request.contextPath}/vender/history" class="btn btn-sm btn-outline-info me-2"><ion-icon name="bag-check-outline"></ion-icon> History</a>
		      <a href="${pageContext.request.contextPath}/" class="btn btn-sm btn-outline-primary me-2" id="logoutBtn"><ion-icon name="log-out-outline"></ion-icon> LogOut</a>
		    </div>
        </div>
    </div>
</nav>

<!-- ======= CART TABLE ======= -->
<h3 class="text-center mt-4"><i class="fas fa-shopping-cart"></i> Your Cart</h3>

<form action="${pageContext.request.contextPath}/vender/placeOrder" method="post">
    <table class="table cart-table table-bordered">
        <thead>
            <tr>
                <th>Item</th>
                <th>Unit</th>
                <th>Price (₹)</th>
                <th>Quantity</th>
                <th>Total (₹)</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
         <%
		    int grandTotal = 0;
		    if (cartItems != null && !cartItems.isEmpty()) {
		        for (CartBean item : cartItems) {
		        	int itemTotal = item.getPrice() * item.getQuantity();
		            grandTotal += itemTotal;
		%>
		    <tr>
		        <td><%= item.getItemName() %></td>
		        <td><%= item.getUnit() %></td>
		        <td><%= item.getPrice() %></td>
		        <td><%= item.getQuantity() %></td>
		        <td><%= itemTotal %></td>
		        <td>
		            <a href="${pageContext.request.contextPath}/vender/deleteCartItem/<%= item.getId() %>" class="btn btn-sm btn-danger">
		                <i class="fas fa-trash">delete</i>
		            </a>
		        </td>
		    </tr>
		<%
		        }
		    } else {
		%>
		    <tr>
		        <td colspan="6" class="text-center">Your cart is empty.</td>
		    </tr>
		<%
		    }
		%>
        </tbody>
    </table>

    <% if (cartItems != null && !cartItems.isEmpty()) { %>
    <div class="total-amount">
        <strong>Total: ₹<%= grandTotal %></strong>
    </div>
<% } %>

    <div class="btn-order">
        <button class="btn btn-primary" type="submit">
            <i class="fas fa-paper-plane"></i> Place Order
        </button>
    </div>
</form>

</body>
</html>
