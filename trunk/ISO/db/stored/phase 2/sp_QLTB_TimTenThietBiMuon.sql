
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_TimTenThietBiMuon]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_TimTenThietBiMuon]
GO
CREATE PROCEDURE sp_QLTB_TimTenThietBiMuon

	@TenThietBi		nvarchar(20),
	@KiHieu			varchar(20),
	@MaLoaiThietBi	varchar(50)
AS
BEGIN
	IF @MaLoaiThietBi = -1 AND @TenThietBi = '' AND @KiHieu = ''  
	BEGIN
		select	A.ID as MaThietBi, 
				C.Ten_loai as TenLoaiThietBi,
				A.Ten as TenThietBi, 
				A.Ki_hieu as KiHieu, 
				B.Ki_hieu_phong as TenPhongBan 
		from ThietBi as A 
			inner join PhongBan as B on B.ID = A.Ma_phong
			inner join LoaiThietBi as C on C.ID = A.Ma_loai 
		where A.Ma_tinh_trang != 1 and A.Ma_tinh_trang != 3
	END
	
	IF @MaLoaiThietBi = -1 AND @TenThietBi <> '' AND @KiHieu = ''  
	BEGIN
		select	A.ID as MaThietBi,
			C.Ten_loai as TenLoaiThietBi, 
			A.Ten as TenThietBi, 
			A.Ki_hieu as KiHieu, 
			B.Ki_hieu_phong as TenPhongBan 
		from ThietBi as A 
			inner join PhongBan as B on B.ID = A.Ma_phong 
			inner join LoaiThietBi as C on C.ID = A.Ma_loai
		where A.Ma_tinh_trang != 1 and A.Ma_tinh_trang != 3 and A.Ten LIKE '%' + @TenThietBi + '%'
	END

	IF @MaLoaiThietBi = -1 AND  @TenThietBi = '' AND @KiHieu <> '' 
	BEGIN
		select	A.ID as MaThietBi,
			C.Ten_loai as TenLoaiThietBi, 
			A.Ten as TenThietBi, 
			A.Ki_hieu as KiHieu, 
			B.Ki_hieu_phong as TenPhongBan 
		from ThietBi as A 
			inner join PhongBan as B on B.ID = A.Ma_phong 
			inner join LoaiThietBi as C on C.ID = A.Ma_loai
		where A.Ma_tinh_trang != 1 and A.Ma_tinh_trang != 3 and A.Ki_hieu LIKE '%' + @KiHieu + '%'
	END

	IF @MaLoaiThietBi = -1 AND @TenThietBi <> '' AND @KiHieu <> '' 
	BEGIN
		select	A.ID as MaThietBi,
			C.Ten_loai as TenLoaiThietBi, 
			A.Ten as TenThietBi, 
			A.Ki_hieu as KiHieu, 
			B.Ki_hieu_phong as TenPhongBan 
		from ThietBi as A 
			inner join PhongBan as B on B.ID = A.Ma_phong 
			inner join LoaiThietBi as C on C.ID = A.Ma_loai
		where A.Ma_tinh_trang != 1 and A.Ma_tinh_trang != 3 and A.Ten LIKE '%' + @TenThietBi + '%' and A.Ki_hieu LIKE '%' + @KiHieu + '%'
	END

	IF @MaLoaiThietBi <> -1 AND @TenThietBi <> '' AND @KiHieu <> '' 
	BEGIN
		select	A.ID as MaThietBi,
			C.Ten_loai as TenLoaiThietBi, 
			A.Ten as TenThietBi, 
			A.Ki_hieu as KiHieu, 
			B.Ki_hieu_phong as TenPhongBan 
		from ThietBi as A 
			inner join PhongBan as B on B.ID = A.Ma_phong 
			inner join LoaiThietBi as C on C.ID = A.Ma_loai
		where A.Ma_tinh_trang != 1 and A.Ma_tinh_trang != 3 and A.Ten LIKE '%' + @TenThietBi + '%' and A.Ki_hieu LIKE '%' + @KiHieu + '%' and A.Ma_loai = @MaLoaiThietBi
	END

	IF @MaLoaiThietBi <> -1 AND @TenThietBi <> '' AND @KiHieu = '' 
	BEGIN
		select	A.ID as MaThietBi,
			C.Ten_loai as TenLoaiThietBi, 
			A.Ten as TenThietBi, 
			A.Ki_hieu as KiHieu, 
			B.Ki_hieu_phong as TenPhongBan 
		from ThietBi as A 
			inner join PhongBan as B on B.ID = A.Ma_phong 
			inner join LoaiThietBi as C on C.ID = A.Ma_loai
		where A.Ma_tinh_trang != 1 and A.Ma_tinh_trang != 3 and A.Ten LIKE '%' + @TenThietBi + '%' and A.Ma_loai = @MaLoaiThietBi
	END

	IF @MaLoaiThietBi <> -1 AND @TenThietBi = '' AND @KiHieu <> ''  
	BEGIN
		select	A.ID as MaThietBi,
			C.Ten_loai as TenLoaiThietBi, 
			A.Ten as TenThietBi, 
			A.Ki_hieu as KiHieu, 
			B.Ki_hieu_phong as TenPhongBan 
		from ThietBi as A 
			inner join PhongBan as B on B.ID = A.Ma_phong 
			inner join LoaiThietBi as C on C.ID = A.Ma_loai
		where A.Ma_tinh_trang != 1 and A.Ma_tinh_trang != 3  and A.Ma_loai = @MaLoaiThietBi and A.Ki_hieu LIKE '%' + @KiHieu + '%'
	END

	IF @MaLoaiThietBi <> -1 AND @TenThietBi = '' AND @KiHieu = ''  
	BEGIN
		select	A.ID as MaThietBi,
			C.Ten_loai as TenLoaiThietBi, 
			A.Ten as TenThietBi, 
			A.Ki_hieu as KiHieu, 
			B.Ki_hieu_phong as TenPhongBan 
		from ThietBi as A 
			inner join PhongBan as B on B.ID = A.Ma_phong 
			inner join LoaiThietBi as C on C.ID = A.Ma_loai
		where A.Ma_tinh_trang != 1 and A.Ma_tinh_trang != 3 and A.Ma_loai = @MaLoaiThietBi
	END
END


--sp_QLTB_ShowThietBiByMaPhongBan '9',''