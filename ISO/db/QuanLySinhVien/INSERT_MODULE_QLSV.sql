/*
Tác giả: La Quốc Chương
Ngày: 24-09-2011
Mô tả: thêm vào hungvuongsystem 1 module mới là QuanLySinhVien
*/
--------- Tạo App
INSERT INTO sys_App VALUES(N'Quản Lý Sinh Viên','/HungVuongISO/QuanLySinhVien/Intro.jsp','images/icon/quanlynhansu.png',getdate(),'','','','','')

--	SELECT * FROM sys_Role_App
--	SELECT * FROM VaiTro
--  Phân Quyền App
INSERT INTO sys_Role_App VALUES('0','7','','','','','')
INSERT INTO sys_Role_App VALUES('1','7','','','','','')
INSERT INTO sys_Role_App VALUES('2','7','','','','','')
INSERT INTO sys_Role_App VALUES('3','7','','','','','')
INSERT INTO sys_Role_App VALUES('4','7','','','','','')
INSERT INTO sys_Role_App VALUES('5','7','','','','','')
INSERT INTO sys_Role_App VALUES('6','7','','','','','')
INSERT INTO sys_Role_App VALUES('7','7','','','','','')
INSERT INTO sys_Role_App VALUES('8','7','','','','','')
INSERT INTO sys_Role_App VALUES('11','7','','','','','')
INSERT INTO sys_Role_App VALUES('14','7','','','','','')


--	SELECT * FROM sys_Menu
-------- Tạo Menu
--45
INSERT INTO sys_Menu VALUES('7',N'Home','images/icon_menu/home.png','/HungVuongISO/home.jsp','','','','','')
--46
INSERT INTO sys_Menu VALUES('7',N'Tìm Kiếm Sinh Viên','images/icon_menu/report.png','/HungVuongISO/QuanLySinhVien/TimKiemSinhVien.jsp','','','','','')
--47
INSERT INTO sys_Menu VALUES('7',N'Thông Tin Cá Nhân','images/icon_menu/report.png','/HungVuongISO/QuanLySinhVien/ThongTinCaNhan.jsp','','','','','')
--48
INSERT INTO sys_Menu VALUES ('7',N'Sơ Lược Lý Lịch','images/icon_menu/report.png','/HungVuongISO/QuanLySinhVien/SoLuocLyLich.jsp','','','','','')
--	SELECT * FROM sys_Role_Menu
--	SELECT * FROM VaiTro

----------- Phân Quyền Menu
-- 16	Admin
INSERT INTO sys_Role_Menu VALUES('16','46','','','','','')
INSERT INTO sys_Role_Menu VALUES('16','47','','','','','')
INSERT INTO sys_Role_Menu VALUES('16','48','','','','','')
INSERT INTO sys_Role_Menu VALUES('16','49','','','','','')

-- 0	Ban Giam Hieu
INSERT INTO sys_Role_Menu VALUES('0','46','','','','','')
INSERT INTO sys_Role_Menu VALUES('0','47','','','','','')
INSERT INTO sys_Role_Menu VALUES('0','48','','','','','')
INSERT INTO sys_Role_Menu VALUES('0','49','','','','','')

-- 1	Dao tao -- xem
INSERT INTO sys_Role_Menu VALUES('1','46','','','','','')
INSERT INTO sys_Role_Menu VALUES('1','47','','','','','')
INSERT INTO sys_Role_Menu VALUES('1','48','','','','','')
INSERT INTO sys_Role_Menu VALUES('1','49','','','','','')

-- 2	Phong Hanh Chanh 
INSERT INTO sys_Role_Menu VALUES('2','46','','','','','')
INSERT INTO sys_Role_Menu VALUES('2','47','','','','','')
INSERT INTO sys_Role_Menu VALUES('2','48','','','','','')
INSERT INTO sys_Role_Menu VALUES('2','49','','','','','')

-- 4	Phòng đảm bảo chất lượng
INSERT INTO sys_Role_Menu VALUES('4','46','','','','','')
INSERT INTO sys_Role_Menu VALUES('4','47','','','','','')
INSERT INTO sys_Role_Menu VALUES('4','48','','','','','')
INSERT INTO sys_Role_Menu VALUES('4','49','','','','','')

-- 6	Công nghệ thông tin
INSERT INTO sys_Role_Menu VALUES('6','46','','','','','')
INSERT INTO sys_Role_Menu VALUES('6','47','','','','','')
INSERT INTO sys_Role_Menu VALUES('6','48','','','','','')
INSERT INTO sys_Role_Menu VALUES('6','49','','','','','')

-- 7	Dien tu
INSERT INTO sys_Role_Menu VALUES('7','46','','','','','')
INSERT INTO sys_Role_Menu VALUES('7','47','','','','','')
INSERT INTO sys_Role_Menu VALUES('7','48','','','','','')
INSERT INTO sys_Role_Menu VALUES('7','49','','','','','')

-- 8	Ky That lanh
INSERT INTO sys_Role_Menu VALUES('8','46','','','','','')
INSERT INTO sys_Role_Menu VALUES('8','47','','','','','')
INSERT INTO sys_Role_Menu VALUES('8','48','','','','','')
INSERT INTO sys_Role_Menu VALUES('8','49','','','','','')

-- 9	Co khi dong luc
INSERT INTO sys_Role_Menu VALUES('9','46','','','','','')
INSERT INTO sys_Role_Menu VALUES('9','47','','','','','')
INSERT INTO sys_Role_Menu VALUES('9','48','','','','','')
INSERT INTO sys_Role_Menu VALUES('9','49','','','','','')

-- 10	co khi chinh xac
INSERT INTO sys_Role_Menu VALUES('10','46','','','','','')
INSERT INTO sys_Role_Menu VALUES('10','47','','','','','')
INSERT INTO sys_Role_Menu VALUES('10','48','','','','','')
INSERT INTO sys_Role_Menu VALUES('10','49','','','','','')

-- 11	lai xe
INSERT INTO sys_Role_Menu VALUES('11','46','','','','','')
INSERT INTO sys_Role_Menu VALUES('11','47','','','','','')
INSERT INTO sys_Role_Menu VALUES('11','48','','','','','')
INSERT INTO sys_Role_Menu VALUES('11','49','','','','','')

-- 12	TT Aptech
INSERT INTO sys_Role_Menu VALUES('12','46','','','','','')
INSERT INTO sys_Role_Menu VALUES('12','47','','','','','')
INSERT INTO sys_Role_Menu VALUES('12','48','','','','','')
INSERT INTO sys_Role_Menu VALUES('12','49','','','','','')

-- 13	Trung tam co dien tu
INSERT INTO sys_Role_Menu VALUES('13','46','','','','','')
INSERT INTO sys_Role_Menu VALUES('13','47','','','','','')
INSERT INTO sys_Role_Menu VALUES('13','48','','','','','')
INSERT INTO sys_Role_Menu VALUES('13','49','','','','','')

-- 14	TT Cat May
INSERT INTO sys_Role_Menu VALUES('14','46','','','','','')
INSERT INTO sys_Role_Menu VALUES('14','47','','','','','')
INSERT INTO sys_Role_Menu VALUES('14','48','','','','','')
INSERT INTO sys_Role_Menu VALUES('14','49','','','','','')

-- 15	ke toan
INSERT INTO sys_Role_Menu VALUES('15','46','','','','','')
INSERT INTO sys_Role_Menu VALUES('15','47','','','','','')
INSERT INTO sys_Role_Menu VALUES('15','48','','','','','')
INSERT INTO sys_Role_Menu VALUES('15','49','','','','','')