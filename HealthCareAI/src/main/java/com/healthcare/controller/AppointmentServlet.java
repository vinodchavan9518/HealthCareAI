package com.healthcare.controller;

import com.healthcare.dao.AppointmentDAO;
import com.healthcare.model.Appointment;
import com.healthcare.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet({"/appointment", "/my-appointments"})
public class AppointmentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AppointmentDAO dao =
            new AppointmentDAO();

    // ==========================
    // BOOK APPOINTMENT
    // ==========================
    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session =
                req.getSession(false);

        // CHECK LOGIN
        if (session == null ||
                session.getAttribute("user") == null) {

            res.sendRedirect("login.jsp");
            return;
        }

        User user =
                (User) session.getAttribute("user");

        String action =
                req.getParameter("action");

        // ==========================
        // BOOK APPOINTMENT
        // ==========================
        if ("book".equals(action)) {

            try {

                Appointment a =
                        new Appointment();

                // USER ID
                a.setUserId(
                        user.getUserId());

                // DOCTOR ID
                String doctorId =
                        req.getParameter("doctorId");

                a.setDoctorId(
                        Integer.parseInt(doctorId));

                // APPOINTMENT DATE
                String date =
                        req.getParameter("apptDate");

                a.setApptDate(
                        new SimpleDateFormat(
                                "yyyy-MM-dd")
                                .parse(date));

                // TIME
                a.setApptTime(
                        req.getParameter("apptTime"));

                // SYMPTOMS
                a.setSymptoms(
                        req.getParameter("symptoms"));

                // NOTES
                a.setNotes(
                        req.getParameter("notes"));

                System.out.println(
                        "USER ID = " +
                                a.getUserId());

                System.out.println(
                        "DOCTOR ID = " +
                                a.getDoctorId());

                System.out.println(
                        "DATE = " +
                                a.getApptDate());

                // SAVE
                boolean status =
                        dao.bookAppointment(a);

                System.out.println(
                        "BOOKING STATUS = " +
                                status);

                if(status) {

                    req.setAttribute(
                            "success",
                            "Appointment booked successfully!");

                } else {

                    req.setAttribute(
                            "error",
                            "Booking failed!");
                }

            } catch (Exception e) {

                e.printStackTrace();

                req.setAttribute(
                        "error",
                        "ERROR : " +
                                e.getMessage());
            }

            req.getRequestDispatcher(
                    "book-appointment.jsp")
                    .forward(req, res);
        }
    }

    // ==========================
    // VIEW APPOINTMENTS
    // ==========================
    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session =
                req.getSession(false);

        // CHECK LOGIN
        if (session == null ||
                session.getAttribute("user") == null) {

            res.sendRedirect("login.jsp");
            return;
        }

        User user =
                (User) session.getAttribute("user");

        try {

            List<Appointment> list =
                    dao.getUserAppointments(
                            user.getUserId());

            req.setAttribute(
                    "appointments",
                    list);

        } catch (Exception e) {

            e.printStackTrace();
        }

        req.getRequestDispatcher(
                "my-appointments.jsp")
                .forward(req, res);
    }
}