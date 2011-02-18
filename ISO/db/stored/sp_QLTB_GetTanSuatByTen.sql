if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_GetTanSuatByTen]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[sp_QLTB_GetTanSuatByTen]
GO
create procedure sp_QLTB_GetTanSuatByTen
	@IndexStart int,
	@Total int,
	@Ten nvarchar(100)
as
begin					
		With [USER] As (
				SELECT ROW_NUMBER() OVER(ORDER BY E.ID) AS RowNum,A.ID as MaThietBi, A.Ten as TenThietBi, B.Ten_loai as TenLoaiThietBi, C.Ten as TenTinhTrang, D.Ten as TenNhaCungCap, A.Tan_suat_toi_da as TanSuatToiDa,	A.Tan_suat_su_dung as TanSuatSuDung, E.Ten as TenDonViTanSuat, A.So_lan_bao_tri as SoLanBaoTri, A.So_may as SoMay  
				FROM ThietBi As A inner join LoaiThietBi as B on B.ID = A.Ma_loai inner join TinhTrangThietBi as C on C.ID = A.Ma_tinh_trang inner join NhaCungCap as D on D.ID = A.Ma_nha_cung_cap inner join TanSuat as E on E.ID = A.Ma_don_vi_tan_suat 
				WHERE  A.Ten LIKE @Ten)
		SELECT * FROM [USER] 
		WHERE RowNum BETWEEN @IndexStart AND @Total
	
end


--execute sp_QLTB_GetTanSuatByTen 1,5,'%%'

