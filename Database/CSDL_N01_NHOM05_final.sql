-- CHECK BANG 1
CREATE TABLE SANPHAM
(
  MASP			NVARCHAR(10) NOT NULL,
  HDH			NVARCHAR(20) NOT NULL,
  HANGSX		NVARCHAR(20),
  TENSP			NVARCHAR(20) NOT NULL,
  MANHINH		NVARCHAR(20) NOT NULL,
  CPU			NVARCHAR(20) NOT NULL, -- CPU la co chip vd 13,1215U,1.2GHz
  RAM			NVARCHAR(20) NOT NULL,
  OCUNG			NVARCHAR(20) NOT NULL,
  PIN			NVARCHAR(20) NOT NULL,
  THOIDIEMRAMAT DATETIME,
  CARDMANHINH   NVARCHAR(20) NOT NULL,
  KICHTHUOC		INT,
  KHOILUONG		INT,
  BAOHANH		NVARCHAR(10),
  
  PRIMARY KEY (MASP)
);
-- CHECK BANG 2
CREATE TABLE KHACHHANG
(
  MAKH			NVARCHAR(10) NOT NULL,
  EMAIL			NVARCHAR(20) ,
  TENKH			NVARCHAR(20) ,
  SDT			NVARCHAR(20) NOT NULL,
  DIACHI		NVARCHAR(50) NOT NULL,
  PRIMARY KEY (MAKH)
);
-- CHECK BANG 3
CREATE TABLE NHACUNGCAP
(
  MANHACC		NVARCHAR(10) NOT NULL,
  TEN			NVARCHAR(20),
  SDT			NVARCHAR(15) NOT NULL,
  EMAIL			NVARCHAR(20),
  DIACHI		NVARCHAR(20),
  PRIMARY KEY (MANHACC)
);
-- CHECK BANG 4
CREATE TABLE NHANVIEN
(
  TENNV			NVARCHAR(20) NOT NULL,
  GIOITINH		BIT,
  NGAYSINH		DATETIME,
  DIACHI		NVARCHAR(30) NOT NULL,
  SDT			NVARCHAR(15) NOT NULL,
  MANV			NVARCHAR(10) NOT NULL,
  PRIMARY KEY (MANV)
);
-- CHECK BANG 5 
CREATE TABLE HOADONNHAP
(
  NGAYNHAP		DATETIME,
  GIAMGIA		INT,
  THANHTIEN		INT,
  SOHOADON		NVARCHAR(10) NOT NULL,
  MANHACC		NVARCHAR(10) NOT NULL,
  MANV			NVARCHAR(10) NOT NULL,
  PRIMARY KEY (SOHOADON),
  FOREIGN KEY (MANHACC) REFERENCES NHACUNGCAP(MANHACC),
  FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
);
-- CHECK BANG 6
CREATE TABLE HOADONBAN
(
  THANHTIEN		DECIMAL(10,2),
  NGAYBAN		DATETIME,
  SOHD			NVARCHAR(10) NOT NULL,
  MAKH			NVARCHAR(10) NOT NULL,
  MANV			NVARCHAR(10) NOT NULL,
  PRIMARY KEY (SOHD),
  FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH),
  FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
);
-- CHECK BANG 7
CREATE TABLE XUATHDN (
    MASP		NVARCHAR(10)	NOT NULL,
    SOHOADON	NVARCHAR(10) NOT NULL,
    DONGIA		INT,
	SL			INT,
    PRIMARY KEY (MASP, SOHOADON),
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP),
    FOREIGN KEY (SOHOADON) REFERENCES HOADONNHAP(SOHOADON)
);
-- CHECK BANG 8
CREATE TABLE XUATHDB (
    MASP		NVARCHAR(10) PRIMARY KEY,
	SOHD		NVARCHAR(10),
    DONGIA		INT,
    SL			INT,
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP),
    FOREIGN KEY (SOHD) REFERENCES HOADONBAN(SOHD)
);
INSERT INTO SANPHAM(MASP, TENSP, HANGSX, HDH, MANHINH, CPU, RAM, OCUNG, PIN, THOIDIEMRAMAT, CARDMANHINH, KICHTHUOC, KHOILUONG,BAOHANH) 
VALUES
('001','Laptop HP' ,'HP','WINDOWS 11','15.6,FULL HD','i3,1215U,1.2GHz','8G','SSD','NiCd','2023-12-09','UHD','555',2,N'1 năm'),
('002','Laptop HP1','HP','WINDOWS 11','15.6,FULL HD','i3,1215U,1.2GHz','4G','SSD','NiCd','2020-11-23','URD','505',4,N'2 năm'),
('003','Laptop HP2','HP','WINDOWS 11','15.6,FULL HD','i3,1215U,1.2GHz','8G','SSD','NiCd','2023-06-30','UHD','555',2,N'2 năm'),
('004','Laptop HP3','HP','WINDOWS 11','15.6,FULL HD','i3,1215U,1.2GHz','4G','SSD','NiCd','2020-02-12','URD','505',4,N'2 năm'),
('005','Laptop HP4','HP','WINDOWS 11','15.6,FULL HD','i3,1215U,1.2GHz','8G','SSD','NiCd','2023-01-14','UHD','555',2,N'1 năm');
SELECT * FROM SANPHAM;
INSERT INTO NHANVIEN(MANV,TENNV,GIOITINH,NGAYSINH,DIACHI,SDT) 
VALUES 
('001',N'Nguyễn Anh','0','2000-12-23',N'Hà Nội','098765789'),
('002',N'Trần Bang','0','2001-08-22',N'Hải Phòng','091234567'),
('003',N'Lê Chào','1','1999-05-11',N'Nam Định','091134567'),
('004',N'Hoàng Di','1','2003-02-22',N'Bắc Giang','091265785'),
('005',N'Lương Giang','1','2005-08-05',N'Hà Nam','093456789');
SELECT * FROM NHANVIEN;
INSERT INTO KHACHHANG(MAKH, TENKH, SDT, DIACHI)
VALUES 
('T011',N'Nguyễn Văn A','0587318312',N'Thái Bình'),
('T012',N'Nguyễn B','0587318313',N'Thái Thụy'),
('T013',N'Trần C','0587318314',N'Hà Nội'),
('T014',N'Văn Nam','0587318315',N'Thái Nguyên'),
('T015',N'Trần Văn C','0587318316',N'Hà Tây');
SELECT * FROM KHACHHANG;
INSERT INTO NHACUNGCAP(MANHACC, TEN, SDT, EMAIL, DIACHI) 
VALUES 
('HN280',N'Hà Nội Lap','092834987','HNL@gmail.com',N'Hà Nội '),
('TLN90',N'Thăng Long','098736493','TL@gmail.com',N'Hà Nam'),
('AGY91',N'Nam Định','029098328','ND@gmail.com',N'Nam Định'),
('ATX89',N'Bình Thuận','093048490','BT@gmail.com',N'Bình Thuận'),
('AHJ01',N'Hà Tây','028309837','HT@gmail.com',N'Hà Nội');
SELECT * FROM NHACUNGCAP;
INSERT INTO HOADONNHAP(NGAYNHAP, GIAMGIA, THANHTIEN, SOHOADON, MANHACC, MANV)
VALUES 
('2023-09-12','4500000','910000000', 'XC123','HN280','001'),
('2022-11-09','9000000','840000000', 'XC098', 'HN280','002'),
('2019-12-30','0','700000000', 'XC055', 'TLN90','005'),
('2025-01-15','1230450','988734679', 'XC200','AGY91','004'),
('2024-05-18','8937480','455000000', 'XC170','TLN90','003'),
('2021-06-12','6900000','250000000', 'XC089','ATX89','005');
SELECT * FROM HOADONNHAP;
INSERT INTO XUATHDN(MASP, SOHOADON, DONGIA, SL) 
VALUES 
('001','XC055','7000000','100'),
('002','XC089','3038750','80'),
('003','XC098','6925000','120'),
('004','XC123','4527500','200'),
('005','XC170','11151563','40'),
('001','XC200','7000000','141');
SELECT * FROM XUATHDN;
INSERT INTO HOADONBAN(THANHTIEN,NGAYBAN,SOHD,MAKH,MANV)
VALUES
('2356000','2023-01-23','HV123','T011', '001'),
('1578000','2023-03-15','HV526','T012', '002'),
('1923000','2023-04-03','HV654','T013', '003'),
('3145000','2023-07-13','HV135','T014', '004'),
('2467800','2023-11-27','HV987','T015', '005');
SELECT * FROM HOADONBAN;
INSERT INTO XUATHDB(MASP,SOHD,DONGIA,SL)
VALUES
('001','HV526','1578000','3'),
('002','HV987','2467800','2'),
('003','HV654','1923000','15'),
('004','HV135','3145000','8'),
('005','HV123','2356000','20');

