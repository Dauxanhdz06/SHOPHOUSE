/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.util.*;

public class Product {
    private String productID;
    private String productNam;
    private String productPrice;
    private String detail;
    private int quantity;
    private String categoryID;
    private String createby;
    private String Type;
    private Date createDate;
    private int voting;

    public Product() {
    }

    public Product(String productID, String productNam, String productPrice, String detail, int quantity, String categoryID, String createby, String Type, Date createDate, int voting) {
        this.productID = productID;
        this.productNam = productNam;
        this.productPrice = productPrice;
        this.detail = detail;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.createby = createby;
        this.Type = Type;
        this.createDate = createDate;
        this.voting = voting;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductNam() {
        return productNam;
    }

    public void setProductNam(String productNam) {
        this.productNam = productNam;
    }

    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getCreateby() {
        return createby;
    }

    public void setCreateby(String createby) {
        this.createby = createby;
    }

    public String getType() {
        return Type;
    }

    public void setType(String Type) {
        this.Type = Type;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getVoting() {
        return voting;
    }

    public void setVoting(int voting) {
        this.voting = voting;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", productNam=" + productNam + ", productPrice=" + productPrice + ", detail=" + detail + ", quantity=" + quantity + ", categoryID=" + categoryID + ", createby=" + createby + ", Type=" + Type + ", createDate=" + createDate + ", voting=" + voting + '}';
    }

}
