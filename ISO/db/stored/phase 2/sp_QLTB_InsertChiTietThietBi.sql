

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_InsertChiTietThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_QLTB_InsertChiTietThietBi]
GO
create procedure sp_QLTB_InsertChiTietThietBi
		@MaThietBi int,
		@TenLinhKien nvarchar(200),
		@MaNhaCungCap int,
		@DungLuong nvarchar(200),		
		@GhiChu nvarchar(200),
		@User1 varchar(40),
		@User2 varchar(40),
		@User3 varchar(40),
		@User4 varchar(40),
		@User5 varchar(40)
as
begin			
	INSERT INTO CHITIETTHIETBI
	(	
		Ma_thiet_bi,
		Ten_linh_kien,
		Ma_nha_cung_cap,
		Dung_luong,
		Ma_tinh_trang,
		Ghi_chu,
		User1,
		User2,
		User3,
		User4,
		User5
	)
	VALUES
	(		
		@MaThietBi,
		@TenLinhKien,
		@MaNhaCungCap,
		@DungLuong,
		0,
		@GhiChu,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
end
