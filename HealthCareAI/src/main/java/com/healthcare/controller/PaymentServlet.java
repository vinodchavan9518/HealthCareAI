package com.healthcare.controller;

import com.healthcare.dao.PaymentDAO;
import com.healthcare.model.Payment;
import com.healthcare.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    PaymentDAO dao =
            new PaymentDAO();

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session =
                req.getSession(false);

        User user =
                (User) session.getAttribute("user");

        try {

            Payment p =
                    new Payment();

            p.setUserId(
                    user.getUserId());

            p.setApptId(
                    Integer.parseInt(
                            req.getParameter("apptId")));

            p.setAmount(
                    Double.parseDouble(
                            req.getParameter("amount")));

            p.setPaymentMethod(
                    req.getParameter("paymentMethod"));

            boolean status =
                    dao.makePayment(p);

            if(status){

                req.setAttribute(
                        "success",
                        "Payment Successful!");

            } else {

                req.setAttribute(
                        "error",
                        "Payment Failed!");
            }

        } catch(Exception e){

            req.setAttribute(
                    "error",
                    "Invalid Payment!");
        }

        req.getRequestDispatcher(
                "payment.jsp")
                .forward(req,res);
    }
}