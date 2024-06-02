package com.wp;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "login";
        }

        switch (action) {
            case "home":
                handleHome(request, response);
                break;
            case "buyersList":
                handleBuyersList(request, response);
                break;
            case "logout":
                handleLogout(request, response);
                break;
            case "forgotPassword":
                handleForgotPassword(request, response);
                break;
            default:
                response.sendRedirect("login.jsp");
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "login";
        }

        if (action.equals("login")) {
            handleLogin(request, response);
        } else if (action.equals("resetPassword")) {
            handleResetPassword(request, response);
        } else {
            doGet(request, response);
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            if (LoginUtil.authenticate(username, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("Controller?action=home");
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp");
        }
    }

    private void handleHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("username", session.getAttribute("username"));
            request.getRequestDispatcher("welcome.jsp").forward(request, response);
        }
    }

    private void handleBuyersList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
        } else {
            try {
                List<Buyers_Info> buyerList = BuyersDbUtil.getBuyerList();
                request.setAttribute("buyerList", buyerList);
                request.getRequestDispatcher("show-buyer-list.jsp").forward(request, response);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("login.jsp");
    }

    private void handleForgotPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
    }

    private void handleResetPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String newPassword = request.getParameter("newPassword");

        try {
            if (LoginUtil.resetPassword(username, newPassword)) {
                response.sendRedirect("login.jsp");
            } else {
                response.sendRedirect("forgotPassword.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("forgotPassword.jsp");
        }
    }
}
