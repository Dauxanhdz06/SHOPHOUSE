/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import model.*;
import dal.*;
import jakarta.servlet.RequestDispatcher;

public class LoginAccount extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd = request.getRequestDispatcher("SignIn.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        UserDAO userdao = new UserDAO();
        User user = userdao.getUser(username, password);
        if ( user == null ){
            request.setAttribute("msg", "USERNAME or PASSWORD is incorrect");
            request.getRequestDispatcher("SignIn.jsp").forward(request, response);
        }
        else{
            request.getSession().setAttribute("acc", username);
            request.getSession().setAttribute("USER", user);
//            User acc  = (User)request.getSession().getAttribute("acc");
            response.sendRedirect("DispathController?page=home");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
