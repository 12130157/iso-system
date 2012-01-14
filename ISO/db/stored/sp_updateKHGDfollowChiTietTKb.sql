IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE NAME='sp_updateKHGDfollowChiTietTKB')
BEGIN
	DROP PROC sp_updateKHGDfollowChiTietTKB
END
GO
CREATE PROC sp_updateKHGDfollowChiTietTKB
@Ma_to_trinh INT
AS
BEGIN
	DECLARE @C CURSOR
	DECLARE @Ma_CTTKB INT
	DECLARE @Thu_trong_tuan INT
	DECLARE @Tuan INT
	DECLARE @Buoi NVARCHAR(100)
	DECLARE @Phong INT
	DECLARE @Ngay_hoc DATETIME
	
	DECLARE	@So_thu_tu INT	
	DECLARE @Ma_lop INT
	DECLARE @Hoc_ki INT
	DECLARE @Nam_bat_dau INT
	DECLARE @Ma_nam_hoc INT
	DECLARE @Ma_mon_hoc_TKB INT
	DECLARE @Ma_mon_hoc INT

	DECLARE @Ma_CTKHGD INT
	
	DECLARE @Ma_GA INT

	SET @C = CURSOR FOR SELECT Ma_chi_tiet_TKB,Thu_trong_tuan,Buoi,Ma_phong,Tuan,Ngay_hoc FROM CHITIETTKBTHAYDOI WHERE Ma_to_trinh=@Ma_to_trinh
	OPEN @C
	FETCH NEXT FROM @C INTO @Ma_CTTKB,@Thu_trong_tuan,@Buoi,@Phong,@Tuan,@Ngay_hoc
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @So_thu_tu=So_thu_tu FROM ChiTietTKB WHERE ID=@Ma_CTTKB
		SELECT @Ma_mon_hoc_TKB=Ma_mon_hoc_TKB FROM CHITIETTKB WHERE ID=@Ma_CTTKB
		SELECT @Ma_lop=Ma_lop,@Hoc_ki=Hoc_ki,@Nam_bat_dau=Nam_bat_dau FROM THOIKHOABIEU WHERE ID=(SELECT MA_TKB FROM CHITIETTKB WHERE ID=@Ma_CTTKB)
		SELECT @Ma_nam_hoc=ID FROM NAMHOC WHERE Nam_bat_dau=@Nam_bat_dau
		SELECT @Ma_mon_hoc=Ma_mon_hoc FROM MONHOCTKB WHERE ID=@Ma_mon_hoc_TKB 
		
		SELECT @Ma_CTKHGD=B.ID FROM KEHOACHGIANGDAY A INNER JOIN CHITIETKHGD B ON A.ID=B.MA_KE_HOACH_GIANG_DAY
		WHERE A.Ma_mon_hoc=@Ma_mon_hoc AND A.Ma_lop=@Ma_lop AND A.Ma_nam_hoc=@Ma_nam_hoc AND A.Hoc_ki=@Hoc_ki AND B.User1=@So_thu_tu

		PRINT @Ma_CTTKB
		PRINT @Ma_mon_hoc
		PRINT @Ma_lop
		PRINT @Ma_nam_hoc
		PRINT @Hoc_ki
		PRINT @So_thu_tu	
		PRINT '------------'
	
		IF(@Ma_CTKHGD <> '')
		BEGIN
			UPDATE CHITIETKHGD 
			SET Tuan=@Tuan,Buoi=@Buoi,Ngay_BD=@Ngay_hoc,Thu=@Thu_trong_tuan,Ten_phong=(SELECT Ki_hieu_phong FROM PHONGBAN WHERE ID=@Phong)
			WHERE ID=@Ma_CTKHGD
			SELECT @Ma_GA=Ma_giao_an FROM CHITIETKHGD WHERE ID=@Ma_CTKHGD
			UPDATE GIAOAN SET Ngay_thuc_hien=@Ngay_hoc WHERE ID=@Ma_GA
		END
		FETCH NEXT FROM @C INTO @Ma_CTTKB,@Thu_trong_tuan,@Buoi,@Phong,@Tuan,@Ngay_hoc
	END
	CLOSE @C
	DEALLOCATE @C
END
