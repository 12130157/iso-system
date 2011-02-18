
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_MuonThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_MuonThietBi]
GO
CREATE PROC sp_QLTB_MuonThietBi
	@ID						int,
	@ThoiGianTra			datetime,
	@HoThanhVien			nvarchar(50),
	@TenLot					nvarchar(50),
	@TenThanhVien			nvarchar(50)
AS
BEGIN
	Update thietbi 
	set	Ma_tinh_trang = 3
	where id = @ID

	Insert into PhieuMuonThietBi(Nguoi_muon,Thoi_gian_muon,Thoi_gian_tra,Tinh_trang,Ngay_cap_nhat_cuoi) values(@HoThanhVien+''+@TenLot+''+@TenThanhVien,getdate(),@ThoiGianTra,3,getdate())

	insert into ChiTietPhieuMuon (Ma_phieu_muon,Tinh_trang,Ngay_cap_nhat_cuoi)
	select top 1 A.ID as MaPhieuMuon ,A.Tinh_trang as TinhTrang ,A.Ngay_cap_nhat_cuoi as NgayCapNhatCuoi
		from PhieuMuonThietBi as A
	order by 1 desc
END
--select * from chitietphieumuon
--select * from thietbi
--select * from phieumuonthietbi
--delete from phieumuonthietbi
--delete from chitietphieumuon

--select * from thanhvien
--select * from chitietthanhvien

--update thietbi set Ma_tinh_trang = 2