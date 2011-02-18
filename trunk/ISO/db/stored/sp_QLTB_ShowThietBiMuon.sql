
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_ShowThietBiMuon]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_ShowThietBiMuon]
GO
CREATE PROCEDURE sp_QLTB_ShowThietBiMuon

	@TenThietBi		varchar(10)

AS
BEGIN
	IF @TenThietBi = ''
	BEGIN
		select	A.ID as MaThietBi, 
				A.Ten as TenThietBi, 
				A.Ki_hieu as KiHieu, 
				B.Ki_hieu_phong as TenPhongBan 
		from ThietBi as A 
			inner join PhongBan as B on B.ID = A.Ma_phong 
		where A.Ma_tinh_trang != 1
	END
	
	IF @TenThietBi <> '' 
	BEGIN
		select	A.ID as MaThietBi, 
			A.Ten as TenThietBi, 
			A.Ki_hieu as KiHieu, 
			B.Ki_hieu_phong as TenPhongBan 
		from ThietBi as A 
			inner join PhongBan as B on B.ID = A.Ma_phong 
		where A.Ma_tinh_trang != 1 and A.Ten LIKE '%' + @TenThietBi + '%'
	END
END


--sp_QLTB_ShowThietBiByMaPhongBan '9',''