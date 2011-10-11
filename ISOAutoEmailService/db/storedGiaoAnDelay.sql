--sp_ISO_GetGiaoAnDelayList.sql
IF EXISTS (SELECT * FROM sysobjects WHERE NAME ='sp_ISO_GetGiaoAnDelayList')
BEGIN 
	DROP PROC sp_ISO_GetGiaoAnDelayList
END 
GO
-------
CREATE PROCEDURE sp_ISO_GetGiaoAnDelayList
	@Day		int
AS
BEGIN
	-----
	IF EXISTS (SELECT * FROM sysobjects WHERE NAME ='GiaoAnDelayList')
	BEGIN
		DROP TABLE GiaoAnDelayList
	END
	-----
	CREATE TABLE GiaoAnDelayList(
		id_ChiTietKHGD		int,
		Ma_giao_vien		int,
		Ho_ten_giao_vien	nvarchar(50),
		Email				nvarchar(50),
		Ma_lop				int,
		Ten_lop				nvarchar(50),
		Ma_mon_hoc			int,
		Ten_mon_hoc			nvarchar(50),
		Giao_an_so			int,
		Ngay_day			datetime,
		Nhom				int
	)
	
	INSERT INTO GiaoAnDelayList
	SELECT 
		B.ID AS 'id_ChiTietKHGD', 
		A.Ma_giao_vien,
		D.Ho + ' ' + D.Ten_lot + ' ' + D.Ten AS 'Ho_ten_giao_vien',
		D.Email,
		A.Ma_lop,
		E.Ki_hieu AS 'Ten_lop',
		A.Ma_mon_hoc,
		F.Ten_mon_hoc,
		B.STT_noi_dung AS 'Giao_an_so',
		B.Ngay_BD AS 'Ngay_day',
		B.Nhom AS 'Nhom'				
	FROM KeHoachGiangDay A
	inner join ChiTietKHGD B on A.ID=B.Ma_ke_hoach_giang_day
	inner join ThanhVien C on A.Ma_giao_vien=C.ID
	inner join ChiTietThanhVien D on C.Ten_DN=D.Ten_dang_nhap
	inner join LopHoc E on A.Ma_lop=E.ID
	inner join MonHoc F on A.Ma_mon_hoc=F.ID
	WHERE --Ma_ke_hoach_giang_day=1
	/*and*/ ISNULL(B.Ma_giao_an,'')=''
	and DATEDIFF(day, getdate(),B.Ngay_BD) >=0 
	and DATEDIFF(day, getdate(),B.Ngay_BD) <= @Day
	and ISNULL(B.User1,'') = ''		
	
	-- UPDATE COLUMN USER1 TRONG TABLE ChiTietKHGD THANH 1, CO HIEU LA DA EMAIL NHAC NHO GIAOAN DELAY ROI	
	DECLARE @ID_ChiTietKHGD INT		
	DECLARE @C CURSOR		
	SET @C = CURSOR FOR SELECT id_ChiTietKHGD FROM GiaoAnDelayList
		
	OPEN @C
	FETCH NEXT FROM @C INTO @ID_ChiTietKHGD
		
	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE ChiTietKHGD
		SET User1 = '1'
		WHERE ID = @ID_ChiTietKHGD
		
		FETCH NEXT FROM @C INTO @ID_ChiTietKHGD
	END
END
