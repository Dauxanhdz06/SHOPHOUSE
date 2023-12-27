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
import java.util.List;
import model.*;
import dal.*;
public class CategoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO proDAO = new ProductDAO();
        ///Lấy categoryID
        String cateID = request.getParameter("categoryID");
        List<Category> ListCa = proDAO.getAllCategorys();
        List<img_extendsProduct> ListProNew = proDAO.getAllProductNew();
        ///Lấy sản phẩm từ Category
        List<img_extendsProduct> ListChose = proDAO.getAllProductAccesories(cateID);
        //b2: set data to jsp
        ///Thông báo hiển thị
        for (Category c : ListCa) {
            if (c.getCategoryID().equals(cateID)) {
                request.setAttribute("msg", c.getCategoryName());
            }
        }
        ///Phân trang của sản phẩm trong phân loại
        String indexpage = request.getParameter("index");
        if(indexpage==null){
            indexpage="1";
        }
        int index = Integer.parseInt(indexpage);
        int count = ListChose.size();
        int endPage = count/12;
        if(count % 12 != 0){
            endPage++;
        }
        List<img_extendsProduct> ListPropage = proDAO.PagingProductCate(index, cateID);
        ///highline your chose
        request.setAttribute("CateID", cateID);
        request.setAttribute("ListCa", ListCa);
        request.setAttribute("ListProNew", ListProNew);
        ///Truyền dữ liệu phân trang
        request.setAttribute("tag", index);
        request.setAttribute("endPage", endPage);
        request.setAttribute("ListPro", ListPropage);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
