package com.healthcare.dao;

import com.healthcare.model.Payment;
import com.healthcare.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class PaymentDAO {

    public boolean makePayment(Payment p) {

        boolean status = false;

        String sql =

        "INSERT INTO payments "
        + "(payment_id,user_id,appt_id,amount,payment_method,payment_status,payment_date) "
        + "VALUES "
        + "(payment_seq.NEXTVAL,?,?,?,?,?,SYSDATE)";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1,
                    p.getUserId());

            ps.setInt(2,
                    p.getApptId());

            ps.setDouble(3,
                    p.getAmount());

            ps.setString(4,
                    p.getPaymentMethod());

            ps.setString(5,
                    "SUCCESS");

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
}