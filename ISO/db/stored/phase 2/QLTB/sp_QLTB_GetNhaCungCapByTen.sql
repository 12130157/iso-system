
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_GetNhaCungCapByTen]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_QLTB_GetNhaCungCapByTen]
GO
create procedure sp_QLTB_GetNhaCungCapByTen
	@IndexStart int,
	@Total int,
	@Ten nvarchar(100)
as
begin			
		
		
		With [USER] As (
				SELECT ROW_NUMBER() OVER(ORDER BY NhaCungCap.ID) AS RowNum,NhaCungCap.ID,NhaCungCap.Dia_Chi,NhaCungCap.Dien_thoai,NhaCungCap.Email,NhaCungCap.Ma_tai_khoan,NhaCungCap.Ghi_chu,NhaCungCap.Ngay_cap_nhat_cuoi,NhaCungCap.Ten,User1,User2,User3,User4,User5  
				FROM NhaCungCap 
				WHERE  NhaCungCap.Ten LIKE @Ten)
		SELECT * FROM [USER] 
		WHERE RowNum BETWEEN @IndexStart AND @Total
	
end


--execute sp_QLTB_GetNhaCungCapByTen 2,11,'%%'

