
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_UpdateNhaCungCapByID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_QLTB_UpdateNhaCungCapByID]
GO
create procedure sp_QLTB_UpdateNhaCungCapByID
	@ID int,
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
	UPDATE NHACUNGCAP 
	SET Ten=@Ten,
		Dia_Chi=@Dia_chi,
		Dien_thoai=@Dien_thoai,
		Email=@Email,
		Ma_tai_khoan=@Ma_tai_khoan,
		Ngay_cap_nhat_cuoi=getdate(),
		Ghi_chu=@Ghi_chu,
		User1=@User1,
		User2=@User2,
		User3=@User3,
		User4=@User4,
		User5=@User5
	WHERE
		ID=@ID
end



