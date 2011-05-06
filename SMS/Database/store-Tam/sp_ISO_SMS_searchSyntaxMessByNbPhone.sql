IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessByNbPhone')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessByNbPhone
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessByNbPhone
	@SoDienThoai		varchar(20)
AS
BEGIN
	IF @SoDienThoai = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessInbox
	END
	ELSE
	BEGIN
		SELECT	A.ID,A.So_dien_thoai,A.Noi_dung_tin_nhan,
				B.Cum_tu_1+' '+B.Cum_tu_2+' '+B.Cum_tu_3+
				' '+B.Cum_tu_4+' '+B.Cum_tu_5+' '+B.Cum_tu_6 +
				' '+B.Cum_tu_7 +' '+B.Cum_tu_8 +' '+B.Cum_tu_9 +
				' '+B.Cum_tu_10  AS 'Cu_phap'
				,dbo.statusToString(A.Tinh_trang) AS 'Tinh_trang',
				A.Ngay_nhan,dbo.fnc_ISO_SMS_statusReply(A.Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'
		FROM HopThuDen AS A 

		INNER JOIN CuPhap AS B
		ON A.Ma_cu_phap = B.ID

		WHERE	A.Loai_hop_thu = 0 
		AND		A.tinh_trang != 3
		AND		A.So_dien_thoai LIKE '%'+@SoDienThoai+'%'
		ORDER BY A.tinh_trang ASC,A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessByNbPhone '3'