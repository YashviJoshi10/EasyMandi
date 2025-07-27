<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>EasyMandi</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f3f4f6;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .auth-box {
      background: white;
      padding: 2rem;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0,0,0,0.1);
      width: 350px;
    }

    .tabs {
      display: flex;
      justify-content: space-around;
      margin-bottom: 1rem;
    }

    .tabs button {
      flex: 1;
      padding: 0.5rem;
      cursor: pointer;
      background: #e5e7eb;
      border: none;
      font-weight: bold;
    }

    .tabs button.active {
      background: #2563eb;
      color: white;
    }

    form {
      display: none;
      flex-direction: column;
    }

    form.active {
      display: flex;
    }

    input, select, button {
      margin: 0.5rem 0;
      padding: 0.6rem;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    button.submit-btn {
      background: #2563eb;
      color: white;
      border: none;
    }

    h2 {
      text-align: center;
    }
  </style>
</head>
<body>

  <div class="auth-box">
    <h2>Welcome to EasyMandi</h2>

    <div class="tabs">
     	<button id="loginTab" class="active" onclick="showForm('login')">Login</button>
  		<button id="signupTab" onclick="showForm('signup')">Sign Up</button>
    </div>

    <!-- Login Form -->
    <form id="loginForm" class="active" method="post" action="checklogin">
      <label for="login-role">Role:</label>
      <select name="role" id="login-role" required>
        <option value="">-- Select Role --</option>
        <option value="vendor">Vendor</option>
        <option value="supplier">Supplier</option>
      </select>

      <input type="text" name="name" placeholder="Username" required />
      <input type="password" name="password" placeholder="Password" required />

      <button type="submit" class="submit-btn">Login</button>
      <% if (request.getAttribute("error") != null) { %>
		  <p style="color:red;"><%= request.getAttribute("error") %></p>
	  <% } %>
    </form>
	
    <!-- Sign Up Form -->
    <form id="signupForm" method="post" action="/signup">
      <input type="text" name="name" placeholder="Full Name" required />
      <input type="email" name="email" placeholder="Email" required />
      <input type="password" name="password" placeholder="Password" required />
      <input type="password" name="confirm" placeholder="Confirm Password" required />

      <label for="signup-role">Role:</label>
      <select name="role" id="signup-role" required>
        <option value="">-- Select Role --</option>
        <option value="vendor">Vendor</option>
        <option value="supplier">Supplier</option>
      </select>

      <button type="submit" class="submit-btn">Create Account</button>
    </form>
    
  </div>

  <script>
    function showForm(type) {
      document.getElementById('loginForm').classList.remove('active');
      document.getElementById('signupForm').classList.remove('active');
      document.getElementById('loginTab').classList.remove('active');
      document.getElementById('signupTab').classList.remove('active');

      if (type === 'login') {
        document.getElementById('loginForm').classList.add('active');
        document.getElementById('loginTab').classList.add('active');
      } else {
        document.getElementById('signupForm').classList.add('active');
        document.getElementById('signupTab').classList.add('active');
      }
    }
  </script>

</body>
</html>