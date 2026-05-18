package com.healthcare.controller;

import com.healthcare.dao.MedicineReminderDAO;
import com.healthcare.model.MedicineReminder;
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

@WebServlet("/reminder")
public class ReminderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MedicineReminderDAO dao =
            new MedicineReminderDAO();

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session =
                req.getSession(false);

        // Check Login
        if (session == null ||
                session.getAttribute("user") == null) {

            res.sendRedirect("login.jsp");
            return;
        }

        User user =
                (User) session.getAttribute("user");

        String action =
                req.getParameter("action");

        // ADD REMINDER
        if ("add".equals(action)) {

            try {

                MedicineReminder reminder =
                        new MedicineReminder();

                reminder.setUserId(
                        user.getUserId());

                reminder.setMedicineName(
                        req.getParameter("medicineName"));

                reminder.setDosage(
                        req.getParameter("dosage"));

                reminder.setFrequency(
                        req.getParameter("frequency"));

                reminder.setReminderTime(
                        req.getParameter("reminderTime"));

                SimpleDateFormat sdf =
                        new SimpleDateFormat("yyyy-MM-dd");

                reminder.setStartDate(
                        sdf.parse(
                                req.getParameter("startDate")));

                String endDate =
                        req.getParameter("endDate");

                if (endDate != null &&
                        !endDate.isEmpty()) {

                    reminder.setEndDate(
                            sdf.parse(endDate));
                }

                boolean status =
                        dao.addReminder(reminder);

                if (status) {

                    req.setAttribute(
                            "success",
                            "Reminder Added Successfully!");

                } else {

                    req.setAttribute(
                            "error",
                            "Failed To Add Reminder!");
                }

            } catch (Exception e) {

                req.setAttribute(
                        "error",
                        "Invalid Data!");
            }
        }

        List<MedicineReminder> list =
                dao.getUserReminders(
                        user.getUserId());

        req.setAttribute(
                "reminders",
                list);

        req.getRequestDispatcher(
                "medicine-reminder.jsp")
                .forward(req, res);
    }

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session =
                req.getSession(false);

        // Check Login
        if (session == null ||
                session.getAttribute("user") == null) {

            res.sendRedirect("login.jsp");
            return;
        }

        User user =
                (User) session.getAttribute("user");

        String action =
                req.getParameter("action");

        // DELETE REMINDER
        if ("delete".equals(action)) {

            int id =
                    Integer.parseInt(
                            req.getParameter("id"));

            dao.deleteReminder(id);
        }

        List<MedicineReminder> list =
                dao.getUserReminders(
                        user.getUserId());

        req.setAttribute(
                "reminders",
                list);

        req.getRequestDispatcher(
                "medicine-reminder.jsp")
                .forward(req, res);
    }
}