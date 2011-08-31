/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Cập nhật cột Tinh_trang ( 0 = mặc định, 1 = đạt, 2 = rớt )
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateChiTietHoSoDuTuyen')
BEGIN
	DROP PROC sp_NhanSu_UpdateChiTietHoSoDuTuyen
END
GO
CREATE PROC sp_NhanSu_UpdateChiTietHoSoDuTuyen
	@ID					INT,
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
	@KQ					INT OUTPUT    
AS  
BEGIN  
	SET @KQ = -1  
	IF EXISTS (SELECT * FROM HoSoDuTuyen WHERE ID=@ID)   
	BEGIN  
		UPDATE HoSoDuTuyen SET Ho=@Ho,Ten_lot=@Ten_lot,Ten=@Ten,Gioi_tinh=@Gioi_tinh,Ngay_sinh=@Ngay_sinh,CMND=@CMND,Ngay_cap=@Ngay_cap,Noi_cap=@Noi_cap,So_nha=@So_nha,Duong=@Duong,Phuong_xa=@Phuong_xa,Quan_huyen=@Quan_huyen,Tinh_thanhpho=@Tinh_thanhpho,Dien_thoai_nha=@Dien_thoai_nha,Email=@Email,Dien_thoai_dd=@Dien_thoai_dd,Trinh_do_van_hoa=@Trinh_do_van_hoa,Chuyen_mon=@Chuyen_mon,Tin_hoc=@Tin_hoc,Ngoai_ngu=@Ngoai_ngu,Tom_tat_ban_than=@Tom_tat_ban_than,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = @ID  
	END  
END
GO

