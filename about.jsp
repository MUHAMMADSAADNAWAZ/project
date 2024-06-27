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
    <title>Foodie Haven - About Page</title>
</head>
<body>
    
    <ul id="aboutNav">
        <li><a href="about.jsp" style="color: red; font-weight: bolder;">About</a></li>
        <li><a href="order.jsp">Order Placement</a></li>
        <li><a href="promo&discounts.jsp" >Promotions & Discounts</a></li>
        <li><a href="reviews.jsp">Reviews & Ratings</a></li>
        <li><a href="paymentMethod.jsp" >Payment Methods</a></li>
        <li><a href="logout.jsp" class="logout">Logout</a></li>
    </ul>

    <div class="navContainer">
        <h2>Foodie Haven - About</h2>
        <h3>"Flavors that speak louder than words"</h3>
        <p>
            Welcome to our culinary haven, where flavor meets passion! At <span>Foodie Haven </span>, we believe in the magic of great food and the joy it brings to life. Our mission is to connect food lovers with the best local restaurants and gourmet experiences. Whether you're craving a hearty meal, a sweet treat, or something exotic, we've got you covered. Our curated selection of dishes is prepared with the finest ingredients, ensuring every bite is a delight. Join us on this delicious journey and explore the world of food like never before. Your taste buds will thank you!
            </p>
            <a href="order.jsp">Order Now</a>
            
    </div>
</body>
</html>