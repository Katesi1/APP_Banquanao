package com.devtides.btl_banquanao.Activity;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.AppCompatButton;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.devtides.btl_banquanao.R;
import com.devtides.btl_banquanao.retrofit.Apibanhang;
import com.devtides.btl_banquanao.retrofit.RetrofitClient;
import com.devtides.btl_banquanao.utils.Utils;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class DangKiActivity extends AppCompatActivity {
    EditText email,pass,repass,tenkhachhang,dienthoai;
    AppCompatButton button;
    Apibanhang apibanhang;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_dang_ki);
        initView();
        initControl();
    }

    private void initControl() {
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dangKi();
            }
        });
    }

    private void dangKi() {
        String str_email = email.getText().toString().trim();
        String str_pass = pass.getText().toString().trim();
        String str_repass = repass.getText().toString().trim();
        String str_ten = tenkhachhang.getText().toString().trim();
        String str_dienthoai = dienthoai.getText().toString().trim();

        if (TextUtils.isEmpty(str_email)){
            Toast.makeText(getApplicationContext(),"Bạn chưa nhập Email", Toast.LENGTH_LONG).show();
        }else if (TextUtils.isEmpty(str_pass)){
            Toast.makeText(getApplicationContext(),"Bạn chưa nhập Pass", Toast.LENGTH_LONG).show();
        }else if (TextUtils.isEmpty(str_repass)){
            Toast.makeText(getApplicationContext(),"Bạn chưa nhập Repass", Toast.LENGTH_LONG).show();
        }else if (TextUtils.isEmpty(str_dienthoai)){
            Toast.makeText(getApplicationContext(),"Bạn chưa nhập Mobile", Toast.LENGTH_LONG).show();
        }else if (TextUtils.isEmpty(str_ten)){
            Toast.makeText(getApplicationContext(),"Bạn chưa nhập Name", Toast.LENGTH_LONG).show();
        }else {
            if (str_pass.equals(str_repass)){
                //post data
                compositeDisposable.add(apibanhang.dangKi(str_email,str_pass,str_ten,str_dienthoai)
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe(
                                userModel -> {
                                    if (userModel.isSuccess()){
                                        Utils.user_current.setEmail(str_email);
                                        Utils.user_current.setPass(str_pass);
                                        Intent intent = new Intent(getApplicationContext(), DangNhapActivity.class);
                                        startActivity(intent);
                                        finish();
//                                        Toast.makeText(getApplicationContext(),"Thành công", Toast.LENGTH_LONG).show();
                                    }else {
                                        Toast.makeText(getApplicationContext(),userModel.getMessage(), Toast.LENGTH_LONG).show();
                                    }
                                },throwable -> {
                                    Toast.makeText(getApplicationContext(),throwable.getMessage(), Toast.LENGTH_LONG).show();
                                }
                        ));
            }else {
                    Toast.makeText(getApplicationContext(),"Pass chưa khớp ", Toast.LENGTH_LONG).show();
            }
        }
    }

    private void initView() {
        apibanhang = RetrofitClient.getInstance(Utils.BASE_URL).create(Apibanhang.class);

        email = findViewById(R.id.email);
        pass = findViewById(R.id.pass);
        repass = findViewById(R.id.repass);
        tenkhachhang = findViewById(R.id.tenkhachhang);
        dienthoai = findViewById(R.id.dienthoai);
        button = findViewById(R.id.btndangki);
    }

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }
}