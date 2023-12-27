/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author DELL
 */
public class img_extendsProduct extends Product{
    private String ImgID;
    private String url;

    public img_extendsProduct() {
    }

    public img_extendsProduct(String ImgID, String url) {
        this.ImgID = ImgID;
        this.url = url;
    }

    public img_extendsProduct(String productID, String productNam, String productPrice, String detail, int quantity, String categoryID, String createby, String Type, Date createDate, int voting, String ImgID, String url) {
        super(productID, productNam, productPrice, detail, quantity, categoryID, createby, Type, createDate, voting);
        this.ImgID = ImgID;
        this.url = url;
    }

    public String getImgID() {
        return ImgID;
    }

    public void setImgID(String ImgID) {
        this.ImgID = ImgID;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "img_extendsProduct{" + "ImgID=" + ImgID + ", url=" + url + '}';
    }
}
