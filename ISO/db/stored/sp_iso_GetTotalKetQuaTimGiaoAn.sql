if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_iso_GetTotalKetQuaTimGiaoAn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_iso_GetTotalKetQuaTimGiaoAn]
GO
create procedure sp_iso_GetTotalKetQuaTimGiaoAn
	
As
begin			
	
	IF EXISTS (SELECT * FROM SYSOBJECTS	WHERE XTYPE='U' AND NAME='KetQuaTimGiaoAn')
			SELECT COUNT(*) As Total FROM KETQUATIMGIAOAN 
	Else
			SELECT 0 As Total
end







