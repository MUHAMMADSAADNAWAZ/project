<%
    session = request.getSession(false);
    if ("user".equals(session.getAttribute("type"))) {
    response.sendRedirect("about.jsp");
    }
    else if ("admin".equals(session.getAttribute("type"))) {
        
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
    <title>Foodie Haven - Admin About</title>
</head>
<body>
    
    <ul id="aboutNav" >
        <li><a href="adminAbout.jsp"  style="color: red; font-weight: bolder;">About</a></li>
        <li><a href="adminOrder.jsp">Order Management</a></li>
        <li><a href="menu.jsp">Menu Management</a></li>
        <li><a href="logout.jsp" class="logout" style="margin-left: 750px;">Logout</a></li>
    </ul>

    <div class="adminContainer" >
        <h2>Foodie Haven - About</h2>
        <h3>"Flavors that speak louder than words"</h3>
        <p>
            Welcome to our culinary haven, where flavor meets passion! At <span>Foodie Haven </span>, we believe in the magic of great food and the joy it brings to life. Our mission is to connect food lovers with the best local restaurants and gourmet experiences. Whether you're craving a hearty meal, a sweet treat, or something exotic, we've got you covered. Our curated selection of dishes is prepared with the finest ingredients, ensuring every bite is a delight. Join us on this delicious journey and explore the world of food like never before. Your taste buds will thank you!
            </p>
            <h4>"As an admin you can manage Menu "</h4>
            <a href="menu.jsp" style="
            background-color: orange;
            display: block;
            text-align: center;
            color: white;
            font-size: 25px;
            padding: 10px;
            width: 30%;
            border-radius: 20px;
            margin-left: 37%;
            text-decoration: none;">Menu Management</a>

    </div>

</body>
</html>