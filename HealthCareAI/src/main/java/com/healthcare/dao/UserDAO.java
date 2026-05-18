package com.healthcare.dao;

import com.healthcare.model.User;
import com.healthcare.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    // REGISTER USER
    public boolean registerUser(User user) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "INSERT INTO users " +
                    "(user_id, full_name, email, password, phone, age, blood_group, role, created_at) " +
                    "VALUES (users_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setInt(5, user.getAge());
            ps.setString(6, user.getBloodGroup());
            ps.setString(7, "PATIENT");

            int i = ps.executeUpdate();

            System.out.println("Inserted Rows = " + i);

            if (i > 0) {
                status = true;
            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }

    // LOGIN USER
    public User loginUser(String email, String password) {

        User u = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                u = new User();

                u.setUserId(rs.getInt("user_id"));
                u.setFullName(rs.getString("full_name"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                u.setAge(rs.getInt("age"));
                u.setBloodGroup(rs.getString("blood_group"));
                u.setRole(rs.getString("role"));
            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return u;
    }

    // CHECK EMAIL EXISTS
    public boolean emailExists(String email) {

        boolean exists = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT COUNT(*) FROM users WHERE email=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                exists = rs.getInt(1) > 0;
            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return exists;
    }
}