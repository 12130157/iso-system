IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchSyntaxMessErrorSentByNbPhone')
BEGIN
	DROP PROC sp_ISO_SMS_searchSyntaxMessErrorSentByNbPhone
END
GO
CREATE PROC sp_ISO_SMS_searchSyntaxMessErrorSentByNbPhone
	@SoDienThoai		varchar(20)
AS
BEGIN
	IF @SoDienThoai = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllSyntaxMessErrorSent
	END
	ELSE
	BEGIN
		SELECT	A.id,A.so_dien_thoai,A.noi_dung_tin_nhan,
			C.cum_tu_1+' '+C.cum_tu_2+' '+C.cum_tu_3+' '+C.cum_tu_4+' '+
			C.cum_tu_5+' '+C.cum_tu_6+' '+C.cum_tu_7+' '+C.cum_tu_8+' '+
			C.cum_tu_9+' '+C.cum_tu_10 AS 'Cu_Phap',A.ngay_gui 

		FROM HopThuDi AS A 
	
		INNER JOIN HopThuDen AS B
		ON B.ma_tin_nhan_tra_loi = A.id
	
		INNER JOIN CuPhap AS C
		ON B.ma_cu_phap = C.id

		WHERE A.tinh_trang = 0 AND A.loai_hop_thu = 4
		AND		A.So_dien_thoai LIKE '%'+@SoDienThoai+'%'
		
		ORDER BY A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchSyntaxMessErrorSentByNbPhone '34'