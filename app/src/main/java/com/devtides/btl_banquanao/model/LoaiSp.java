package com.devtides.btl_banquanao.model;

public class LoaiSp {
    int ID;
    String Tensanpham;
    String Hinhanhsanpham;

    public LoaiSp(int ID, String tensanpham, String hinhanhsanpham) {
        this.ID = ID;
        Tensanpham = tensanpham;
        Hinhanhsanpham = hinhanhsanpham;
    }

    public int getID() {
        return ID;
    }

    public String getTensanpham() {
        return Tensanpham;
    }

    public String getHinhanhsanpham() {
        return Hinhanhsanpham;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public void setTensanpham(String tensanpham) {
        Tensanpham = tensanpham;
    }

    public void setHinhanhsanpham(String hinhanhsanpham) {
        Hinhanhsanpham = hinhanhsanpham;
    }
}
