package com.devtides.btl_banquanao.utils;

import com.devtides.btl_banquanao.model.GioHang;
import com.devtides.btl_banquanao.model.User;

import java.util.List;

public class Utils {
//    public static String localhost ="192.168.0.101:80";
//    192.168.0.101
//    public static String LinkLoaiSanPham ="http://"+ localhost +"/Android_service/getloaisp.php";
    public static final  String BASE_URL="http://192.168.0.101/Android_service/";
//10.220.54.96
//    public static final  String BASE_URL="http://10.220.54.96/Android_service/";
    public static List<GioHang> manggiohang;
    public static User user_current = new User();
}
