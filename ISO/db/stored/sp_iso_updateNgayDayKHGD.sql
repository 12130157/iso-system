if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_iso_UpdateNgaydayKHGD') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].sp_iso_UpdateNgaydayKHGD
GO

CREATE PROCEDURE sp_iso_UpdateNgaydayKHGD
	@MaKHGD int
AS
BEGIN
	DECLARE @NgayDay varchar(40)
	SELECT TOP 1 @NgayDay=Ngay_BD FROM ChiTietKHGD WHERE Ma_Ke_Hoach_Giang_Day=@MaKHGD
	UPDATE KeHoachGiangDay SET User2=@NgayDay WHERE ID=@MaKHGD
END

