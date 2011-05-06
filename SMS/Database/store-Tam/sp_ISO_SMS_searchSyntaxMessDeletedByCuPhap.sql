IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessDeletedByCuPhap')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessDeletedByCuPhap
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessDeletedByCuPhap
	@CuPhap		varchar(100)
AS
BEGIN
	IF @CuPhap = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessDeletedInbox
	END
	ELSE
	BEGIN
		SELECT	A.ID,A.So_dien_thoai,A.Noi_dung_tin_nhan,
			B.Cum_tu_1+' '+B.Cum_tu_2+' '+B.Cum_tu_3+
			' '+B.Cum_tu_4+' '+B.Cum_tu_5+' '+B.Cum_tu_6 +
			' '+B.Cum_tu_7 +' '+B.Cum_tu_8 +' '+B.Cum_tu_9 +
			' '+B.Cum_tu_10  AS 'Cu_phap',A.Ngay_nhan,
			dbo.fnc_ISO_SMS_statusReply(A.Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'
	
		FROM HopThuDen AS A 

		INNER JOIN CuPhap AS B
		ON A.Ma_cu_phap = B.ID

		WHERE	A.Loai_hop_thu = 0 
		AND		A.tinh_trang = 3
		AND		B.Cum_tu_1+' '+B.Cum_tu_2+' '+B.Cum_tu_3+
				' '+B.Cum_tu_4+' '+B.Cum_tu_5+' '+B.Cum_tu_6 +
				' '+B.Cum_tu_7 +' '+B.Cum_tu_8 +' '+B.Cum_tu_9 +
				' '+B.Cum_tu_10 LIKE '%'+@CuPhap+'%'

		ORDER BY A.ngay_cap_nhat_cuoi ASC,A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessDeletedByNoiDungTinNhan '3'