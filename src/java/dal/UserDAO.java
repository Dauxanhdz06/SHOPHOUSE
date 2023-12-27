/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import model.*;

public class UserDAO extends MyDAO{
    public User getUser(String Username, String Password) {
        User user;
        xSql = "select * from [User] where username = '" + Username + "' and [password] = '" + Password + "'";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            int userid;
            String name,usern, pass, phone, address, email;
            int roleID;
            while (rs.next()) {
                userid = rs.getInt("UserID");
                name = rs.getString("Name");
                usern = rs.getString("Username");
                pass = rs.getString("Password");
                phone = rs.getString("phone");
                address = rs.getString("address");
                email = rs.getString("mail");
                roleID = rs.getInt("roleid");
                user = new User(userid, name,usern, pass, phone, address, email, roleID);
                return user;
            }
            rs.close();
            ps.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        System.out.println(dao.getUser("Seller1", "012345"));
    }
}
