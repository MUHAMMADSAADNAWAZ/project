import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;

public class LogIn extends HttpServlet{

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();
		session.setAttribute("type", "null");
		try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/project";
            Connection con = DriverManager.getConnection(url, "root", "root");
            
			String username = req.getParameter("username");
            String password = req.getParameter("password");
			
			if(username.equals( "admin")){
				
				String query = "Select * from admin where password =? ";
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1, password);
                ResultSet rs = pst.executeQuery();
				
				 if (rs.next()) {
                    String dbPassword = rs.getString("password");
                    if (dbPassword.equals(password)) {
						session.setAttribute("type", "admin");
						
                        res.sendRedirect("adminAbout.jsp");
                    } else {
                        out.println("Username or password does not match as an admin");
						out.println("If you do not have an admin account signup yourself as an admin first");
                    }
                } else {
                    out.println("Username or password does not match as an admin");
					out.println("If you do not have an admin account signup yourself as an admin first");

                }
			
			}
			else{
				String query = "Select * from user where password =? ";
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1, password);
                ResultSet rs = pst.executeQuery();
				
				 if (rs.next()) {
                    String dbUsername = rs.getString("username");	 
                    String dbPassword = rs.getString("password");
                    if (dbUsername.equals(username) && dbPassword.equals(password)) {
						session.setAttribute("type", "user");				
                        res.sendRedirect("about.jsp");
                    } else {
						 out.println("Invalid username or password");
						 out.println("Try Again");
                    }
                } else {
                    out.println("Username or password does not match as a user");
					out.println("If you do not have an account signup yourself  first");
                }
	
			}
			
		}
		catch (ClassNotFoundException e) {
			out.println("ClassNotFoundException Occured");
		}
		catch(SQLException e){
			out.println("SQLException Occured");
		}
            out.close();
	}
}

