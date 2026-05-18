package com.healthcare.controller;

import com.healthcare.util.AIEngine;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.*;

@WebServlet("/chatbot")
public class ChatbotServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");

        String message  = req.getParameter("message");
        String response = AIEngine.chatbotResponse(message);

        // Escape for JSON
        response = response.replace("\\", "\\\\")
                           .replace("\"", "\\\"")
                           .replace("\n", "\\n");

        PrintWriter out = res.getWriter();
        out.print("{\"response\":\"" + response + "\"}");
        out.flush();
    }
}
