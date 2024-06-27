<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <style>
        .visible {
        display: block;
        }

    .hidden {
    display: none;
    }    
    </style>
    <title>Foodie Haven - Order Page</title>
</head>
<body >
    <script src="script.js"></script>

    <ul id="aboutNav">
        <li><a href="about.jsp" >About</a></li>
        <li><a href="order.jsp" style="color: red; font-weight: bolder;">Order Placement</a></li>
        <li><a href="promo&discounts.jsp" >Promotions & Discounts</a></li>
        <li><a href="reviews.jsp">Reviews & Ratings</a></li>
        <li><a href="paymentMethod.jsp" >Payment Methods</a></li>
        <li><a href="logout.jsp" class="logout">Logout</a></li>
    </ul>

    <h1 class="orderHeading">Welcome to <span>Foodie Haven</span> order page</h1>

    <div class="orderContainer">
        <span class="foodCategory" >Haven Pizzas</span>
        <div class="pizza">
        <div class="pizzaImage1 images" id="pizza1">
            <span class="itemName">Tikka Large</span>
            <span class="itemPrice" id="pizza1price">Price : 1450</span>
        </div>

        <div class="pizzaImage2 images" id="pizza2">
            <span class="itemName">Fajita Large</span>
            <span class="itemPrice" id="pizza2price">Price : 1500</span>
        </div>

        <div class="pizzaImage3 images" id="pizza3">
            <span class="itemName">Malai Boti Large</span>
            <span class="itemPrice" id="pizza3price">Price :1600</span>
        </div>

        <div class="pizzaImage4 images" id="pizza4">
            <span class="itemName" >Large Pizza</span>
            <span class="itemPrice" id="pizza4price">Price :1400</span>
        </div>

        <div class="pizzaImage5 images" id="pizza5">
            <span class="itemName">Small Pizza</span>
            <span class="itemPrice" id="pizza5price">Price :700</span>
        </div>

        <div class="pizzaImage6 images" id="pizza6">
            <span class="itemName">Extra Large Pizza</span>
            <span class="itemPrice" id="pizza6price">Price :2200</span>
        </div>

        </div>

        <div class="priceBox">
        <p class="price" id="pizza1box" onclick="calculatePrice('pizza1price')">Order : Tikka Large</p>
        <p class="price" id="pizza2box" onclick="calculatePrice('pizza2price')">Order : Fajita Large</p>
        <p class="price" id="pizza3box" onclick="calculatePrice('pizza3price')">Order : Malai Boti Large</p>
        <p class="price" id="pizza4box" onclick="calculatePrice('pizza4price')">Order : Large Pizza</p>
        <p class="price" id="pizza5box" onclick="calculatePrice('pizza4price')">Order : Small Pizza</p>
        <p class="price" id="pizza6box" onclick="calculatePrice('pizza6price')">Order : Extra Large Pizza</p>
        </div>

        <span class="foodCategory">Haven Shawarmas</span>
        <div class="shawarma">

        <div class="shawarma1 images" id="shawarma1">
            <span class="itemName">Shawarma</span>
            <span class="itemPrice" id="shawarma1price">Price :150</span>
        </div>

        <div class="shawarma2 images" id="shawarma2">
            <span class="itemName">Two Shawarmas with Fries</span>
            <span class="itemPrice" id="shawarma2price">Price :300</span>
        </div>

        <div class="shawarma3 images" id="shawarma3">
            <span class="itemName">Three Shawarmas with drinks</span>
            <span class="itemPrice" id="shawarma3price">Price :600</span>
        </div>

        </div>

        <div class="priceBox">
        <p class="price" id="shawarma1box" onclick="calculatePrice('shawarma1price')">Order : Shawarma</p>
        <p class="price" id="shawarma2box" onclick="calculatePrice('shawarma2price')">Order : Two Shawarmas with Fries</p>
        <p class="price" id="shawarma3box" onclick="calculatePrice('shawarma3price')">Order : Three Shawarmas with drinks</p>
        </div>

        <span class="foodCategory">Haven Burgers</span>
        <div class="burger">
            
        <div class="burger1 images" id="burger1">
            <span class="itemName">Petty Burger</span>
            <span class="itemPrice" id="burger1price">Price :150</span>
        </div>

        <div class="burger2 images" id="burger2">
            <span class="itemName">Loaded Burger</span>
            <span class="itemPrice" id="burger2price">Price :250</span>
        </div>
        
        <div class="burger3 images" id="burger3">
            <span class="itemName">Two Loaded Burgers</span>
            <span class="itemPrice" id="burger3price">Price :500</span>
        </div>
        
    </div>
    
        <div class="priceBox">
        <p class="price" id="burger1box" onclick="calculatePrice('burger1price')">Order : Petty Burger</p>
        <p class="price" id="burger2box" onclick="calculatePrice('burger2price')">Order : Loaded Burger</p>
        <p class="price" id="burger3box" onclick="calculatePrice('burger3price')">Order : Two Loaded Burgers</p>
        </div>

    </div>

    <a href="order.jsp" class="placeOrder" onclick="totalPrice()">Place Your Order</a>
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
                    // <!-- out.print("console.log('Updating " + itemName + "');"); -->
                    out.print("document.getElementById('" + priceElementId + "').textContent = 'Price: ' + " + price + ";");
                    out.print("document.getElementById('" + displayElementId + "').classList.add('" + visibilityClass + "');");
                    out.print("document.getElementById('" + displayElementIdbox + "').classList.add('" + visibilityClass + "');");
                    // <!-- out.print("console.log('" + itemName + " updated successfully');"); -->
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