--Câu 1: Đưa ra tên nhân viên và mã nhân viên.
select manv as 'Mã nhân viên' ,tennv as'Tên nhân viên'from NHANVIEN

--Câu 2: Đưa ra thông tin khách hàng có mã là 'T011'.
select * from KHACHHANG
where MAKH = 'T011';

--Câu 3: Đưa ra thông tin sản phẩn từ hãng sản xuất HP.
select * from SANPHAM
where HANGSX = 'HP';

--Câu 4: Đưa ra các mã hóa đơn có số lượng > 100.
select SOHOADON as 'Mã hóa đơn',MASP as 'Mã sản phẩm',SL as 'Số lượng' from XUATHDN
where SL > 100;

--Câu 5: Đưa ra msp,cpu,ocung có kích thước >500 và < 555.
select MASP as 'Mã sản phẩm',cpu,ocung as 'Ổ cứng',KICHTHUOC as 'Kích thước' from SANPHAM
where KICHTHUOC > 500 and KICHTHUOC<555;

--Câu 6: Đưa ra tên nhân viên nhập hóa đơn bán trong ngày 27-11-2023.
select hoadonban.MANV, hoadonban.NGAYBAN, nhanvien.TENNV
from nhanvien inner join  hoadonban on nhanvien.MANV=hoadonban.MANV
where NGAYBAN='2023-11-27';

