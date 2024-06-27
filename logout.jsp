<%
    session = request.getSession(false);
    session.invalidate();    
    response.sendRedirect("login.html");

%>