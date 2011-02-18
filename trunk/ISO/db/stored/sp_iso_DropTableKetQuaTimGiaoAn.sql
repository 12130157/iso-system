if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_iso_DropTableKetQuaTimGiaoAn]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_iso_DropTableKetQuaTimGiaoAn]
GO
create procedure sp_iso_DropTableKetQuaTimGiaoAn
as
begin			

	IF EXISTS (SELECT * FROM SYSOBJECTS	WHERE XTYPE='U' AND NAME='KetQuaTimGiaoAn')
			DROP TABLE KetQuaTimGiaoAn 

end














