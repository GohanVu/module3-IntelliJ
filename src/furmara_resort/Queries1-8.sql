#2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select *
from nhan_vien
where (ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%') and char_length(ho_ten) <=15;

#3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from khach_hang
where (year(current_date) - year(ngay_sinh))  between 18 and 50
    and( dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị');

#4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
# Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select kh.ho_ten , count(kh.ho_ten) as so_lan_dat_phong
from khach_hang kh
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach ='Diamond'
group by kh.ho_ten
order by so_lan_dat_phong;

#5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
#(những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

SELECT kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,
       COALESCE(dv.chi_phi_thue + (SELECT SUM(hdct.so_luong * dvdk.gia)
                                   FROM hop_dong_chi_tiet hdct
                                    JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
                                   WHERE hdct.ma_hop_dong = hd.ma_hop_dong), dv.chi_phi_thue
                                    ) AS tong_tien
FROM khach_hang kh
         LEFT JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
         LEFT JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
         LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
group by kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc
order by ma_khach_hang;


#6Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng
# được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where ma_dich_vu not in(
    select ma_dich_vu
    from hop_dong
    where ngay_lam_hop_dong between '2021-01-01' and '2021-03-31')
order by dv.ma_dich_vu;

#7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các
# loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dv.ma_dich_vu, dv.ten_dich_vu,dv.dien_tich,dv.so_nguoi_toi_da,dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
left join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where dv.ma_dich_vu in (select ma_dich_vu
                        from hop_dong
                        where year(ngay_lam_hop_dong) =2020 and year(ngay_lam_hop_dong) !=2021);

#8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
select ho_ten
from khach_hang
group by  ho_ten;

select distinct ho_ten
from khach_hang;

select ho_ten
from (
    select ho_ten ,
           row_number() over (partition by ho_ten order by ho_ten) as rnk
    from khach_hang
     ) as temp
where rnk=1;

