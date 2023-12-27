/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package DispathController;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Duy Hai
 */
@WebServlet(name="DispathController", urlPatterns={"/DispathController"})
public class DispathController extends HttpServlet {
    
    private final String Home = "index.jsp";
    private final String Product = "product.jsp";
//    private final String Admin = "Admin.jsp";
//    private final String Contact = "contact.jsp";
//    private final String Order = "Order.jsp";
//    private final String Profile = "profile.jsp";
//    private final String Service = "ship_ques.jsp";
//    private final String ListOrder = "OrderedOfCustomer.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String page = request.getParameter("page");
        String url = Home;
        if(page.equals("product")){
            url=Product;
        }
//        if(page.equals("admin")){
//            url=Admin;
//        }
//        if(page.equals("contact")){
//            url=Contact;
//        }
//        if(page.equals("order")){
//            url=Order;
//        }
//        if(page.equals("profile")){
//            url=Profile;
//        }
//        if(page.equals("service")){
//            url=Service;
//        }
//        if(page.equals("ordered")){
//            url=ListOrder;
//        }
        request.getRequestDispatcher(url).forward(request, response);
    } 
}
