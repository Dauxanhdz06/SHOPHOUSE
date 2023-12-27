/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import model.*;
import java.sql.Date;
public class ProductDAO extends MyDAO{
/////lay tat ca san pham co trong bang Product
    public List<img_extendsProduct> getAllProduct(){
        List<img_extendsProduct> listPro = new ArrayList<>();
        xSql = "SELECT p.productID,p.productName,p.productPrice,p.detail,p.quantity,p.categoryID,p.created_By,p.type,p.CreateDate,p.voting,pi.IMGID,pi.url\n" +
               "FROM Product p JOIN ProductImg pi ON p.productID = pi.productID;";
        try{
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            String productNam,productPrice, detail, categoryID, createby, Type, productID, ImgID, url;
            int quantity, voting;
            img_extendsProduct proandimg;
            Date createDate;
            while(rs.next()){
                productID = rs.getString("productID");
                productNam = rs.getString("productName");
                productPrice = rs.getString("productPrice");
                detail = rs.getString("detail");
                quantity = rs.getInt("quantity");
                categoryID = rs.getString("categoryID");
                createby = rs.getString("created_By");
                Type = rs.getString("type");
                createDate = rs.getDate("CreateDate");
                ImgID = rs.getString("IMGID");
                url = rs.getString("url");
                voting = rs.getInt("voting");
                proandimg = new img_extendsProduct(productID, productNam, productPrice, detail, quantity, categoryID, createby, Type, createDate, voting, ImgID, url);
                listPro.add(proandimg);
            }
            rs.close();
            ps.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return listPro;
}
////Lay tat ca Category
    public List<Category> getAllCategorys(){
        List<Category> listCategory = new ArrayList<>();
        xSql = "SELECT * from Category";
        try{
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            String categoryID, categoryName;
            Category Cate;
            while(rs.next()){
                categoryID = rs.getString("categoryID");
                categoryName = rs.getString("categoryName");
                Cate = new Category(categoryID, categoryName);
                listCategory.add(Cate);
            }
            rs.close();
            ps.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return listCategory;
    }
    ////San pham moi nhat
    public List<img_extendsProduct> getAllProductNew(){
        List<img_extendsProduct> listProNew = new ArrayList<>();
        xSql = "SELECT p.productID, p.productName, p.productPrice, p.detail, p.quantity, p.categoryID, p.created_By, p.type, p.CreateDate, p.voting, pi.IMGID, pi.url\n" +
               "FROM Product p JOIN ProductImg pi ON p.productID = pi.productID ORDER BY CAST(SUBSTRING(p.productID, 3, LEN(p.productID)) AS INT);";
        try{
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            String productNam,productPrice, detail, categoryID, createby, Type, productID, ImgID, url;
            int quantity, voting;
            img_extendsProduct proandimg;
            Date createDate;
            while(rs.next()){
                productID = rs.getString("productID");
                productNam = rs.getString("productName");
                productPrice = rs.getString("productPrice");
                detail = rs.getString("detail");
                quantity = rs.getInt("quantity");
                categoryID = rs.getString("categoryID");
                createby = rs.getString("created_By");
                Type = rs.getString("type");
                createDate = rs.getDate("CreateDate");
                ImgID = rs.getString("IMGID");
                url = rs.getString("url");
                voting = rs.getInt("voting");
                proandimg = new img_extendsProduct(productID, productNam, productPrice, detail, quantity, categoryID, createby, Type, createDate, voting, ImgID, url);
                listProNew.add(proandimg);
            }
            rs.close();
            ps.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return listProNew;
}  
////Lấy Sản phẩm trong bảng chọn Category   
        public List<img_extendsProduct> getAllProductAccesories(String cateID){
        List<img_extendsProduct> listProAC = new ArrayList<>();
        xSql = "SELECT p.productID,p.productName,p.productPrice,p.detail,p.quantity,p.categoryID,p.created_By,p.type,p.CreateDate,p.voting,pi.IMGID,pi.url\n" +
               "FROM Product p JOIN ProductImg pi ON p.productID = pi.productID WHERE p.productID LIKE '" + cateID + "%';";
        try{
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            String productNam,productPrice, detail, categoryID, createby, Type, productID, ImgID, url;
            int quantity, voting;
            img_extendsProduct proandimg;
            Date createDate;
            while(rs.next()){
                productID = rs.getString("productID");
                productNam = rs.getString("productName");
                productPrice = rs.getString("productPrice");
                detail = rs.getString("detail");
                quantity = rs.getInt("quantity");
                categoryID = rs.getString("categoryID");
                createby = rs.getString("created_By");
                Type = rs.getString("type");
                createDate = rs.getDate("CreateDate");
                ImgID = rs.getString("IMGID");
                url = rs.getString("url");
                voting = rs.getInt("voting");
                proandimg = new img_extendsProduct(productID, productNam, productPrice, detail, quantity, categoryID, createby, Type, createDate, voting, ImgID, url);
                listProAC.add(proandimg);
            }
            rs.close();
            ps.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return listProAC;
}
////Phân trang all product (mỗi trang 12 sản phẩm)
    public List<img_extendsProduct> PagingProduct(int index){
        List<img_extendsProduct> ListPro = new ArrayList<>();
        try{
            String sql = "SELECT p.productID, p.productName, p.productPrice, p.detail, p.quantity, p.categoryID, p.created_By, p.type, p.CreateDate, p.voting, pi.IMGID, pi.url\n" +
             "FROM Product p JOIN ProductImg pi ON p.productID = pi.productID "
                    + "ORDER BY CAST(SUBSTRING(p.productID, 3, LEN(p.productID)) AS INT) "
                    + "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY;";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setInt(1, (index - 1)*12);
            ResultSet rs = pr.executeQuery();
            while(rs.next()){
                ListPro.add(new img_extendsProduct(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getInt(10), rs.getString(11), rs.getString(12)));
            }
        } catch(Exception ex){
            ex.printStackTrace();
        }
        return ListPro;
    }
////Phân trang all product of category(mỗi trang 12 sản phẩm)
    public List<img_extendsProduct> PagingProductCate(int index, String productID){
        List<img_extendsProduct> ListPro = new ArrayList<>();
        try{
            String sql = "SELECT p.productID, p.productName, p.productPrice, p.detail, p.quantity, p.categoryID, p.created_By, p.type, p.CreateDate, p.voting, pi.IMGID, pi.url\n" +
            "FROM Product p JOIN ProductImg pi ON p.productID = pi.productID WHERE p.productID LIKE '" + productID + "%'\n" +
            "ORDER BY CAST(SUBSTRING(p.productID, 3, LEN(p.productID)) AS INT)\n" +
            "OFFSET " + index + " ROWS FETCH NEXT 12 ROWS ONLY;";
            PreparedStatement pr = connection.prepareStatement(sql);
//            pr.setString(1, productID);
//            pr.setInt(2, (index - 1)*12);
            ResultSet rs = pr.executeQuery();
            while(rs.next()){
                ListPro.add(new img_extendsProduct(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getInt(10), rs.getString(11), rs.getString(12)));
            }
        } catch(Exception ex){
            ex.printStackTrace();
        }
        return ListPro;
    }
    public static void main(String[] args) {
       ProductDAO proDAO = new ProductDAO();
       List<img_extendsProduct> ListPro = proDAO.PagingProductCate(0, "AC");
        for (img_extendsProduct c : ListPro) {
            System.out.println(c);
        }
//        System.out.println(proDAO.getAllProductAccesories("AC"));
//        List<img_extendsProduct> ListPro = proDAO.getAllProductAccesories("AC");
//        for (img_extendsProduct c  : ListPro) {
//            System.out.println(c);
//        }
//test all Product      
//       List<img_extendsProduct> ListPro = proDAO.getAllProduct();
//        for (img_extendsProduct c  : ListPro) {
//            System.out.println(c);
//        }
////test category list
//         List<Category> ListCa = proDAO.getAllCategorys();
//         for (Category c : ListCa) {
//             System.out.println(c);
//        }
////test Accesories list
//           List<img_extendsProduct> ListAC = proDAO.getAllProductAccesories();
//           for (img_extendsProduct c : ListAC) {
//               System.out.println(c);
//        }
////test Jacket list
//           List<img_extendsProduct> ListJA = proDAO.getAllProductNew();
//           for (img_extendsProduct c : ListJA) {
//               System.out.println(c);
//        }
    }
}
