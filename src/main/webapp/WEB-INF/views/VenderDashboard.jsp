<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Vendor Dashboard</title>
<link href="${pageContext.request.contextPath}/css/Vendor.css" rel="stylesheet">
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
    .combo-card {
      background-color: #f1f3f5;
      border-radius: 8px;
      padding: 15px;
      margin-top: 15px;
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

<!-- ✅ Dashboard Content -->
<div class="container mt-5">
  <h2>Welcome, Vendor!</h2>
  <p class="text-muted">Use the buttons above to explore materials, place orders, and check history.</p>
  <hr>

  <h5><ion-icon name="bag-handle-outline"></ion-icon> Today’s Deals</h5>
  <div class="combo-card shadow-sm">
    <strong>Combo Offer:</strong><br>
    2kg Potatoes + 1kg Onions + 1L Oil for ₹130
  </div>
</div>
<script> 
     document.getElementById("logoutBtn").addEventListener("click", function(e) {
    e.preventDefault(); // Stop default link behavior

    Swal.fire({
      title: 'Log Out?',
      text: "Are you sure you want to log out?",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, log me out'
    }).then((result) => {
      if (result.isConfirmed) {
        window.location.href = "../home.html"; // Redirect to home
      }
    });
  });
  </script>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>