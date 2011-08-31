/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	04/06/2011
	Mục Đích	:	Thêm Hồ Sơ Dự Tuyển
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertHoSoDuTuyen')
BEGIN
	DROP PROC sp_NhanSu_InsertHoSoDuTuyen
END
GO
CREATE PROC sp_NhanSu_InsertHoSoDuTuyen
	@Ten_dang_nhap		VARCHAR(20),
	@Ho					NVARCHAR(50),
	@Ten_lot			NVARCHAR(200),
	@Ten				NVARCHAR(50),
	@Gioi_tinh			INT,
	@Ngay_sinh			DATETIME,
	@CMND				VARCHAR(20),
	@Ngay_cap			DATETIME,
	@Noi_cap			NVARCHAR(100),
	@So_nha				VARCHAR(20),	
	@Duong				NVARCHAR(500),
	@Phuong_xa			NVARCHAR(100),
	@Quan_huyen			NVARCHAR(100),
	@Tinh_thanhpho		NVARCHAR(200),		
	@Dien_thoai_nha		VARCHAR(20),
	@Email				VARCHAR(100),
	@Dien_thoai_dd		VARCHAR(50),
	@Trinh_do_van_hoa	NVARCHAR(1000),
	@Chuyen_mon			NVARCHAR(1000),
	@Tin_hoc			NVARCHAR(1000),
	@Ngoai_ngu			NVARCHAR(1000),
	@Tom_tat_ban_than	NTEXT,
	@Vi_tri_du_tuyen	INT,					
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1  
	IF NOT EXISTS (SELECT * FROM HoSoDuTuyen WHERE CMND=@CMND AND Vi_tri_du_tuyen NOT IN (SELECT ID FROM ChiTietKHTNS WHERE Ma_ke_hoach=(SELECT Ma_ke_hoach FROM ChiTietKHTNS WHERE ID=@Vi_tri_du_tuyen)))   
	BEGIN  
		INSERT INTO HoSoDuTuyen(Ten_dang_nhap,Ho,Ten_lot,Ten,Gioi_tinh,Ngay_sinh,Ghi_chu,CMND,Ngay_cap,Noi_cap,So_nha,Duong,Phuong_xa,Quan_huyen,Tinh_thanhpho,Dien_thoai_nha,Email,Dien_thoai_dd,Trinh_do_van_hoa,Chuyen_mon,Tin_hoc,Ngoai_ngu,Tom_tat_ban_than,Vi_tri_du_tuyen,Tinh_trang,Ngay_cap_nhat_cuoi,User1,User2,User3,User4,User5) VALUES(@Ten_dang_nhap,@Ho,@Ten_lot,@Ten,@Gioi_tinh,@Ngay_sinh,null,@CMND,@Ngay_cap,@Noi_cap,@So_nha,@Duong,@Phuong_xa,@Quan_huyen,@Tinh_thanhpho,@Dien_thoai_nha,@Email,@Dien_thoai_dd,@Trinh_do_van_hoa,@Chuyen_mon,@Tin_hoc,@Ngoai_ngu,@Tom_tat_ban_than,@Vi_tri_du_tuyen,0,GETDATE(),'','','','','')
		SET @KQ = 1  
	END  
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertHoSoDuTuyen 'ngoxxmai',N'Huỳnh',N'Thị Ngọc',N'Mai',0,'07/20/1991','TP.HCM','090805824','80/4','maihtn.hv@gmail.com','0908058240',N'Trung cấp',N'Lập trình',N'trung cấp',N'Anh Văn','123456',3,@KQ OUTPUT
SELECT @KQ

SELECT * FROM HoSoDuTuyen

SELECT * FROM ChiTietKHTNS

SELECT * FROM KehoachTNS

*/
