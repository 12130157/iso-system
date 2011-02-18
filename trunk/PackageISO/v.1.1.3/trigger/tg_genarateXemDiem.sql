
/***********************************************************
* Purpose : Tu dong genarate data vao cac table DIEM DANH
* Author : ThienVD
* Date: 10-09-2010
* Description: Khi thoi khoa bieu duoc HT approve thi trigger nay
*    se tu dong genarate data vao cac table 
*			1. DiemDanh
*			2. ThanhVienDiemDanh
*			3. ChiTietDiemDanh
***********************************************************/

if exists (select * from dbo.sysobjects where name='tg_genarateXemDiem') 
begin
	drop trigger tg_genarateXemDiem
end

go
CREATE TRIGGER tg_genarateXemDiem ON ThoiKhoaBieu
FOR UPDATE
AS
BEGIN
	DECLARE @MaTKB INT
	DECLARE @Tinh_trang INT
	DECLARE @Ma_lop INT
	
	-- Lay du lieu tu trong table temp updated, bo vao cac bien de xu ly
	SELECT @MaTKB = ID,@Tinh_trang = Tinh_trang,@Ma_lop=Ma_lop FROM INSERTED
	
	-- Neu tinh trang = 2(HT approve) thi xu ly
	IF @Tinh_trang = 2
	BEGIN	
		
		-- Dua du lieu vao table DangKyMonHoc
		DECLARE @Ma_mon_hoc_TKB INT			
		DECLARE @C CURSOR		
		
		SET @C = CURSOR FOR 
		SELECT 
			B.ID			as	'Ma_mon_hoc_TKB'			
		FROM ThoiKhoaBieu A
		INNER JOIN MonHocTKB B ON A.ID=B.Ma_tkb
		WHERE A.ID=@MaTKB
		
		OPEN @C
		FETCH NEXT FROM @C INTO @Ma_mon_hoc_TKB
		
		WHILE @@FETCH_STATUS = 0
		BEGIN
			INSERT INTO DangKyMonHoc
			SELECT 			
				@Ma_mon_hoc_TKB		as	'Ma_mon_hoc_TKB',
				A.ID				as	'Ma_hoc_vien',
				0					as	'Diem_trung_binh',
				''					as	'Hanh_kiem',
				''					as	'Hoc_luc',
				''					as	'Danh_hieu',
				''					as	'Ghi_chu',
				getdate()			as	'Ngay_cap_nhat_cuoi',
				''					as	'User1',
				''					as	'User2',
				''					as	'User3',
				''					as	'User4',
				''					as	'User5'				
			FROM ThanhVien A		
			INNER JOIN ChiTietThanhVien B ON A.Ten_DN = B.Ten_dang_nhap
			WHERE B.Tinh_trang=1
			AND B.Ma_lop_hoc=@Ma_lop
			
			FETCH NEXT FROM @C INTO @Ma_mon_hoc_TKB
		END
		
		CLOSE @C
		DEALLOCATE @C
		
		
		-- Dua du lieu vao table ChiTietDiem
		
		DECLARE @Ma_bai_kiem_tra		INT		
		DECLARE @Ma_mon_hoc				INT
		
		SET @C = CURSOR FOR 
		SELECT 
			C.ID			as	'Ma_bai_kiem_tra',
			C.Ma_mon_hoc	as	'Ma_mon_hoc'
		FROM ThoiKhoaBieu A
		INNER JOIN MonHocTKB B ON A.ID=B.Ma_tkb
		INNER JOIN BaiKiemTra C ON B.Ma_mon_hoc=C.Ma_mon_hoc
		WHERE A.ID=@MaTKB
		
		OPEN @C
		FETCH NEXT FROM @C INTO @Ma_bai_kiem_tra,@Ma_mon_hoc
		
		WHILE @@FETCH_STATUS = 0
		BEGIN
			INSERT INTO ChiTietDiem
			SELECT 							
				C.ID				as	'Ma_dang_ky_mon_hoc',
				@Ma_bai_kiem_tra	as	'Ma_bai_kiem_tra',
				-1					as	'Diem',
				'0'					as	'Ghi_chu',
				getdate()			as	'Ngay_cap_nhat_cuoi',				
				''					as	'User1',
				''					as	'User2',
				''					as	'User3',
				''					as	'User4',
				''					as	'User5'				
			FROM ThoiKhoaBieu A		
			INNER JOIN MonHocTKB B ON A.ID=B.Ma_TKB
			INNER JOIN DangKyMonHoc C ON B.ID=C.Ma_mon_hoc_TKB
			WHERE A.ID=@MaTKB
			AND B.Ma_mon_hoc=@Ma_mon_hoc
			
			FETCH NEXT FROM @C INTO @Ma_bai_kiem_tra,@Ma_mon_hoc
		END
		
		CLOSE @C
		DEALLOCATE @C
		
	END
	
END