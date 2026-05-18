package com.healthcare.dao;

import com.healthcare.model.Appointment;
import com.healthcare.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

public class AppointmentDAO {

    // =========================
    // BOOK APPOINTMENT
    // =========================
    public boolean bookAppointment(Appointment a) {

        boolean status = false;

        String sql =
            "INSERT INTO appointments " +
            "(appt_id, user_id, doctor_id, appt_date, appt_time, status, symptoms, notes, created_at) " +
            "VALUES " +
            "(appt_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";

        try {

            Connection con =
                    DBConnection.getConnection();

            System.out.println(
                    "DATABASE CONNECTED");

            PreparedStatement ps =
                    con.prepareStatement(sql);

            // USER ID
            ps.setInt(
                    1,
                    a.getUserId());

            // DOCTOR ID
            ps.setInt(
                    2,
                    a.getDoctorId());

            // APPOINTMENT DATE
            ps.setDate(
                    3,
                    new java.sql.Date(
                            a.getApptDate().getTime()));

            // APPOINTMENT TIME
            ps.setString(
                    4,
                    a.getApptTime());

            // STATUS
            ps.setString(
                    5,
                    "PENDING");

            // SYMPTOMS
            ps.setString(
                    6,
                    a.getSymptoms());

            // NOTES
            ps.setString(
                    7,
                    a.getNotes());

            int rows =
                    ps.executeUpdate();

            System.out.println(
                    "ROWS INSERTED = " + rows);

            if(rows > 0) {

                status = true;
            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }

    // =========================
    // GET USER APPOINTMENTS
    // =========================
    public List<Appointment>
    getUserAppointments(int userId) {

        List<Appointment> list =
                new ArrayList<>();

        String sql =
                "SELECT * FROM appointments " +
                "WHERE user_id=? " +
                "ORDER BY appt_date DESC";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()) {

                Appointment a =
                        new Appointment();

                a.setApptId(
                        rs.getInt("appt_id"));

                a.setUserId(
                        rs.getInt("user_id"));

                a.setDoctorId(
                        rs.getInt("doctor_id"));

                a.setApptDate(
                        rs.getDate("appt_date"));

                a.setApptTime(
                        rs.getString("appt_time"));

                a.setStatus(
                        rs.getString("status"));

                a.setSymptoms(
                        rs.getString("symptoms"));

                a.setNotes(
                        rs.getString("notes"));

                list.add(a);
            }

            con.close();

        } catch(Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    // =========================
    // GET ALL APPOINTMENTS
    // =========================
    public List<Appointment>
    getAllAppointments() {

        List<Appointment> list =
                new ArrayList<>();

        String sql =
                "SELECT * FROM appointments " +
                "ORDER BY appt_date DESC";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()) {

                Appointment a =
                        new Appointment();

                a.setApptId(
                        rs.getInt("appt_id"));

                a.setUserId(
                        rs.getInt("user_id"));

                a.setDoctorId(
                        rs.getInt("doctor_id"));

                a.setApptDate(
                        rs.getDate("appt_date"));

                a.setApptTime(
                        rs.getString("appt_time"));

                a.setStatus(
                        rs.getString("status"));

                a.setSymptoms(
                        rs.getString("symptoms"));

                a.setNotes(
                        rs.getString("notes"));

                list.add(a);
            }

            con.close();

        } catch(Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    // =========================
    // UPDATE STATUS
    // =========================
    public boolean updateStatus(
            int apptId,
            String status) {

        boolean result = false;

        String sql =
                "UPDATE appointments " +
                "SET status=? " +
                "WHERE appt_id=?";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, status);

            ps.setInt(2, apptId);

            int rows =
                    ps.executeUpdate();

            if(rows > 0) {

                result = true;
            }

            con.close();

        } catch(Exception e) {

            e.printStackTrace();
        }

        return result;
    }

    // =========================
    // DELETE APPOINTMENT
    // =========================
    public boolean deleteAppointment(
            int apptId) {

        boolean result = false;

        String sql =
                "DELETE FROM appointments " +
                "WHERE appt_id=?";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, apptId);

            int rows =
                    ps.executeUpdate();

            if(rows > 0) {

                result = true;
            }

            con.close();

        } catch(Exception e) {

            e.printStackTrace();
        }

        return result;
    }
}