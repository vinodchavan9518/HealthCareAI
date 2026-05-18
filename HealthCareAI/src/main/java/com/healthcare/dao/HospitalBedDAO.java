package com.healthcare.dao;

import com.healthcare.model.HospitalBed;
import com.healthcare.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HospitalBedDAO {

    public List<HospitalBed> getAllBeds() {

        List<HospitalBed> list =
                new ArrayList<>();

        String sql =
                "SELECT * FROM hospital_beds";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                HospitalBed bed =
                        new HospitalBed();

                bed.setBedId(
                        rs.getInt("bed_id"));

                bed.setWardName(
                        rs.getString("ward_name"));

                bed.setBedNumber(
                        rs.getString("bed_number"));

                bed.setBedType(
                        rs.getString("bed_type"));

                bed.setStatus(
                        rs.getString("status"));

                list.add(bed);
            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }
}