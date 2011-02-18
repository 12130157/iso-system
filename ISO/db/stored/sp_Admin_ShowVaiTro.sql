
/***********************************************************
* Purpose : phan trang vai tro
* Author : HuyenLY
* Date: 02-06-2010
* Description: phan trang vai tro
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Admin_ShowVaiTro]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Admin_ShowVaiTro]
GO
CREATE PROCEDURE sp_Admin_ShowVaiTro

	@numRows		varchar(10),
	@totalPages		varchar(10)

AS
BEGIN
	DECLARE @sql NVarchar(1000)
	SELECT @sql = '
	select * from (
		select top ' + @numRows + ' * 
		from (
			select top ' + @totalPages + ' *
			from (
				select 
					A.ID AS MaVaiTro,  
					A.ten_vai_tro AS TenVaiTro,
					A.ngay_cap_nhat_cuoi AS NgayCapNhatCuoi 
				from vaitro A
			) AS TB0
			order by TB0.TenVaiTro desc
		) as TB1 
		order by TB1.TenVaiTro asc
	) as TB2 
	order by TB2.TenVaiTro asc'

	exec  sp_executesql @sql
END


--sp_Admin_ShowVaiTro '5','8'