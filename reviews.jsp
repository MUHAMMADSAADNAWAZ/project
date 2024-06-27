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
    <title>Foodie Haven - Reviews Page</title>
</head>
<body>
    
    <ul id="aboutNav">
        <li><a href="about.jsp">About</a></li>
        <li><a href="order.jsp">Order Placement</a></li>
        <li><a href="promo&discounts.jsp" >Promotions & Discounts</a></li>
        <li><a href="reviews.jsp"  style="color: red; font-weight: bolder;">Reviews & Ratings</a></li>
        <li><a href="paymentMethod.jsp" >Payment Methods</a></li>
        <li><a href="logout.jsp" class="logout">Logout</a></li>
    </ul>

    <div class="reviewContainer">
        <h2>Welcome to <span>Foodie Haven </span> <span style="color: orange;">Reviews Page</span></h2>
        <form name="reviewForm">
            <h4>Customer Review : </h4>
            <textarea name="reviews" id="reviews" cols="100" rows="10" placeholder="Enter your review here"></textarea> <br>

            <h5>Customer Ratings : </h5>
            <input type="radio" name="rating" id="VeryGood" value="VeryGood">
            <label for="VeryGood">Very Good</label> <br>
            <input type="radio" name="rating" id="Good" value="Good">
            <label for="Good">Good</label> <br>
            <input type="radio" name="rating" id="Normal" value="Normal">
            <label for="Normal">Normal</label> <br>
            <input type="radio" name="rating" id="Bad" value="Bad">
            <label for="Bad">Bad</label> <br>
            <input type="radio" name="rating" id="VeryBad" value="VeryBad">
            <label for="VeryBad">Very Bad</label> <br>

            <input type="button" value="Submit Your Review" onclick="userReviews()">
        </form>

        <h3 class="submittedreviewHeading" id="submittedreviewHeadingID">Customer Reviews</h3>
        <div id="submittedreview1" class="submittedreview">
            <p class="default" style="color: black; font-weight: bold;">Review:</p>
            <p id="para1"></p>
            <p class="default" style="color: black; font-weight: bold;">Ratings:</p>
            <span id="span1"></span>
            <hr>
        </div>

        <div id="submittedreview2" class="submittedreview">
            <p class="default" style="color: black; font-weight: bold;">Review:</p>
            <p id="para2"></p>
            <p class="default" style="color: black; font-weight: bold;">Ratings:</p>
            <span id="span2"></span>
            <hr>
        </div>

        <div id="submittedreview3" class="submittedreview">
            <p class="default" style="color: black; font-weight: bold;">Review:</p>
            <p id="para3"></p>
            <p class="default" style="color: black; font-weight: bold;">Ratings:</p>
            <span id="span3"></span>
            <hr>
        </div>
        
        <div id="submittedreview4" class="submittedreview">
            <p class="default" style="color: black; font-weight: bold;">Review:</p>
            <p id="para4"></p>
            <p class="default" style="color: black; font-weight: bold;">Ratings:</p>
            <span id="span4"></span>
            <hr>
        </div>
        
        <div id="submittedreview5" class="submittedreview">
            <p class="default" style="color: black; font-weight: bold;">Review:</p>
            <p id="para5"></p>
            <p class="default" style="color: black; font-weight: bold;">Ratings:</p>
            <span id="span5"></span>
            <hr>
        </div>

    </div>

</body>
</html>