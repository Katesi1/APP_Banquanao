package com.devtides.btl_banquanao.Activity;

import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.devtides.btl_banquanao.R;
import com.devtides.btl_banquanao.adapter.GiayAdapter;
import com.devtides.btl_banquanao.model.SanPhamMoi;
import com.devtides.btl_banquanao.retrofit.Apibanhang;
import com.devtides.btl_banquanao.retrofit.RetrofitClient;
import com.devtides.btl_banquanao.utils.Utils;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class GiayActivity extends AppCompatActivity {
    Toolbar toolbar;
    RecyclerView recyclerView;
    Apibanhang apibanhang;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    int page = 1;
    int loai;
    GiayAdapter adaptergiay;
    List<SanPhamMoi> sanPhamMoiList;
    LinearLayoutManager linearLayoutManager;
    Handler handler = new Handler();
    boolean isloading = false;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_giay);
        apibanhang = RetrofitClient.getInstance(Utils.BASE_URL).create(Apibanhang.class);
        loai = getIntent().getIntExtra("loai",2);
        Anhxa();
        ActionToolBar();
        getData(page);
        addEventLoad();
    }

    private void addEventLoad() {
        recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {
            @Override
            public void onScrollStateChanged(@NonNull RecyclerView recyclerView, int newState) {
                super.onScrollStateChanged(recyclerView, newState);
            }

            @Override
            public void onScrolled(@NonNull RecyclerView recyclerView, int dx, int dy) {
                super.onScrolled(recyclerView, dx, dy);
                if (isloading == false){
                    if (linearLayoutManager.findLastCompletelyVisibleItemPosition() == sanPhamMoiList.size()-1){
                        isloading = true;
                        loadMore();
                    }
                }
            }
        });
    }

    private void loadMore() {
        handler.post(new Runnable() {
            @Override
            public void run() {
                // add null
                sanPhamMoiList.add(null);
                adaptergiay.notifyItemInserted(sanPhamMoiList.size()-1);
            }
        });
        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                //remove null
                sanPhamMoiList.remove(sanPhamMoiList.size()-1);
                adaptergiay.notifyItemRemoved(sanPhamMoiList.size());
                page = page+1;
                getData(page);
                adaptergiay.notifyDataSetChanged();
                isloading = false;
            }
        },2000);
    }

    private void getData(int page) {
        compositeDisposable.add(apibanhang.getGiay(page,loai)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        sanPhamMoiModel -> {
                            if(sanPhamMoiModel.isSuccess()){
                                if (adaptergiay == null) {
                                    sanPhamMoiList = sanPhamMoiModel.getResult();
                                    adaptergiay = new GiayAdapter(getApplicationContext(), sanPhamMoiList);
                                    recyclerView.setAdapter(adaptergiay);
                                }else {
                                    int vtri = sanPhamMoiList.size() - 1;
                                    int soluongadd = sanPhamMoiModel.getResult().size();
                                    for (int i = 0; i < soluongadd; i++) {
                                        sanPhamMoiList.add(sanPhamMoiModel.getResult().get(i));
                                    }
                                    adaptergiay.notifyItemRangeInserted(vtri, soluongadd);
                                }
                            }else {
                                Toast.makeText(getApplicationContext(),"Không còn sản phẩm",Toast.LENGTH_LONG).show();
                                isloading = true;
                            }
                        },
                        throwable -> {
                            Toast.makeText(getApplicationContext(), "Không kết nối sever", Toast.LENGTH_SHORT).show();
                        }
                ));
    }

    private void ActionToolBar() {
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }

    private void Anhxa() {
        toolbar = findViewById(R.id.toolbar);
        recyclerView = findViewById(R.id.recyclerView_Giay);
        linearLayoutManager = new LinearLayoutManager(this,LinearLayoutManager.VERTICAL,false);
        recyclerView.setLayoutManager(linearLayoutManager);
        recyclerView.setHasFixedSize(true);
        sanPhamMoiList = new ArrayList<>();
    }
    @Override
    protected void onDestroy(){
        compositeDisposable.clear();
        super.onDestroy();
    }
}