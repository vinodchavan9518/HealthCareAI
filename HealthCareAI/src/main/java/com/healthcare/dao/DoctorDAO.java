package com.healthcare.dao;

import com.healthcare.model.Doctor;
import com.healthcare.util.DBConnection;

import java.sql.*;
import java.util.*;

public class DoctorDAO {

    // ADD DOCTOR
    public boolean addDoctor(Doctor d) {

        boolean status = false;

        String sql =
        "INSERT INTO doctors "
        + "(doctor_id,full_name,specialization,email,phone,experience,available_days,available_time,fee,hospital_name) "
        + "VALUES "
        + "(doctor_seq.NEXTVAL,?,?,?,?,?,?,?,?,?)";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1,
                    d.getFullName());

            ps.setString(2,
                    d.getSpecialization());

            ps.setString(3,
                    d.getEmail());

            ps.setString(4,
                    d.getPhone());

            ps.setInt(5,
                    d.getExperience());

            ps.setString(6,
                    d.getAvailableDays());

            ps.setString(7,
                    d.getAvailableTime());

            ps.setDouble(8,
                    d.getFee());

            ps.setString(9,
                    d.getHospitalName());

            int i =
                    ps.executeUpdate();

            if(i > 0){

                status = true;
            }

            con.close();

        } catch(Exception e){

            e.printStackTrace();
        }

        return status;
    }

    // GET ALL DOCTORS
    public List<Doctor> getAllDoctors(){

        List<Doctor> list =
                new ArrayList<>();

        String sql =
                "SELECT * FROM doctors";

        try{

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()){

                Doctor d =
                        new Doctor();

                d.setDoctorId(
                        rs.getInt("doctor_id"));

                d.setFullName(
                        rs.getString("full_name"));

                d.setSpecialization(
                        rs.getString("specialization"));

                d.setEmail(
                        rs.getString("email"));

                d.setPhone(
                        rs.getString("phone"));

                d.setExperience(
                        rs.getInt("experience"));

                d.setAvailableDays(
                        rs.getString("available_days"));

                d.setAvailableTime(
                        rs.getString("available_time"));

                d.setFee(
                        rs.getDouble("fee"));

                d.setHospitalName(
                        rs.getString("hospital_name"));

                list.add(d);
            }

            con.close();

        } catch(Exception e){

            e.printStackTrace();
        }

        return list;
    }
}