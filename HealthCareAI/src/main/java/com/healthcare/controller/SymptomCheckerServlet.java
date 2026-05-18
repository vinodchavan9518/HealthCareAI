package com.healthcare.controller;

import com.healthcare.model.User;
import com.healthcare.util.AIEngine;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.Map;

@WebServlet("/symptom-checker")
public class SymptomCheckerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        String symptoms = req.getParameter("symptoms");
        Map<String, String> result = AIEngine.analyzeSymptoms(symptoms);

        req.setAttribute("symptoms",   symptoms);
        req.setAttribute("disease",    result.get("disease"));
        req.setAttribute("specialist", result.get("specialist"));
        req.setAttribute("severity",   result.get("severity"));
        req.setAttribute("advice",     result.get("advice"));

        req.getRequestDispatcher("symptom-result.jsp").forward(req, res);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("symptom-checker.jsp").forward(req, res);
    }
}
