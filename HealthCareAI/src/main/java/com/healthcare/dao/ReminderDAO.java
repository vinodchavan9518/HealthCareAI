package com.healthcare.dao;

import com.healthcare.model.MedicineReminder;
import com.healthcare.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class ReminderDAO {

    // =========================
    // ADD REMINDER
    // =========================
    public boolean addReminder(
            MedicineReminder r) {

        boolean status = false;

        String sql =
            "INSERT INTO medicine_reminders " +
            "(reminder_id, user_id, medicine_name, dosage, frequency, reminder_time, start_date, end_date, created_at) " +
            "VALUES " +
            "(reminder_seq.NEXTVAL,?,?,?,?,?,?,?,SYSDATE)";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(
                    1,
                    r.getUserId());

            ps.setString(
                    2,
                    r.getMedicineName());

            ps.setString(
                    3,
                    r.getDosage());

            ps.setString(
                    4,
                    r.getFrequency());

            ps.setString(
                    5,
                    r.getReminderTime());

            ps.setDate(
                    6,
                    new java.sql.Date(
                            r.getStartDate().getTime()));

            if(r.getEndDate() != null) {

                ps.setDate(
                        7,
                        new java.sql.Date(
                                r.getEndDate().getTime()));

            } else {

                ps.setNull(
                        7,
                        java.sql.Types.DATE);
            }

            int i =
                    ps.executeUpdate();

            System.out.println(
                    "ROWS INSERTED = " + i);

            if(i > 0) {

                status = true;
            }

            con.close();

        } catch(Exception e) {

            e.printStackTrace();
        }

        return status;
    }

    // =========================
    // GET USER REMINDERS
    // =========================
    public List<MedicineReminder>
    getUserReminders(int userId) {

        List<MedicineReminder> list =
                new ArrayList<>();

        String sql =
            "SELECT * FROM medicine_reminders " +
            "WHERE user_id=? " +
            "ORDER BY reminder_id DESC";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()) {

                MedicineReminder r =
                        new MedicineReminder();

                r.setReminderId(
                        rs.getInt("reminder_id"));

                r.setUserId(
                        rs.getInt("user_id"));

                r.setMedicineName(
                        rs.getString("medicine_name"));

                r.setDosage(
                        rs.getString("dosage"));

                r.setFrequency(
                        rs.getString("frequency"));

                r.setReminderTime(
                        rs.getString("reminder_time"));

                r.setStartDate(
                        rs.getDate("start_date"));

                r.setEndDate(
                        rs.getDate("end_date"));

                list.add(r);
            }

            con.close();

        } catch(Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    // =========================
    // DELETE REMINDER
    // =========================
    public boolean deleteReminder(
            int reminderId) {

        boolean status = false;

        String sql =
            "DELETE FROM medicine_reminders " +
            "WHERE reminder_id=?";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, reminderId);

            int i =
                    ps.executeUpdate();

            if(i > 0) {

                status = true;
            }

            con.close();

        } catch(Exception e) {

            e.printStackTrace();
        }

        return status;
    }
}