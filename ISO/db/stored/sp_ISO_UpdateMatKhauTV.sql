
/***********************************************************
* Purpose : Update "Mat_khau thanh vien"
* Author : TuanHQ
* Date: 02-04-2010
* Description: Update "Mat_khau thanh vien"
***********************************************************/

if exists (select * from dbo.sysobjects where name = 'sp_ISO_UpdateMatKhauTV')
drop procedure [dbo].[sp_ISO_UpdateMatKhauTV]
GO
CREATE PROCEDURE sp_ISO_UpdateMatKhauTV
	@Ten_dn  varchar(20),
	@Mat_khau varchar(20)
AS
BEGIN
	update thanhvien 
	set mat_khau = @Mat_khau
	where Ten_dn = @Ten_dn
END

