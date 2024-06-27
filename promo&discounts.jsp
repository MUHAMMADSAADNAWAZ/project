<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <style>
        .visible  {
        display: block;
        }

    .hidden  {
    display: none;
    }    
    </style>
    <title>Foodie Haven - Promotions & Discounts Page</title>
</head>
<body>
    
    <ul id="aboutNav">
        <li><a href="about.jsp" >About</a></li>
        <li><a href="order.jsp">Order Placement</a></li>
        <li><a href="promo&discounts.jsp" style="color: red; font-weight: bolder;">Promotions & Discounts</a></li>
        <li><a href="reviews.jsp">Reviews & Ratings</a></li>
        <li><a href="paymentMethod.jsp" >Payment Methods</a></li>
        <li><a href="logout.jsp" class="logout">Logout</a></li>
    </ul>

    <h1 class="orderHeading">Welcome to <span>Foodie Haven</span> Promotions & Discounts page</h1>

    <div class="orderContainer">
        <span class="foodCategory">Haven Discounted Deals</span>
        <div class="deals">

        <div class="deal1 images" id="deal1">
            <span class="itemName">Deal1 - Large Pizza</span>
            <span class="itemPrice2 itemPrice" id="deal1price">Discount "20%" : 1200</span>
        </div>
        
        <div class="deal2 images" id="deal2">
            <span class="itemName">Deal2 - Burger with Pizza</span>
            <span class="itemPrice2 itemPrice" id="deal2price">Discount "25%" : 750</span>
        </div>
        
        <div class="deal3 images" id="deal3">
            <span class="itemName">Deal3 - Seekh Kabab</span>
            <span class="itemPrice2 itemPrice" id="deal3price">Discount "10%" : 540</span>
        </div>
        
        <div class="deal4 images" id="deal4">
            <span class="itemName">Deal4 - Double Loaded Burger</span>
            <span class="itemPrice2 itemPrice" id="deal4price">Discount "15%" : 350</span>
        </div>
        
    </div>

        <div class="priceBox">
            <p class="price" id="deal1box" onclick="calculatePrice('deal1price')">Order : Large Pizza</p>
            <p class="price" id="deal2box" onclick="calculatePrice('deal2price')">Order : Burger with Pizza</p>
            <p class="price" id="deal3box" onclick="calculatePrice('deal3price')">Order : Seekh Kabab</p>
            <p class="price" id="deal4box" onclick="calculatePrice('deal4price')">Order : Double Loaded Burger</p>
            </div>

    </div>

    <a href="promo&discounts.jsp" class="placeOrder" onclick="totalPrice()">Place Your Order</a>
    
    <script src="script.js"></script>
    
</body>
</html>

<%@ page import="java.sql.*" %>
<%
    session = request.getSession(false);
    if ("admin".equals(session.getAttribute("type"))) {
        response.sendRedirect("adminAbout.jsp");
    }
    else if ("user".equals(session.getAttribute("type"))) {
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/project";
            Connection connection = DriverManager.getConnection(url, "root", "root");

            String query = "SELECT name, price, visibility FROM foods";
            PreparedStatement statement = connection.prepareStatement(query);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String itemName = resultSet.getString("name");
                int price = resultSet.getInt("price");
                String visible = resultSet.getString("visibility");

                String priceElementId = itemName + "price";
                String displayElementId = itemName;
                String displayElementIdbox = itemName + "box";
                String visibilityClass = visible.equals("show") ? "visible" : "hidden";

                    out.print("<script>");
                    // out.print("console.log('Updating " + itemName + "');");
                    out.print("document.getElementById('" + priceElementId + "').textContent = 'Price: ' + " + price + ";");
                    out.print("document.getElementById('" + displayElementId + "').classList.add('" + visibilityClass + "');");
                    out.print("document.getElementById('" + displayElementIdbox + "').classList.add('" + visibilityClass + "');");
                    // out.print("console.log('" + itemName + " updated successfully');");
                    out.print("</script>");
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            out.println("SQLException " + e.getMessage());
        }
        
    }
    else{
        response.sendRedirect("login.html");
    }
%>
