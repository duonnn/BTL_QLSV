create database QUANLYSINHVIENDH;
use QUANLYSINHVIENDH;
----------------------------------------------------------------------------------------------------------------

create table Nganh (
	Manganh int not null primary key,
	Tennganh nvarchar(100) not null,
);

insert into Nganh values 
(1111,N'Công nghệ thông tin'),
(2222,N'Kĩ thuật phần mềm'),
(3333,N'Truyền thông mạng máy tính');

create table SinhVien (
	MaSV int not null primary key,
	TenSV nvarchar(100) not null,
	Gioitinh nvarchar(10),
	Diachi nvarchar(150),
	Dienthoai nvarchar(20),
	Khoahoc nvarchar(20),
	Hedaotao nvarchar(20),
	Manganh int not null foreign key references Nganh(Manganh),	
);

insert into SinhVien values
(90113, N'Bùi Lưu Thiên An', N'Nữ', N'Hải Phòng', N'0914596511', N'K62', N'Đại học',1111),
(91319, N'Bùi Thị Thu Phương', N'Nữ', N'Thái Bình', N'0399609093', N'K62', N'Đại học',2222),
(92145, N'Bùi Minh Khuê', N'Nữ', N'Hải Phòng', N'0856742687', N'K62', N'Đại học',3333),
(92336, N'Cao Thị Hoàng Dương', N'Nữ', N'Hải Phòng', N'0796494301', N'K62', N'Đại học',1111),
(92438, N'Nguyễn Thu Thảo', N'Nữ', N'Hải Phòng', N'0757248698', N'K62', N'Đại học',2222),
(93644, N'Đinh Thị Thu Hằng', N'Nữ', N'Quảng Ninh', N'0568349742', N'K62', N'Đại học',3333);


select MaSV,TenSV, Gioitinh, Diachi, Dienthoai,Khoahoc, Hedaotao, Tennganh from SinhVien inner join Nganh on SinhVien.Manganh = Nganh.Manganh;

-----------------------------------------------------------------------------------------------------------------
drop table MonHoc

create table MonHoc (
	Mamonhoc int not null primary key,
	Tenmonhoc nvarchar(100) not null,
	Sotinchi int not null,
);

insert into MonHoc values 
(11401,N'Pháp luật đại cương',2),
(17102,N'Tin học văn phòng',3),
(17104,N'Tin học đại cương',3),
(17200,N'Giới thiệu ngành CNTT',2),
(17206,N'Kỹ thuật lập trình C',3),
(17211,N'Đồ họa máy tính',3),
(17212,N'An toàn và bảo mật thông tin',3),
(17226,N'Thị giác máy tính',3),
(17230,N'Lập trình Python',3),
(17231,N'Kỹ thuật học sâu và ứng dụng',3),
(17233,N'Cấu trúc dữ liệu và giải thuật',3),
(17302,N'Kiến trúc máy tính và TBNV',3),
(17303,N'Nguyên lý hệ điều hành',2),
(17304,N'Bảo trì hệ thống',2),
(17332,N'Công nghệ Internet of Things',3),
(17335,N'Lập trình Windows',3),
(17426,N'Cơ sở dữ liệu',3),
(17427,N'Phân tích và thiết kế hệ thống',3),
(17432,N'Nhập môn công nghệ phần mềm',2),
(17499,N'Phân tích thiết kế hệ thống hướng đối tượng',3),
(17509,N'Thiết kế và quản trị mạng',3),
(17523,N'Java cơ bản',3),
(17540,N'An ninh mạng',3),
(17543,N'Thương mại điện tử',3),
(18124,N'Toán cao cấp',4),
(19101,N'Triết học Mác Lênin',3),
(19401,N'Kinh tế chính trị Mác Lênin',2),
(17532,N'Chủ nghĩ xã hội khoa học',2);

----------------------------------------------------------------------------------------------------------------
drop table ChiTietMonHoc

create table ChiTietMonHoc (
	Ma int identity (101,1) not null primary key,
	Hocky int,
	Namhoc nvarchar(50),
	MaSV int not null foreign key references SinhVien,
	Mamonhoc int not null foreign key references MonHoc,
);

insert into ChiTietMonHoc values 
(1,N'2022 - 2023',90113,17335),
(1,N'2022 - 2023',90113,17332),

(1,N'2022 - 2023',91319,18124),
(1,N'2022 - 2023',91319,17532),

(1,N'2022 - 2023',92145,17523),
(1,N'2022 - 2023',92145,19101),

(1,N'2022 - 2023',92336,17226),
(1,N'2022 - 2023',92336,17304),
(1,N'2022 - 2023',92336,17104),

(1,N'2022 - 2023',92438,17426),
(1,N'2022 - 2023',92438,17231),

(1,N'2022 - 2023',93644,11401),
(1,N'2022 - 2023',93644,17200);

select * from ChiTietMonHoc

select distinct SinhVien.MaSV, TenSV, Hocky, Namhoc, MonHoc.Tenmonhoc
from Chitietmonhoc left join MonHoc on ChiTietMonHoc.Mamonhoc = MonHoc.Mamonhoc 
					left join SinhVien on SinhVien.MaSV = ChiTietMonHoc.MaSV
					
delete from Chitietmonhoc 
from Chitietmonhoc inner join SinhVien on SinhVien.MaSV = ChiTietMonHoc.MaSV
WHERE SinhVien.MaSV = 90145 and Mamonhoc = 17426

delete from HocPhi 
from ((HocPhi inner join SinhVien on HocPhi.MaSV = SinhVien.MaSV) 
inner join Chitietmonhoc on Chitietmonhoc.Ma = HocPhi.Ma)
where SinhVien.MaSV = 90145 and Hocky = 2 and Namhoc = N'2023 - 2024';

