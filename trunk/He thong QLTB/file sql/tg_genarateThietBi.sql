
/***********************************************************
* Purpose : Tu dong genarate data vao cac table THIET BI
* Author : ThanhTC
* Date: 20-12-2011
* Description: Khi thoi khoa bieu duoc HT approve thi trigger nay
*    se tu dong genarate data vao cac table 
*			1. SoGiaoNhanThietBi
*			2. ChiTietPhieuGiaoNhanThietBi
*			3. ChiTietMuonThietBi
***********************************************************/

if exists (select * from dbo.sysobjects where name='tg_genarateThietBi') 
begin
	drop trigger tg_genarateThietBi
end

go
CREATE TRIGGER tg_genarateThietBi ON ThoiKhoaBieu
FOR UPDATE
AS
BEGIN
	DECLARE @Ma_TKB INT  
	DECLARE @Tinh_trang INT  
	DECLARE @Ma_lop INT  
	DECLARE @Hoc_ki INT
	DECLARE @Nam INT
 
	SELECT @Ma_TKB = ID,@Tinh_trang = Tinh_trang,@Ma_lop=Ma_lop, @Hoc_ki=Hoc_ki,@Nam=Nam_bat_dau FROM INSERTED  
 
 -- Neu tinh trang = 2(HT approve) thi xu ly  
	IF @Tinh_trang = 2  
	BEGIN  
		DECLARE @C CURSOR
		DECLARE @Ma_so_giao_nhan_thiet_bi INT
		DECLARE @Phong INT
		-- Lấy tổng số phòng của TKB này sẽ học
		SET @C = CURSOR FOR 
			SELECT DISTINCT Ma_phong FROM CHITIETTKB WHERE MA_TKB=@Ma_TKB
		OPEN @C
		FETCH NEXT FROM @C INTO @Phong
		BEGIN
			-- Kiểm tra phòng này đã có trong sổ giao nhận chưa? nếu không có thì tạo mới, ngược lại lấy Ma_so_giao_nhan_thiet_bi từ SoGiaoNhanThietBi
			IF EXISTS (SELECT * FROM SoGiaoNhanThietBi WHERE Phong=@Phong AND Hoc_ki=@Hoc_ki AND Nam=@Nam)
			BEGIN
				SELECT @Ma_so_giao_nhan_thiet_bi=ID FROM SoGiaoNhanThietBi WHERE Phong=@Phong AND Hoc_ki=@Hoc_ki AND Nam=@Nam
			END
			ELSE
			BEGIN
				INSERT INTO SoGiaoNhanThietBi(Phong,Hoc_ki,Nam,Ghi_chu,Nguoi_lap,Ngay_lap,Tinh_trang,Ngay_cap_nhat_cuoi)
				VALUES (@Phong,@Hoc_ki,@Nam,'',259,GETDATE(),0,GETDATE())
				SELECT @Ma_so_giao_nhan_thiet_bi=MAX(ID) FROM SoGiaoNhanThietBi
			END
			
			DECLARE @C1 CURSOR
			DECLARE	@Ma_giao_vien INT
			DECLARE @Ngay_hoc DATETIME
			DECLARE @Buoi NVARCHAR(100)
			DECLARE @Ma_CTPGNTB INT
			DECLARE @Ma_thiet_bi INT
			-- Lấy số ngày học tại phòng này của lớp học này để insert vào ChiTietSoGiaoNhanThietBi
			SET @C1 = CURSOR FOR 
				SELECT C.Ma_giao_vien,B.Ngay_hoc,B.Buoi FROM THOIKHOABIEU A INNER JOIN CHITIETTKB B ON B.MA_TKB=A.ID
				INNER JOIN MONHOCTKB C ON B.Ma_mon_hoc_TKB=C.ID
				WHERE A.ID=@Ma_TKB AND B.Ma_phong=@Phong
			
			OPEN @C1
			FETCH NEXT FROM C1 INTO @Ma_giao_vien,@Ngay_hoc,@Buoi
			WHILE @@FETCH_STATUS = 0
			BEGIN
				DECLARE @Bat_dau VARCHAR(100) 
				DECLARE @Ket_thuc VARCHAR(100)
				IF @Buoi like '%Sáng%'
				BEGIN
					SET @Bat_dau = CONVERT(VARCHAR(10),@Ngay_hoc,110)+' 7:30:00'
					SET @Ket_thuc = CONVERT(VARCHAR(10),@Ngay_hoc,110)+' 11:00:00'
				END
				IF @Buoi like '%Chiều%'
				BEGIN
					SET @Bat_dau = CONVERT(VARCHAR(10),@Ngay_hoc,110)+' 1:30:00'
					SET @Ket_thuc = CONVERT(VARCHAR(10),@Ngay_hoc,110)+' 5:00:00'
				END
				INSERT INTO ChiTietSoGiaoNhanThietBi(Ma_so_giao_nhan,Ten_so_giao_nhan,Lop,Ngay_Nhan,Tinh_trang,Ngay_cap_nhat_cuoi)
				VALUES (@Ma_so_giao_nhan_thiet_bi,'',@Ma_lop,@Ngay_hoc,0,GETDATE())
				SELECT @Ma_CTPGNTB=MAX(ID) FROM ChiTietSoGiaoNhanThietBi

				DECLARE @C2 CURSOR 
				-- Lấy thiết bị tại phòng này và những thiết bị là PC, insert vào table ChiTietPhieuMuon theo Buổi (Sáng hoặc Chiều)
				SET @C2 = CURSOR FOR 
					SELECT ID FROM THIETBI WHERE Vi_tri_lap_dat=@Phong 
					AND Ma_loai_thiet_bi=(SELECT ID FROM LOAITHIETBI WHERE TEN_LOAI_THIET_BI LIKE '%PC%')
				OPEN @C2
				FETCH NEXT FROM @C2 INTO @Ma_thiet_bi
				WHILE @@FETCH_STATUS=0
				BEGIN
					INSERT INTO CHITIETMUONTHIETBI(Ma_chi_tiet_PGNTB,Ma_thiet_bi,Thoi_gian_nhan,Thoi_gian_tra)
					VALUES (@Ma_CTPGNTB,@Ma_thiet_bi,@Bat_dau,@Ket_thuc)
					FETCH NEXT FROM @C2 INTO @Ma_thiet_bi	
				END
				CLOSE @C2
				DEALLOCATE @C2
				FETCH NEXT FROM C1 INTO @Ma_giao_vien,@Ngay_hoc,@Buoi
			END
			CLOSE @C1
			DEALLOCATE @C1
			FETCH NEXT FROM @C INTO @Phong
		END 
		CLOSE @C  
		DEALLOCATE @C  
	END
END