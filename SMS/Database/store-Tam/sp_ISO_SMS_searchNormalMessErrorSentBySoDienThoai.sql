IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchNormalMessErrorSentBySoDienThoai')
BEGIN
	DROP PROC sp_ISO_SMS_searchNormalMessErrorSentBySoDienThoai
END
GO
CREATE PROC sp_ISO_SMS_searchNormalMessErrorSentBySoDienThoai
	@SoDienThoai		varchar(20)
AS
BEGIN
	IF @SoDienThoai = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllNormalMessErrorSent
	END
	ELSE
	BEGIN
		SELECT id,so_dien_thoai,noi_dung_tin_nhan,ngay_gui 

		FROM HopThuDi 
	
		WHERE tinh_trang = 0 AND loai_hop_thu = 6
		AND		So_dien_thoai LIKE '%'+@SoDienThoai+'%'

		ORDER BY id DESC
	END
END

--EXEC sp_ISO_SMS_searchNormalMessErrorSentBySoDienThoai '34'