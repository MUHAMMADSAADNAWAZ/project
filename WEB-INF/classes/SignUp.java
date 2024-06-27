import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;

public class SignUp extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		
		PrintWriter out = res.getWriter();
		try{
			
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/project";
            Connection con = DriverManager.getConnection(url, "root", "root");
            
			String name = req.getParameter("name");
			String phone = req.getParameter("phone");
			String username = req.getParameter("username");
            String password = req.getParameter("password");
            String cPassword = req.getParameter("cPassword");
			
			if(!password.equals(cPassword)){
				out.println("password and confrim password are not same.");
				out.println("please enter password carefully");
				return;
			}
			
			String query;
            if (username.equals("admin")) {
                query = "SELECT * FROM admin WHERE username = ?";
            } else {
                query = "SELECT * FROM user WHERE username = ?";
            }
			
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();
			
			if(rs.next()){
				
				String dbPassword = rs.getString("password");
            if (!username.equals("admin")) {
                out.println("Please change your username because the entered username is already occupied.");
                return;
            }
			else if(username.equals("admin") && dbPassword.equals(password)){
				out.println("Please change your username and password because the entered username and password is already occupied.");
                return;
			}
			}
			
			else {
				
                if (username.equals("admin")) {
                    query = "INSERT INTO admin (name, phone, username, password, confirm_password) VALUES (?, ?, ?, ?, ?)";
                } else {
                    query = "INSERT INTO user (name, phone, username, password, confirm_password) VALUES (?, ?, ?, ?, ?)";
                }
				
                pst = con.prepareStatement(query);
                pst.setString(1, name);
                pst.setString(2, phone);
                pst.setString(3, username);
                pst.setString(4, password);
                pst.setString(5, cPassword);
				
                int rowsInserted = pst.executeUpdate();
				
                if (rowsInserted > 0) {
					res.sendRedirect("login.html");
               } else {
                    out.println("Record is not inserted.");
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
