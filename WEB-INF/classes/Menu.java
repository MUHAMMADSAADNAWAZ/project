import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;

public class Menu extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        PrintWriter out = res.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/project";
            Connection con = DriverManager.getConnection(url, "root", "root");

            String name = req.getParameter("itemName");
            String price = req.getParameter("itemPrice");
            String visibility = req.getParameter("itemVisibility").toLowerCase();

            String query = "SELECT * FROM foods WHERE name = ?";

            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, name);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                query = "UPDATE foods SET price = ?, visibility = ? WHERE name = ?";

                pst = con.prepareStatement(query);
                pst.setString(1, price);
                pst.setString(2, visibility);
                pst.setString(3, name);
                int rowsUpdated = pst.executeUpdate();
                if (rowsUpdated > 0) {
                    out.println("Changes made successfully.");
                } else {
                    out.println("Changes not made successfully.");
                }
            }
        } catch (ClassNotFoundException e) {
            out.println("ClassNotFoundException Occurred: " + e.getMessage());
        } catch (SQLException e) {
            out.println("SQLException Occurred: " + e.getMessage());
        } finally {
            out.close();
        }
    }
}
