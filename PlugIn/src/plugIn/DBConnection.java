package plugIn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {        
    private static Connection con = null;
    
    private static final String DB_name = "moviestoredb";
    private static final String DB_username = "david";
    private static final String DB_password = "federer";
    
    public static Connection getConnection() {
        if (con != null) return con;
        return getCon();
    }

    private static Connection getCon()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(  
					"jdbc:mysql://localhost/"+DB_name+"?useSSL=false",DB_username,DB_password);  
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return con;        
    }
} 