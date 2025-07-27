<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.bean.MaterialBean" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Raw Materials</title>

  <!-- Bootstrap CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Segoe UI', sans-serif;
    }

    .material-container {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      justify-content: center;
      padding: 40px;
    }

    .material-card {
      background: #fff;
      border: 1px solid #ddd;
      border-radius: 12px;
      padding: 20px;
      width: 300px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    }

    .material-card h3 {
      font-weight: bold;
      margin-bottom: 10px;
    }

    .material-card p {
      margin: 0 0 10px;
    }

    .material-card form {
      margin-top: 10px;
    }

    input[type="number"] {
      width: 100%;
      padding: 5px;
      margin: 5px 0 10px;
      border-radius: 5px;
      border: 1px solid #ccc;
    }

    button[type="submit"] {
      background-color: #007bff;
      color: white;
      border: none;
      padding: 8px 15px;
      border-radius: 5px;
      width: 100%;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    button[type="submit"]:hover {
      background-color: #0056b3;
    }

    .section-label {
      font-weight: bold;
      margin-top: 15px;
    }

    textarea {
      width: 100%;
      border-radius: 5px;
      border: 1px solid #ccc;
      padding: 8px;
      margin-top: 5px;
      resize: vertical;
    }

    /* Navbar styling */
    .navbar {
      padding: 15px;
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
      <a href="${pageContext.request.contextPath}/vender/dashboard" class="btn btn-sm btn-outline-secondary me-2">Dashboard</a>
      <a href="${pageContext.request.contextPath}/vender/showmaterials" class="btn btn-sm btn-outline-success me-2 active">Materials</a>
      <a href="${pageContext.request.contextPath}/vender/cart" class="btn btn-sm btn-outline-warning me-2">Cart</a>
      <a href="history.html" class="btn btn-sm btn-outline-info me-2">History</a>
      <a href="#" class="btn btn-sm btn-outline-primary me-2" id="logoutBtn">LogOut</a>
    </div>
  </div>
</nav>

<!-- ✅ Main Content -->
<div class="material-container">
<%
  List<MaterialBean> materials = (List<MaterialBean>) request.getAttribute("materials");
  if (materials != null && !materials.isEmpty()) {
    for (MaterialBean m : materials) {
%>
  <div class="material-card">
    <h3><%= m.getMaterialname() %></h3>
    <p>Type: <%= m.getMaterialtype() %></p>
    <p>Price: ₹<%= m.getMaterialprice() %></p>

    <form action="/vender/addtocart" method="post">
      <input type="hidden" name="itemName" value="<%= m.getMaterialname() %>" />
      <input type="hidden" name="unit" value="<%= m.getMaterialtype() %>" />
      <input type="hidden" name="price" value="<%= m.getMaterialprice() %>" />
      <input type="number" name="quantity" min="1" placeholder="Quantity (<%= m.getMaterialtype() %>)" required />
      <button type="submit">Add to Cart</button>
    </form>

    <!-- Feedback Form -->
    <div class="section-label">Give Feedback</div>
    <form action="submitfeedback" method="post">
      <input type="hidden" name="materialname" value="<%= m.getMaterialname() %>">
      <textarea name="feedbacktext" rows="3" placeholder="Write your feedback here..." required></textarea>
      <button type="submit">Submit Feedback</button>
    </form>
  </div>
<%
    }
  } else {
%>
  <p>No materials available right now.</p>
<%
  }
%>
</div>


</body>
</html>
