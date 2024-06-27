// calculating price

function calculatePrice(foodID){
    
    var price = document.getElementById(foodID);
    var priceText = price.textContent;
    const onlyPrice = parseInt(priceText.match(/\d+/)[0]);

    if(confirm("This item price is " + onlyPrice + "\npress ok to confirm this item order")){
         localStorage.setItem("price" , parseInt(localStorage.getItem("price"))+onlyPrice);
    }
 
}

function totalPrice(){
    var payment = localStorage.getItem("paymentMethod");
    
    if(payment == null || payment == "null"){
        alert("You have not selected your payment method yet.\nPlease select your payment method first.")
        localStorage.setItem("price" , 0);
        return;
    }
    var price = localStorage.getItem("price");
    if(confirm("Total price is : " + price + "\nPress ok to confirm your final order")){
        alert("Your order is placed successfully! \n Payment will be using " + payment);
        payment = localStorage.setItem("paymentMethod" , null);
        localStorage.setItem("price" , 0);
    }
    else{
        alert("You canceled your order!");
    }
}

// selecting payment method
        
var easypaisaNumber = 0;
var easypaisaCode = 123456;

function paymentMethod(){

    var paymentValue = document.getElementById("payment").value;

    if(paymentValue == "1"){
        if(confirm("You choose payment method 'on delivery'\nPress OK to continue")){
            localStorage.setItem("paymentMethod" , "On Delivery");
            alert("Your payment method is set as onDelivery");
            return;
        } else {
            alert("Your payment method is not set yet");
            localStorage.setItem("paymentMethod" , null);
        }
    }

    else if(paymentValue == "0"){
        if(confirm("You choose Easypaisa/Jazzcash payment method\nPress OK to continue")){
            easypaisaNumber = prompt("Enter your 11 digit Easypaisa/Jazzcash number", "03xxxxxxxxx");
            
            if(easypaisaNumber.length == 11 ){
                alert("6 digit code for confirmation of transaction from Easypaisa is '567382'");
                easypaisaCode = prompt("Enter your 6 digit code we sent to your Easypaisa account", "");
                if(easypaisaCode == 567382){
                    localStorage.setItem("paymentMethod" , "EasyPaisa");
                    alert("Your payment method is set as Easypaisa/Jazzcash payment");
                    return;
                }
            }
            else{
                alert("Your number is invalid please enter valid 11 digit number");
            }
        }
        alert("Your payment method is not set yet");    
        localStorage.setItem("paymentMethod" , null);
    }

}


// Reviews Section 
localStorage.setItem("reviewi" , 1);
var reviewi = parseInt(localStorage.getItem("reviewi"));
function userReviews(){
    var reviewi = parseInt(localStorage.getItem("reviewi"));
    document.getElementById("submittedreviewHeadingID").style.display = "block";

    if(reviewi == 6){
        localStorage.setItem("reviewi", 1);
        document.getElementById("submittedreview" + reviewi).style.display = "block";
        document.getElementById("para" + reviewi).innerHTML = document.reviewForm.reviews.value;
        document.getElementById("span" + reviewi).innerHTML = document.reviewForm.rating.value;
    }
    else{
        document.getElementById("submittedreview" + reviewi).style.display = "block";
        document.getElementById("para" + reviewi).innerHTML = document.reviewForm.reviews.value;
        document.getElementById("span" + reviewi).innerHTML = document.reviewForm.rating.value;

        localStorage.setItem("reviewi", reviewi + 1); 
    }

    reviewi = parseInt(localStorage.getItem("reviewi"));
    console.log(reviewi);
    alert("Your review is submitted successfully");
}
  
