
/***********************************************************
* Purpose : SET "CVCB"
* Author : Tam kute
* Date: 19-12-2010
* Description: Set Cong viec chuan bi for kehoachgiangday
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_iso_SetCVCBKHGD') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].sp_iso_SetCVCBKHGD
GO
CREATE PROCEDURE sp_iso_SetCVCBKHGD
	@CVCB				nvarchar(2000) output
AS
BEGIN
	SET @CVCB=N'- Chuẩn bị bài giảng, slide lý thuyết, bài hướng dẫn thực hành.
- Chuẩn bị câu hỏi trắc nghiệm lý thuyết
- Chuẩn bị máy chiếu, bảng viết'
END