insert into Chitietmonhoc(Namhoc, Hocky, Mamonhoc, MaSV)
select N'2023 - 2024', 1, Monhoc.Mamonhoc, SinhVien.MaSV from Monhoc, SinhVien
where Tenmonhoc = N'Toán cao cấp' and SinhVien.MaSV = 91111
----------------------------------------------------------------------------------------------------------------
drop table BangDiem

create table BangDiem (
	Mabangdiem int identity (10,1) not null  primary key ,
	DiemX float not null,
	DiemY float not null,
	Diemtongket float,
	Trangthai nvarchar(50),
	MaSV int not null foreign key references SinhVien,
	Mamonhoc int not null foreign key references MonHoc,
);

insert into BangDiem (DiemX,DiemY,MaSV,Mamonhoc) values
(8.0,8.0,90113,17335),
(8.0,6.5,90113,17332),

(8.0,9.0,91319,18124),
(8.5,8.0,91319,17532),

(8.5,8.25,92145,17523),
(9.0,8.0,92145,19101),

(9.0,9.0,92336,17226),
(9.5,9.0,92336,17304),
(9.0,9.0,92336,17104),

(8.0,8.0,92438,17426),
(9.0,8.5,92438,17231),

(8.0,8.0,93644,11401),
(9.0,8.0,93644,17200);

--Điểm tổng kết
update BangDiem
set Diemtongket = 0.5*DiemX+0.5*DiemY, Trangthai = case when DiemX >= 4.0 and DiemY >= 4.0  then N'Đạt'
						else N'Không đạt' end 

update BangDiem
set DiemX = 8.0, DiemY = 7.0, Diemtongket = 0.5*DiemX+0.5*DiemY, 
Trangthai = case when DiemX >= 4.0 and DiemY >= 4.0  then N'Đạt' else N'Không đạt' end
from ((BangDiem inner join SinhVien on BangDiem.MaSV = SinhVien.MaSV)
				inner join MonHoc on MonHoc.Mamonhoc = BangDiem.Mamonhoc)
where SinhVien.MaSV = 92222 and MonHoc.Mamonhoc = 17332


select * from BangDiem;

select SinhVien.MaSV, TenSV, DiemX, DiemY, Diemtongket, Trangthai, Khoahoc, Monhoc.Tenmonhoc, Nganh.Tennganh
from (((( ChiTietMonHoc inner join MonHoc on ChiTietMonHoc.Mamonhoc = MonHoc.Mamonhoc) 
left join BangDiem on MonHoc.Mamonhoc = BangDiem.Mamonhoc) 
left join SinhVien on BangDiem.MaSV = SinhVien.MaSV) 
left join Nganh on Nganh.Manganh = SinhVien.Manganh) 
group by  SinhVien.MaSV, TenSV, DiemX, DiemY, Diemtongket, Trangthai, Khoahoc, Monhoc.Tenmonhoc,Nganh.Tennganh;

delete from BangDiem WHERE BangDiem.MaSV = 91111 and Mamonhoc = 17523

insert into BangDiem(DiemX,DiemY,MaSV, Mamonhoc)
select 8.0, 7.8, SinhVien.MaSV, Monhoc.Mamonhoc from Monhoc,SinhVien
where Tenmonhoc = N'Toán cao cấp' and SinhVien.MaSV = 91111 

----------------------------------------------------------------------------------------------------------------						
drop table HocPhi

create table HocPhi (
	MaHP int identity (1,1) primary key,
	Dongiahocphi float,
	Tinhtrang nvarchar(50) default N'Chưa nộp',
	MaSV int not null foreign key references SinhVien,
	Mamonhoc int not null foreign key references MonHoc,
	Ma int not null foreign key references ChiTietMonHoc,
)

insert into HocPhi(Ma, MaSV, Mamonhoc)
select Ma,MaSV, Mamonhoc
from ChiTietMonHoc

select * from HocPhi;

delete from HocPhi

--Tính tổng số tín chỉ
select SinhVien.MaSV,sum(Sotinchi) as TongSTC
from (((HocPhi inner join MonHoc on HocPhi.Mamonhoc = MonHoc.Mamonhoc)
					inner join ChiTietMonHoc on HocPhi.Ma = ChiTietMonHoc.Ma)
					inner join SinhVien on SinhVien.MaSV = ChiTietMonHoc.MaSV)
group by SinhVien.MaSV;

--Đơn giá học phí theo kỳ/năm học 
update HocPhi
set Dongiahocphi = case when Namhoc = N'2022 - 2023' and Hocky = 1 then 315000
						when Namhoc = N'2022 - 2023' and Hocky = 2 then 410000
						else 475000 end
from HocPhi inner join ChiTietMonHoc on HocPhi.Ma = ChiTietMonHoc.Ma;

update HocPhi
set Tinhtrang = N'Chưa nộp'

--Tính tổng học phí
select SinhVien.MaSV, TenSV, Khoahoc, Dongiahocphi, sum(Sotinchi) as TongSTC, Hocky, Namhoc, Dongiahocphi*Sum(Sotinchi) as Tongtien, Tinhtrang
from (((HocPhi inner join MonHoc on HocPhi.Mamonhoc = MonHoc.Mamonhoc)
					inner join ChiTietMonHoc on HocPhi.Ma = ChiTietMonHoc.Ma)
					inner join SinhVien on SinhVien.MaSV = ChiTietMonHoc.MaSV)
group by SinhVien.MaSV, TenSV, Khoahoc, Dongiahocphi, Tinhtrang, Hocky, Namhoc
