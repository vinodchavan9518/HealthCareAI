package com.healthcare.controller;

import com.healthcare.dao.HospitalBedDAO;
import com.healthcare.model.HospitalBed;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/bed-status")
public class BedServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private HospitalBedDAO dao =
            new HospitalBedDAO();

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

        // Get All Beds
        List<HospitalBed> beds =
                dao.getAllBeds();

        // Count Available Beds
        int available = 0;

        // Count Occupied Beds
        int occupied = 0;

        for (HospitalBed b : beds) {

            if ("AVAILABLE".equalsIgnoreCase(
                    b.getStatus())) {

                available++;
            }

            if ("OCCUPIED".equalsIgnoreCase(
                    b.getStatus())) {

                occupied++;
            }
        }

        req.setAttribute(
                "beds",
                beds);

        req.setAttribute(
                "available",
                available);

        req.setAttribute(
                "occupied",
                occupied);

        req.getRequestDispatcher(
                "bed-status.jsp")
                .forward(req, res);
    }
}