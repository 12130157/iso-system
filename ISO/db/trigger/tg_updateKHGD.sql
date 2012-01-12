IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE NAME='TG_UPDATEKHGD')
BEGIN
	DROP TRIGGER tg_updateKHGD
END
GO
CREATE TRIGGER tg_updateKHGD
ON CHITIETTKB 
FOR UPDATE
AS
BEGIN
	DECLARE @Ma_CTTKB INT
	DECLARE @Tuan INT
	DECLARE @Buoi NVARCHAR(100)
	DECLARE @Hinh_thuc_day VARCHAR(10)
	DECLARE @Nhom INT
	DECLARE @Ngay_hoc DATETIME

	DECLARE	@So_thu_tu INT	
	DECLARE @Ma_lop INT
	DECLARE @Hoc_ki INT
	DECLARE @Nam_bat_dau INT
	DECLARE @Ma_nam_hoc INT
	DECLARE @Ma_mon_hoc_TKB INT
	DECLARE @Ma_mon_hoc INT

	DECLARE @Ma_CTKHGD INT

	SELECT @Ma_CTTKB=ID,@Tuan=Tuan,@Buoi=Buoi,@Nhom=Nhom,@So_thu_tu=So_thu_tu,@Ngay_hoc=Ngay_hoc FROM INSERTED
	SELECT @Ma_mon_hoc_TKB=Ma_mon_hoc_TKB FROM CHITIETTKB WHERE ID=@Ma_CTTKB
	SELECT @Ma_lop=Ma_lop,@Hoc_ki=Hoc_ki,@Nam_bat_dau=Nam_bat_dau FROM THOIKHOABIEU WHERE ID=(SELECT MA_TKB FROM CHITIETTKB WHERE ID=@Ma_CTTKB)
	SELECT @Ma_nam_hoc=ID FROM NAMHOC WHERE Nam_bat_dau=@Nam_bat_dau
	SELECT @Ma_mon_hoc=Ma_mon_hoc FROM MONHOCTKB WHERE ID=@Ma_mon_hoc_TKB 
	
	SELECT @Ma_CTKHGD=B.ID FROM KEHOACHGIANGDAY A INNER JOIN CHITIETKHGD B ON A.ID=B.MA_KE_HOACH_GIANG_DAY
	WHERE A.Ma_mon_hoc=@Ma_mon_hoc AND A.Ma_lop=@Ma_lop AND A.Ma_nam_hoc=@Ma_nam_hoc AND A.Hoc_ki=@Hoc_ki AND B.User1=@So_thu_tu

	IF(@Ma_CTKHGD <> '')
	BEGIN
		UPDATE CHITIETKHGD 
		SET Tuan=@Tuan,Buoi=@Buoi,Nhom=@Nhom,Ngay_BD=@Ngay_hoc
		WHERE ID=@Ma_CTKHGD
	END
END
