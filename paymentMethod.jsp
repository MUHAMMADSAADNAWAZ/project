<%
    session = request.getSession(false);
    if ("admin".equals(session.getAttribute("type"))) {
        response.sendRedirect("adminAbout.jsp");
    }
    else if ("user".equals(session.getAttribute("type"))) {
        
    }
    else{
        response.sendRedirect("login.html");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>
    <title>Foodie Haven - Payment Page</title>
</head>
<body>
    
    <ul id="aboutNav">
        <li><a href="about.jsp">About</a></li>
        <li><a href="order.jsp">Order Placement</a></li>
        <li><a href="promo&discounts.jsp" >Promotions & Discounts</a></li>
        <li><a href="reviews.jsp">Reviews & Ratings</a></li>
        <li><a href="paymentMethod.jsp"  style="color: red; font-weight: bolder;">Payment Methods</a></li>
        <li><a href="logout.jsp" class="logout">Logout</a></li>
    </ul>
    
    <div class="paymentContainer">
        <h2>Choose your <span>Foodie Haven</span> payment method</h2>
        <form name="paymentForm">
            <label for="payment">Choose Your payment method:</label>
            <select name="payment" id="payment" onchange="paymentMethod()">
                <option value=""></option>
                <option value=1>On Delivery</option>
                <option value=0>EasyPaisa / Jazzcash</option>
            </select>
        </form>
    </div>
    
    <a href="order.jsp" id="paymentOrder">Order Now</a>

</body>
</html>