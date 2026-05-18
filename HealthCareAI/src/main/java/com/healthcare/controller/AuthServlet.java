package com.healthcare.controller;

import com.healthcare.dao.UserDAO;

import com.healthcare.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet({"/login", "/register", "/logout"})
public class AuthServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAO userDAO =
            new UserDAO();

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse res)
            throws ServletException, IOException {

        String path =
                req.getServletPath();

        // LOGIN
        if ("/login".equals(path)) {

            String email =
                    req.getParameter("email");

            String password =
                    req.getParameter("password");

            User user =
                    userDAO.loginUser(
                            email,
                            password);

            if (user != null) {

                HttpSession session =
                        req.getSession();

                session.setAttribute(
                        "user",
                        user);

                session.setAttribute(
                        "userId",
                        user.getUserId());

                session.setAttribute(
                        "userName",
                        user.getFullName());

                session.setAttribute(
                        "userRole",
                        user.getRole());

                // ADMIN LOGIN
                if ("ADMIN".equals(
                        user.getRole())) {

                    res.sendRedirect(
                            "admin-dashboard.jsp");

                } else {

                    res.sendRedirect(
                            "dashboard.jsp");
                }

            } else {

                req.setAttribute(
                        "error",
                        "Invalid email or password!");

                req.getRequestDispatcher(
                        "login.jsp")
                        .forward(req, res);
            }

        }

        // REGISTER
        else if ("/register".equals(path)) {

            try {

                String email =
                        req.getParameter("email");

                // CHECK EMAIL EXISTS
                if (userDAO.emailExists(email)) {

                    req.setAttribute(
                            "error",
                            "Email already registered!");

                    req.getRequestDispatcher(
                            "register.jsp")
                            .forward(req, res);

                    return;
                }

                User user =
                        new User();

                user.setFullName(
                        req.getParameter("fullName"));

                user.setEmail(email);

                user.setPassword(
                        req.getParameter("password"));

                user.setPhone(
                        req.getParameter("phone"));

                // AGE
                String ageStr =
                        req.getParameter("age");

                if (ageStr != null &&
                        !ageStr.isEmpty()) {

                    user.setAge(
                            Integer.parseInt(ageStr));
                }

                user.setBloodGroup(
                        req.getParameter("bloodGroup"));

                boolean status =
                        userDAO.registerUser(user);

                System.out.println(
                        "REGISTER STATUS = " + status);

                if (status) {

                    req.setAttribute(
                            "success",
                            "Registration Successful! Please Login.");

                    req.getRequestDispatcher(
                            "login.jsp")
                            .forward(req, res);

                } else {

                    req.setAttribute(
                            "error",
                            "Registration failed. Try again.");

                    req.getRequestDispatcher(
                            "register.jsp")
                            .forward(req, res);
                }

            } catch (Exception e) {

                e.printStackTrace();

                req.setAttribute(
                        "error",
                        "Something went wrong!");

                req.getRequestDispatcher(
                        "register.jsp")
                        .forward(req, res);
            }
        }
    }

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse res)
            throws ServletException, IOException {

        String path =
                req.getServletPath();

        // LOGOUT
        if ("/logout".equals(path)) {

            req.getSession()
                    .invalidate();

            res.sendRedirect(
                    "login.jsp");
        }

        // LOGIN PAGE
        else if ("/login".equals(path)) {

            req.getRequestDispatcher(
                    "login.jsp")
                    .forward(req, res);
        }

        // REGISTER PAGE
        else {

            req.getRequestDispatcher(
                    "register.jsp")
                    .forward(req, res);
        }
    }
}