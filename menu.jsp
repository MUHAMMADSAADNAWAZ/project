<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> -->
<!-- <%@ page import="javax.servlet.http.HttpSession"%> -->
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
    <script>
            var flag1=false ;
            var flag2=false ;
            var flag3=false;
            function validateName(){
                if(document.getElementById("itemName").value == ''){
                    alert("Item name is required");
                    return false;
                }
                if(document.getElementById("itemName").value.toLowerCase() != 'pizza1' && document.getElementById("itemName").value.toLowerCase() != 'pizza2' && document.getElementById("itemName").value.toLowerCase() != 'pizza3' && document.getElementById("itemName").value.toLowerCase() != 'pizza4' && document.getElementById("itemName").value.toLowerCase() != 'pizza5' && document.getElementById("itemName").value.toLowerCase() != 'pizza6' && document.getElementById("itemName").value.toLowerCase() != 'burger1' && document.getElementById("itemName").value.toLowerCase() != 'burger2' && document.getElementById("itemName").value.toLowerCase() != 'burger3' && document.getElementById("itemName").value.toLowerCase() != 'shawarma1' && document.getElementById("itemName").value.toLowerCase() != 'shawarma2' && document.getElementById("itemName").value.toLowerCase() != 'shawarma3' && document.getElementById("itemName").value.toLowerCase() != 'deal1' && document.getElementById("itemName").value.toLowerCase() != 'deal2' && document.getElementById("itemName").value.toLowerCase() != 'deal3' && document.getElementById("itemName").value.toLowerCase() != 'deal4' ){
                    alert("Invalid Item name entered.\n\nPlease enter valid item name.\n\nItem names are present at admin order page");
                    return false;
                }
                flag1 = true;
                return true;
            }   

            function validatePrice(){
                var itemPrice = document.getElementById("itemPrice").value;
                var validPattern = /^[0-9]+$/; 
                if(itemPrice == ''){
                    alert("Item price is required");
                    return false;
                }
                if (!validPattern.test(itemPrice)) {
                    alert("Please enter valid price (digits only from 0 to 9).");
                    return false;
                }
                flag2 = true;
                return true;
            }
            function validateVisi(){
                if(document.getElementById("itemVisibility").value == ''){
                    alert("Item visibility is required");
                    return false;
                }
                if(document.getElementById("itemVisibility").value == 'discard' && document.getElementById("itemVisibility").value == 'show'){
                    alert("Please enter valid visisbility value");
                    return false;
                }
                flag3 = true;
                return true;
            }
            function validateAll(){
                if(flag1 == false || flag2 == false || flag3 == false){
                    alert("Please enter all above information correctly");
                    return false;
                }
                return true;
            }
    </script>
    <title>Foodie Haven - Menu Management</title>
</head>
<body>
    
    <ul id="aboutNav" >
        <li><a href="adminAbout.jsp" >About</a></li>
        <li><a href="adminOrder.jsp">Order Management</a></li>
        <li><a href="menu.jsp" style="color: red; font-weight: bolder;">Menu Management</a></li>
        <li><a href="logout.jsp" class="logout" style="margin-left: 750px;">Logout</a></li>
    </ul>

    <h1 style="text-align: center; color: orange; font-size: 50px; margin: 20px 0px;">Menu Management</h1>

    <h3 style="text-align: center; font-size: 30px; color: greenyellow;">Enter information of item which you wanna change</h3>

    <form action="menu"  >

        <div class="menuDivs">
        <p class="itemNames">Item Information</p>
            <table>
                <tr>
                    <td><label for="itemName">Enter item name whose information you wanna change : </label></td>
                    <td><input type="text" name="itemName" id="itemName" placeholder="Enter item name here" onchange="return validateName()"></td>
                </tr>
                <tr>
                </tr>
                    <tr>
                    <td><label for="itemPrice">If you want to change price of item enter new price : </label> </td>
                    <td><input type="text" name="itemPrice" id="itemPrice" placeholder="Enter new Price" onchange="return validatePrice()"> </td>
                </tr>
        <td><label for="itemVisibility">To discard item write "discard" and to show item back write "show" : </label></td>
        <td><input type="text" name="itemVisibility" id="itemVisibility" placeholder="discard/show" onchange="return validateVisi()"></td>
            </table>
        </div>
    
        
    <input type="submit" value="Apply Changes" class="menuButton" onmouseover="return validateAll()">

    </form>


</body>
</html>