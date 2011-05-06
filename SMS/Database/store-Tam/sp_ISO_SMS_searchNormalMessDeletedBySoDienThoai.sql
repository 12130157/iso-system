IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchNormalMessDeletedBySoDienThoai')
BEGIN
	DROP PROC sp_ISO_SMS_searchNormalMessDeletedBySoDienThoai
END
GO
CREATE PROC sp_ISO_SMS_searchNormalMessDeletedBySoDienThoai
	@SoDienThoai		varchar(20)
AS
BEGIN
	IF @SoDienThoai = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllNormalMessDeletedInbox
	END
	ELSE
	BEGIN
		SELECT	ID,So_dien_thoai,Noi_dung_tin_nhan,Ngay_nhan,
				dbo.fnc_ISO_SMS_statusReply(Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'

		FROM HopThuDen  

		WHERE	Loai_hop_thu = 2 AND tinh_trang = 3
		AND		So_dien_thoai LIKE '%'+@SoDienThoai+'%'

		ORDER BY ngay_cap_nhat_cuoi ASC , id DESC
	END
END

--EXEC sp_ISO_SMS_searchNormalMessDeletedBySoDienThoai '3'