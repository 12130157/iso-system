
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_InsertNhaCungCap]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_QLTB_InsertNhaCungCap]
GO
create procedure sp_QLTB_InsertNhaCungCap
	@Ten nvarchar(100),
	@Dia_chi nvarchar(100),
	@Dien_thoai varchar(40),
	@Email varchar(40),
	@Ma_tai_khoan int,
	@Ghi_chu nvarchar(40),
	@User1 varchar(40),
	@User2 varchar(40),	
	@User3 varchar(40),
	@User4 varchar(40),
	@User5 varchar(40)
as
begin			
	INSERT INTO NHACUNGCAP 
	 
		(
			Ten,
			Dia_Chi,
			Dien_thoai,
			Email,
			Ma_tai_khoan,
			Ghi_chu,
			User1,
			User2,
			User3,
			User4,
			User5
		)	
	VALUES	
		(
			@Ten,
			@Dia_Chi,
			@Dien_thoai,
			@Email,
			@Ma_tai_khoan,
			@Ghi_chu,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5
		)
end



