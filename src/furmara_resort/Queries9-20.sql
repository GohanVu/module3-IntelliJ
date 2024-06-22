#9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021
# thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(ngay_lam_hop_dong) as thang , count(ngay_lam_hop_dong) as total
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by month(ngay_lam_hop_dong)
order by month(ngay_lam_hop_dong);

#10.Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
# Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc
     ,ifnull(sum(hdct.so_luong),0) as so_luong_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc
order by hd.ma_hop_dong;

#11.Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có
# ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from khach_hang kh
left join loai_khach lk on kh.ma_khach_hang = lk.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
join hop_dong_chi_tiet hdct  on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk  on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where lk.ten_loai_khach = 'Gold' and (kh.dia_chi like '%Vinh%' or kh.dia_chi like 'Quảng Ngãi')
order by ma_dich_vu_di_kem;

#12.Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng),
# ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc
# của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong,hd.ngay_lam_hop_dong, nv.ho_ten , kh.ho_ten, kh.so_dien_thoai,
       dv.ten_dich_vu , ifnull(sum(hdct.so_luong),0) as so_luong_dich_vu_di_kem ,sum(hd.tien_dat_coc) as tien_dat_coc
from hop_dong hd
left join  khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
left join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct  on hd.ma_hop_dong = hdct.ma_hop_dong
where hd.ngay_lam_hop_dong in (select ngay_lam_hop_dong from hop_dong
                            where  ngay_lam_hop_dong between '2020-10-01' and '2020-12-31')
  and hd.ngay_lam_hop_dong not in (select ngay_lam_hop_dong from hop_dong
                                where ngay_lam_hop_dong between '2021-01-01' and '2021-06-30')
group by hd.ma_hop_dong, hd.ngay_lam_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu;


#13.Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
# (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select hdct.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem , sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong_chi_tiet hdct
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
having so_luong_dich_vu_di_kem = (select sum(so_luong)  as total from hop_dong_chi_tiet
                        group by ma_dich_vu_di_kem order by total desc limit 1);


#14.Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
# Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung
# (được tính dựa trên việc count các ma_dich_vu_di_kem).

select dvdk.ten_dich_vu_di_kem , count(dvdk.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong_chi_tiet hdct
join furama_resort.dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ten_dich_vu_di_kem
having so_lan_su_dung =1;

#15.Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai,
# dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.


select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, count(hd.ma_hop_dong) as tong_so_hop_dong
from hop_dong hd
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
where hd.ngay_lam_hop_dong between '2020-01-01' and '2021-12-31'
group by nv.ma_nhan_vien, nv.ho_ten, nv.so_dien_thoai
having tong_so_hop_dong <=3;

#16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SET SQL_SAFE_UPDATES = 0;
delete nv
from nhan_vien nv
left join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
and year(hd.ngay_lam_hop_dong) between  2019 and 2021
where hd.ma_hop_dong is null;
SET SQL_SAFE_UPDATES = 1;


#17.Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
# chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
set sql_safe_updates =0;
UPDATE loai_khach
SET ten_loai_khach = 'Diamond'
WHERE loai_khach.ma_loai_khach IN (
    SELECT kh.ma_khach_hang
    FROM khach_hang kh
             JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
             JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
    WHERE YEAR(hd.ngay_lam_hop_dong) = 2021
    GROUP BY kh.ma_khach_hang
    HAVING SUM(COALESCE(dv.chi_phi_thue + (
        SELECT SUM(hdct.so_luong * dvdk.gia)
        FROM hop_dong_chi_tiet hdct
                 JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
        WHERE hdct.ma_hop_dong = hd.ma_hop_dong
    ), dv.chi_phi_thue)) > 10000000
);
set sql_safe_updates = 1;

#18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set sql_safe_updates =0;
alter table hop_dong
drop foreign key hop_dong_ibfk_2;

delete kh.*
from khach_hang kh
join furama_resort.hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where year(hd.ngay_lam_hop_dong) < 2021;

alter table hop_dong
add constraint hop_dong_ibfk_2
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang);
set  sql_safe_updates =1;

#19.Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
set sql_safe_updates =0;
update dich_vu_di_kem
set gia= gia*2
where ma_dich_vu_di_kem in(
    select hdct.ma_dich_vu_di_kem
    from hop_dong_chi_tiet hdct
    join furama_resort.hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
    where year(hd.ngay_lam_hop_dong)= 2020
    group by hdct.ma_dich_vu_di_kem
    having sum(hdct.so_luong) > 10
    );
set sql_safe_updates =1;

#20.Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
# thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select ma_nhan_vien as id, ho_ten as ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union  all
select ma_khach_hang , ho_ten , email, so_dien_thoai,ngay_sinh,dia_chi
from khach_hang;