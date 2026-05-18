package com.healthcare.util;

import java.sql.Connection;
import java.sql.Statement;

public class DoctorTableCreator {

    public static void createDoctorTable() {

        try {

            Connection con =
                    DBConnection.getConnection();

            Statement st =
                    con.createStatement();

            // CREATE TABLE
            String tableSql =

                "CREATE TABLE doctors ("

                + "doctor_id NUMBER PRIMARY KEY,"

                + "full_name VARCHAR2(100),"

                + "specialization VARCHAR2(100),"

                + "email VARCHAR2(100),"

                + "phone VARCHAR2(20),"

                + "experience NUMBER,"

                + "available_days VARCHAR2(100),"

                + "available_time VARCHAR2(100),"

                + "fee NUMBER,"

                + "hospital_name VARCHAR2(100)"

                + ")";

            try {

                st.executeUpdate(tableSql);

                System.out.println(
                        "DOCTORS TABLE CREATED");

            } catch(Exception e) {

                System.out.println(
                        "TABLE ALREADY EXISTS");
            }

            // CREATE SEQUENCE
            String seqSql =

                "CREATE SEQUENCE doctor_seq "
                + "START WITH 1 "
                + "INCREMENT BY 1";

            try {

                st.executeUpdate(seqSql);

                System.out.println(
                        "DOCTOR SEQUENCE CREATED");

            } catch(Exception e) {

                System.out.println(
                        "SEQUENCE ALREADY EXISTS");
            }

            con.close();

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}