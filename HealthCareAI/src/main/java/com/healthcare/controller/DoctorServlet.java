package com.healthcare.controller;

import com.healthcare.dao.DoctorDAO;
import com.healthcare.model.Doctor;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/doctor")
public class DoctorServlet extends HttpServlet {

    DoctorDAO dao =
            new DoctorDAO();

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse res)
            throws ServletException, IOException {

        String action =
                req.getParameter("action");

        if("add".equals(action)){

            Doctor d =
                    new Doctor();

            d.setFullName(
                    req.getParameter("fullName"));

            d.setSpecialization(
                    req.getParameter("specialization"));

            d.setEmail(
                    req.getParameter("email"));

            d.setPhone(
                    req.getParameter("phone"));

            d.setExperience(
                    Integer.parseInt(
                            req.getParameter("experience")));

            d.setAvailableDays(
                    req.getParameter("availableDays"));

            d.setAvailableTime(
                    req.getParameter("availableTime"));

            d.setFee(
                    Double.parseDouble(
                            req.getParameter("fee")));

            d.setHospitalName(
                    req.getParameter("hospitalName"));

            boolean status =
                    dao.addDoctor(d);

            if(status){

                req.setAttribute(
                        "success",
                        "Doctor Added Successfully!");

            } else {

                req.setAttribute(
                        "error",
                        "Failed To Add Doctor!");
            }

            req.getRequestDispatcher(
                    "add-doctor.jsp")
                    .forward(req,res);
        }
    }
}