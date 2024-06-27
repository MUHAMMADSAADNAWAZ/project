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
    <title>foodie Haven - Order Management</title>
</head>
<body >
    
    <ul id="aboutNav" >
        <li><a href="adminAbout.jsp" >About</a></li>
        <li><a href="adminOrder.jsp" style="color: red; font-weight: bolder;">Order Management</a></li>
        <li><a href="menu.jsp" >Menu Management</a></li>
        <li><a href="logout.jsp" class="logout" style="margin-left: 750px;">Logout</a></li>
    </ul>

    <h1 style="text-align: center; font-size: 60px; padding: 15px; margin: 20px 0px; color: red;">Food Lists</h1>

    <h1 class="orderHeading">Welcome to <span>Foodie Haven</span> order page</h1>

    <div class="orderContainer">
        <span class="foodCategory" >Haven Pizzas</span>
        <div class="pizza">
        <div class="pizzaImage1 images" id="pizza1">
            <span class="itemName">Pizza1 - Tikka Large</span>
            <span class="itemPrice" id="pizza1price">Price : 1450</span>
        </div>

        <div class="pizzaImage2 images" id="pizza2">
            <span class="itemName">Pizza 2 - Fajita Large</span>
            <span class="itemPrice" id="pizza2price">Price : 1500</span>
        </div>

        <div class="pizzaImage3 images" id="pizza3">
            <span class="itemName">Pizza 3 - Malai Boti Large</span>
            <span class="itemPrice" id="pizza3price">Price :1600</span>
        </div>

        <div class="pizzaImage4 images" id="pizza4">
            <span class="itemName" >Pizza 4 - Large Pizza</span>
            <span class="itemPrice" id="pizza4price">Price :1400</span>
        </div>

        <div class="pizzaImage5 images" id="pizza5">
            <span class="itemName">Pizza 5 - Small Pizza</span>
            <span class="itemPrice" id="pizza5price">Price :700</span>
        </div>

        <div class="pizzaImage6 images" id="pizza6">
            <span class="itemName">Pizza 6 - Extra Large Pizza</span>
            <span class="itemPrice" id="pizza6price">Price :2200</span>
        </div>

        </div>

        <span class="foodCategory">Haven Shawarmas</span>
        <div class="shawarma">

        <div class="shawarma1 images" id="shawarma1">
            <span class="itemName">Shawarma 1 - Shawarma</span>
            <span class="itemPrice" id="shawarma1price">Price :150</span>
        </div>

        <div class="shawarma2 images" id="shawarma2">
            <span class="itemName">Shawarma 2 - Two Shawarmas</span>
            <span class="itemPrice" id="shawarma2price">Price :300</span>
        </div>

        <div class="shawarma3 images" id="shawarma3">
            <span class="itemName">Shawarma 3 - Three Shawarmas</span>
            <span class="itemPrice" id="shawarma3price">Price :600</span>
        </div>

        </div>

        <span class="foodCategory">Haven Burgers</span>
        <div class="burger">
            
        <div class="burger1 images" id="burger1">
            <span class="itemName">Burger 1 - Petty Burger</span>
            <span class="itemPrice" id="burger1price">Price :150</span>
        </div>

        <div class="burger2 images" id="burger2">
            <span class="itemName">Burger 2 - Loaded Burger</span>
            <span class="itemPrice" id="burger2price">Price :250</span>
        </div>
        
        <div class="burger3 images" id="burger3">
            <span class="itemName">Burger 3 - Two Loaded Burgers</span>
            <span class="itemPrice" id="burger3price">Price :500</span>
        </div>
        
    </div>

    <div class="orderContainer" style="margin-bottom: 30px;">
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

    <div class="adminContainer" >
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

<%@ page import="java.sql.*" %>
<%
    session = request.getSession(false);
    if ("user".equals(session.getAttribute("type"))) {
    response.sendRedirect("about.jsp");
    }
    else if ("admin".equals(session.getAttribute("type"))) {

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
                String visibilityClass = visible.equals("show") ? "visible" : "hidden";

                    out.print("<script>");
                    out.print("console.log('Updating " + itemName + "');");
                    out.print("document.getElementById('" + priceElementId + "').textContent = 'Price: ' + " + price + ";");
                    out.print("document.getElementById('" + displayElementId + "').classList.add('" + visibilityClass + "');");
                    out.print("console.log('" + itemName + " updated successfully');");
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