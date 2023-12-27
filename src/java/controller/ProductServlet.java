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
import dal.*;
import model.*;
import java.util.*;
import DispathController.DispathController;
public class ProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       //b1: get data from dao
        ProductDAO proDAO = new ProductDAO();
        List<img_extendsProduct> ListPro = proDAO.getAllProduct();
        List<Category> ListCa = proDAO.getAllCategorys();
        List<img_extendsProduct> ListProNew = proDAO.getAllProductNew();
        ///Phân trang
        String indexpage = request.getParameter("index");
        if(indexpage==null){
            indexpage="1";
        }
        int index = Integer.parseInt(indexpage);
        int count = ListPro.size();
        int endPage = count/12;
        if(count % 12 != 0){
            endPage++;
        }
        List<img_extendsProduct> ListPropage = proDAO.PagingProduct(index);
       //b2: set data to jsp
       ///truyền dữ liệu phân trang
       request.setAttribute("ListPro", ListPropage);
       request.setAttribute("ListCa", ListCa);
       ///truyền dữ liệu các sản phẩm mới
       request.setAttribute("ListProNew", ListProNew);
       request.setAttribute("tag", index);
       request.setAttribute("endPage", endPage);
       request.setAttribute("msg", "All Products");
       request.getRequestDispatcher("product.jsp").forward(request, response);
//        for (img_extendsProduct c : ListPro) {
//            System.out.println(c);
//        }
    } 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
