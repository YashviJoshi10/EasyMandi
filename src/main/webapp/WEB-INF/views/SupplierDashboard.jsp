<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Supplier Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Supplier.css">
</head>
<style>
	.dashboard-button {
    position: absolute;
    top: 20px;
    right: 20px;
    background-color: #fff;
    border: 2px solid  #004aad;
    padding: 8px 16px;
    border-radius: 10px;
    text-decoration: none;
    color:  #004aad;
    font-weight: bold;
    transition: all 0.3s ease;
}

.dashboard-button:hover {
    background-color: #004aad;
    color: white;
    cursor: pointer;
}
</style>
<body>
  <div class="dashboard-container">
    <header class="dashboard-header">
      <h1>👋 Welcome, Supplier</h1>
      <p>Manage your materials, track orders, and view feedback</p>
      <a href="${pageContext.request.contextPath}/" class="dashboard-button"><ion-icon name="home-outline"></ion-icon>Logout</a>
    </header>

    <section class="dashboard-grid">
      <div class="dashboard-tile">
        <h3>Manage Materials</h3>
        <p>Add, update and remove materials</p>
        <a href="${pageContext.request.contextPath}/supplier/ManageMaterials" class="btn">Go</a>
      </div>

      <div class="dashboard-tile">
        <h3>View Orders</h3>
        <p>Check vendor orders and track progress</p>
        <a href="${pageContext.request.contextPath}/supplier/ViewOrders" class="btn">View</a>
      </div>

      <div class="dashboard-tile">
       
        <h3>Vendor Feedback</h3>
        <p>See your ratings and vendor comments</p>
        <a href="${pageContext.request.contextPath}/supplier/feedback" class="btn">See</a>
      </div>
    </section>
  </div>

  <script src="${pageContext.request.contextPath}/js/Supplier.js"></script>
</body>
</html>