if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertChiTietKHGD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertChiTietKHGD]
GO
 
CREATE PROCEDURE sp_ISO_InsertChiTietKHGD
	@ID						int			output,
	@maKHGD					int,
	@tenChuong				nvarchar(4000),
	@noiDungTH				nvarchar(4000),
	@congViecChuanBi		nvarchar(4000),
	@coHieu					int,
	@tuan					int,
	@ngayBD					datetime,
	@ngayKT					datetime,
	@ngayCapNhatCuoi		datetime,
	@maGiaoAn				int,
	@nhom					int,
	@sTTNoiDung				int,
	@Thu					int,
	@Buoi					nvarchar(10),
	@Ten_phong				nvarchar(40),
	@Muc_Tieu_Bai_Hoc		nvarchar(2000),
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN
	SET @ngayCapNhatCuoi = GETDATE()
	INSERT INTO ChiTietKHGD
	
	VALUES (
		@maKHGD,
		@tenChuong,
		@coHieu,
		@ngayCapNhatCuoi,
		@tuan,
		@ngayBD,
		@ngayKT,
		@noiDungTH,
		@congViecChuanBi,
		@maGiaoAn,
		@nhom,
		@sTTNoiDung,
		@Thu,
		@Buoi,
		@Ten_phong,
		@Muc_Tieu_Bai_Hoc,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
		
	)
	SELECT 	@ID=ID FROM ChiTietKHGD WHERE Ngay_cap_nhat_cuoi=@ngayCapNhatCuoi
END

