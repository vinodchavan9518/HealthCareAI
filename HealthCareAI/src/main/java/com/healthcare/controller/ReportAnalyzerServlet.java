package com.healthcare.controller;

import com.healthcare.util.AIEngine;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/report-analyzer")
public class ReportAnalyzerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        String reportText = req.getParameter("reportText");
        String analysis   = AIEngine.analyzeReport(reportText);

        req.setAttribute("reportText", reportText);
        req.setAttribute("analysis",   analysis);
        req.getRequestDispatcher("report-result.jsp").forward(req, res);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("report-analyzer.jsp").forward(req, res);
    }
}
