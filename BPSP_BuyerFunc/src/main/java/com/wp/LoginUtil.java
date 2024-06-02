package com.wp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginUtil {

    public static boolean authenticate(String username, String password) throws ClassNotFoundException, SQLException {
        Connection connection = DatabaseUtil.getConnection();
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, username);
        statement.setString(2, password);
        ResultSet resultSet = statement.executeQuery();
        boolean isAuthenticated = resultSet.next();
        connection.close();
        return isAuthenticated;
    }

    public static boolean resetPassword(String username, String newPassword) throws ClassNotFoundException, SQLException {
        Connection connection = DatabaseUtil.getConnection();
        String sql = "UPDATE users SET password = ? WHERE username = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, newPassword);
        statement.setString(2, username);
        int rowsUpdated = statement.executeUpdate();
        connection.close();
        return rowsUpdated > 0;
    }
}
