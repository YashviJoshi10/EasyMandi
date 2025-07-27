<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.bean.OrderBean" %>

<html>
<head>
    <title>Vendor Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #cde6ff, #e4f2ff);
            padding: 20px;
        }
        h2 {
            text-align: center;
        }
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ccc;
            text-align: center;
        }
        th {
            background: #004aad;
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
    <h2>Vendor Orders</h2>
    <a href="${pageContext.request.contextPath}/supplier/dashboard" class="dashboard-button"><ion-icon name="home-outline"></ion-icon>Dashboard</a>
    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Vendor</th>
                <th>Material</th>
                <th>Quantity</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<OrderBean> orders = (List<OrderBean>) request.getAttribute("orders");
                if (orders != null) {
                    for (OrderBean order : orders) {
            %>
                <tr>
                    <td><%= order.getId() %></td>
                    <td><%= order.getVendor() %></td>
                    <td><%= order.getMaterial() %></td>
                    <td><%= order.getQuantity() %></td>
                    <td><%= order.getStatus() %></td>
                </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>