--Câu 7: Đưa ra tên nhân viên nhập số hóa đơn số HV987.
select hoadonban.MANV, hoadonban.SOHD, nhanvien.TENNV
from nhanvien inner join  hoadonban on nhanvien.MANV=hoadonban.MANV
where SOHD='HV987';

--Câu 8: Đưa ra tên khách hàng đã mua sản phẩm có tên Laptop HP.
select sanpham.TENSP, hoadonban.SOHD, khachhang.TENKH, sanpham.MASP, hoadonban.MAKH
from (( xuathdb inner join sanpham on xuathdb.MASP= sanpham.MASP) inner join hoadonban on hoadonban.SOHD= xuathdb.SOHD) inner join khachhang on khachhang.MAKH= hoadonban.MAKH
where TENSP= N'Laptop HP';


--Câu 9: Đưa ra số lượng còn lại của loại Laptop HP1.
select sanpham.TENSP, xuathdn.SL-xuathdb.SL as 'con lai', xuathdb.MASP
from (( sanpham inner join xuathdb on sanpham.MASP= xuathdb.MASP) inner join xuathdn on xuathdn.MASP= xuathdb.MASP)
where TENSP=N'Laptop HP1';

--Câu 10: Đưa ra sản phẩm có đơn giá <2500000 được bán trong ngày 15-03-2023.
select sanpham.TENSP, xuathdb.DONGIA, hoadonban.NGAYBAN, xuathdb.MASP, xuathdb.MASP, hoadonban.SOHD
from (( hoadonban inner join xuathdb on hoadonban.SOHD= xuathdb.SOHD) inner join sanpham on sanpham.MASP= xuathdb.MASP)
where NGAYBAN='2023-03-15' and DONGIA<2000000;

--11 Đưa ra tổng số lượng sản phẩm có giá trên 1 triệu
select sum(xuathdb.sl) as 'Tổng số lượng'
from SANPHAM join XUATHDB on SANPHAM.MASP = XUATHDB.MASP
where XUATHDB.DONGIA >= 1000000

--12 Đưa ra mã,tên sản phẩm sau khi bán có lãi là bao nhiêu
select SANPHAM.MASP as 'Mã sp',SANPHAM.TENSP as 'Tên sp',XUATHDB.SL*XUATHDB.DONGIA-XUATHDN.SL*XUATHDN.DONGIA as 'Tiền lãi'
from (XUATHDB join SANPHAM on SANPHAM.MASP = XUATHDB.MASP) join XUATHDN on SANPHAM.MASP = XUATHDN.MASP
where SANPHAM.MASP = '001'

--13 Đưa ra tổng tiền hàng đã nhập từ nhà cung cấp có mã là HN280 (Hà Nội Lab)
select  sum(XUATHDN.SL*XUATHDN.DONGIA) as 'Tổng tiền nhập từ NCC Hà Nội Lab ( Nghìn đồng)'
from (NHACUNGCAP join HOADONNHAP on NHACUNGCAP.MANHACC = HOADONNHAP.MANHACC ) join XUATHDN on XUATHDN.SOHOADON = HOADONNHAP.SOHOADON
where NHACUNGCAP.MANHACC = 'HN280'

--14 Liệt kê những sản phẩm nhập từ ngày '2023-01-23' đến '2023-05-23'
select SANPHAM.MASP as 'Mã sp',SANPHAM.TENSP as 'Tên sp',HOADONNHAP.NGAYNHAP as 'Ngày nhập hàng'
from ( SANPHAM join  XUATHDN on SANPHAM.MASP = XUATHDN.MASP ) join HOADONNHAP on HOADONNHAP.SOHOADON = XUATHDN.SOHOADON
where HOADONNHAP.NGAYNHAP between '2023-01-23' and '2023-12-23'

--15 Liệt kê tên các khách hàng và tên nhân viên đã tư vấn cho mã đơn hàng '001'
select NHANVIEN.TENNV as 'Nhân viên tư vấn',KHACHHANG.TENKH as 'Tên khách hàng'
from (( NHANVIEN join HOADONBAN on NHANVIEN.MANV = HOADONBAN.MANV ) join KHACHHANG on KHACHHANG.MAKH = HOADONBAN.MAKH) join xuathdb on xuathdb.SOHD= hoadonban.SOHD
where xuathdb.MASP = (
	select xuathdb.MASP1
	from xuathdb
    where xuathdb.MASP='001'
);

