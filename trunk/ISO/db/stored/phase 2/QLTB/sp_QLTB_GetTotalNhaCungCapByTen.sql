
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_GetTotalNhaCungCapByTen]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_QLTB_GetTotalNhaCungCapByTen]
GO
create procedure sp_QLTB_GetTotalNhaCungCapByTen
	@Ten nvarchar(100)
as
begin			
		SELECT COUNT(ID) As Total   
				FROM NhaCungCap 
				WHERE NhaCungCap.Ten like @Ten
end



