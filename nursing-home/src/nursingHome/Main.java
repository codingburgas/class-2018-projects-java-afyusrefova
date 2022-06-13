package nursingHome;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.FileDescriptor;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.sql.Connection;
import static java.nio.charset.StandardCharsets.UTF_8;

public class Main {
	public static void main(String[] args) throws SQLException {
<<<<<<< HEAD
		String connectionUrl = "jdbc:sqlserver://GL020\\SQLEXPRESS;databaseName=nursingHome;integratedSecurity=true";
=======
		String connectionUrl = "jdbc:sqlserver://SD2316\\SQLEXPRESS;databaseName=nursingHome;integratedSecurity=true";
>>>>>>> e9e820603cc666897c478862b97d02af25f4a969

		try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
			String SQL = "SELECT TOP (1000) [elder_id]\r\n"
					+ "      ,[dateOfBirth]\r\n"
					+ "      ,[first_name]\r\n"
					+ "      ,[last_name]\r\n"
					+ "  FROM [nursingHome].[dbo].[Elders]";
			ResultSet rs = stmt.executeQuery(SQL);
			String insert = "INSERT INTO Users (user_id,first_name,last_name, email, phone, dateOfBirth, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
			
// Iterate through the data in the result set and display it.
			while (rs.next()) {
				System.out.println(rs.getString("first_name") + " " + rs.getString("last_name"));
			}
		}
// Handle any errors that may have occurred.
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
}