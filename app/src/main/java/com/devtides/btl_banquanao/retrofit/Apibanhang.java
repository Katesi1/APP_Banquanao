package com.devtides.btl_banquanao.retrofit;

import com.devtides.btl_banquanao.model.LoaiSpModel;
import com.devtides.btl_banquanao.model.SanPhamMoiModel;
import com.devtides.btl_banquanao.model.UserModel;

import io.reactivex.rxjava3.core.Observable;
import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.GET;
import retrofit2.http.POST;

public interface Apibanhang {
    //GET DATA
    @GET("getloaisp.php")
    Observable<LoaiSpModel> getLoaiSp();

    @GET("getspmoi.php")
    Observable<SanPhamMoiModel> getSpMoi();

    //POST DATA
    @POST("chitiet.php")
    @FormUrlEncoded
    Observable<SanPhamMoiModel> getAo(
        @Field("page") int page,
        @Field("loai") int loai
    );
    @POST("chitietgiay.php")
    @FormUrlEncoded
    Observable<SanPhamMoiModel> getGiay(
            @Field("page") int page,
            @Field("loai") int loai
    );
    @POST("Dangki.php")
    @FormUrlEncoded
    Observable<UserModel> dangKi(
            @Field("email") String email,
            @Field("matkhau") String pass,
            @Field("tenkhachhang") String tenkhachhang,
            @Field("dienthoai") String dienthoai
    );
    @POST("dangnhap.php")
    @FormUrlEncoded
    Observable<UserModel> dangNhap(
            @Field("email") String email,
            @Field("matkhau") String pass
    );
    @POST("reset.php")
    @FormUrlEncoded
    Observable<UserModel> resetPass(
            @Field("email") String email
    );
}
