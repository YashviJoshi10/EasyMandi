<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Manage Raw Materials</title>
  
  <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(to right, #a1c4fd, #c2e9fb);
      padding: 40px;
    }

    .container {
      max-width: 700px;
      margin: auto;
      background: white;
      padding: 25px;
      border-radius: 12px;
      box-shadow: 0 5px 20px rgba(0,0,0,0.1);
    }

    h2 {
      text-align: center;
      color: #0d47a1;
      margin-bottom: 20px;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 10px;
    }

    form input {
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 6px;
    }

    form button {
      padding: 12px;
      background: #0d47a1;
      color: white;
      border: none;
      border-radius: 6px;
      font-weight: bold;
      cursor: pointer;
    }

    form button:hover {
      background: #1565c0;
    }

    table {
      width: 100%;
      margin-top: 20px;
      border-collapse: collapse;
      background-color: #fff;
    }

    th, td {
      border: 1px solid #ddd;
      padding: 10px;
      text-align: center;
    }

    th {
      background-color: #0d47a1;
      color: white;
    }
    
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
</head>
<body>

  <div class="container">
	<a href="${pageContext.request.contextPath}/supplier/dashboard" class="dashboard-button"><ion-icon name="home-outline"></ion-icon>Dashboard</a>
    <h2>Manage Raw Materials</h2>
    <form id="materialForm" action="/addmaterial" method="post">
      <input type="text" id="materialName" placeholder="Material Name" name="materialname" required>
      <input type="text" id="materialType" placeholder="Material Type" name="materialtype" required>
      <input type="number" id="materialQty" placeholder="Quantity" name="materialquantity" required>
      <button type="submit">Add Material</button>
    </form>

    <table id="materialTable">
      <thead>
        <tr>
          <th>Name</th>
          <th>Type</th>
          <th>Quantity</th>
        </tr>
      </thead>
      <tbody>
        <!-- Added materials will appear here -->
      </tbody>
    </table>
  </div>

  <script src="${pageContext.request.contextPath}/js/Supplier.js"></script>
</body>
</html>