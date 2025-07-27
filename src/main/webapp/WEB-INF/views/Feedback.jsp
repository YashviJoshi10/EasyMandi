<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bean.FeedbackBean" %>
<%
    List<FeedbackBean> feedbackList = (List<FeedbackBean>) request.getAttribute("feedbackList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Vendor Feedback</title>
    <style>
        .feedback-box {
            width: 60%;
            margin: auto;
            padding: 15px;
            background: #f0f0f0;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .rating {
            color: gold;
            font-size: 20px;
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
    <h2 align="center">Feedback Received</h2>
    	<a href="${pageContext.request.contextPath}/supplier/dashboard" class="dashboard-button"><ion-icon name="home-outline"></ion-icon>Dashboard</a>
    <%
        if (feedbackList != null && !feedbackList.isEmpty()) {
            for (FeedbackBean fb : feedbackList) {
    %>
        <div class="feedback-box">
            <p><strong>Comment:</strong> <%= fb.getFeedback() %></p>
            <p class="rating"><strong>Rating:</strong> 
                <% for (int i = 0; i < fb.getRating(); i++) { %>
                    ★
                <% } %>
            </p>
        </div>
    <%
            }
        } else {
    %>
        <p align="center">No feedback available yet.</p>
    <%
        }
    %>
</body>
</html>
