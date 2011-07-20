
INSERT INTO sys_App VALUES(N'Quản Lý Nhân Sự','/HungVuongISO/NhanSu/Intro.jsp','images/icon/quanlynhansu.png',getdate(),'','','','','')

INSERT INTO sys_Role_App VALUES('0','6','','','','','')
INSERT INTO sys_Role_App VALUES('1','6','','','','','')
INSERT INTO sys_Role_App VALUES('2','6','','','','','')
INSERT INTO sys_Role_App VALUES('3','6','','','','','')
INSERT INTO sys_Role_App VALUES('4','6','','','','','')
INSERT INTO sys_Role_App VALUES('5','6','','','','','')
INSERT INTO sys_Role_App VALUES('6','6','','','','','')
INSERT INTO sys_Role_App VALUES('7','6','','','','','')
INSERT INTO sys_Role_App VALUES('8','6','','','','','')
INSERT INTO sys_Role_App VALUES('11','6','','','','','')
INSERT INTO sys_Role_App VALUES('14','6','','','','','')

--	SELECT * FROM sys_Menu
--36
INSERT INTO sys_Menu VALUES('6',N'Home','images/icon_menu/home.png','/HungVuongISO/home.jsp','','','','','')
--37
INSERT INTO sys_Menu VALUES('6',N'Tìm Kiếm Nhân Sự','images/icon_menu/report.png','/HungVuongISO/NhanSu/Intro.jsp','','','','','')
--38
INSERT INTO sys_Menu VALUES('6',N'Đề Nghị Tuyển Nhân Sự','images/icon_menu/dichuyenthietbi.png','/HungVuongISO/NhanSu/DeNghiTuyenNhanSu/showDeNghiTuyenNhanSu.jsp','','','','','')
--39
INSERT INTO sys_Menu VALUES('6',N'Kế Hoạch Tuyển Nhân Sự','images/icon_menu/kehoach_giangday.png','/HungVuongISO/NhanSu/KeHoachTuyenNhanSu/showKeHoachTuyenDungNhanSu.jsp','','','','','')
--40
INSERT INTO sys_Menu VALUES('6',N'Hồ Sơ Dự Tuyển','images/icon_menu/diemdanhbaocao.png','/HungVuongISO/NhanSu/HoSoDuTuyen/showHoSoDuTuyen.jsp','','','','','')
--41
INSERT INTO sys_Menu VALUES('6',N'Đề Nghị Khoán Thử Việc','images/icon_menu/kehoachdaotao.png','/HungVuongISO/NhanSu/DeNghiKhoanThuViec/showDeNghiKhoanThuViec.jsp','','','','','')
--42
INSERT INTO sys_Menu VALUES('6',N'Tự Nhận Xét Kết Qủa Thử Việc','images/icon_menu/ctdaotao.png','/HungVuongISO/NhanSu/NhanXetKetQuaThuViec/showNhanXetKetQuaThuViec.jsp','','','','','')
--43
INSERT INTO sys_Menu VALUES('6',N'Hợp Đồng Lao Động (lần đầu)','images/icon_menu/quyetdinhdaotao.png','/HungVuongISO/NhanSu/HopDongLaoDongLanDau/showHopDongLaoDongLanDau.jsp','','','','','')
--	SELECT * FROM sys_Role_Menu
--	SELECT * FROM VaiTro
-- 16	Admin
INSERT INTO sys_Role_Menu VALUES('16','36','','','','','')
INSERT INTO sys_Role_Menu VALUES('16','37','','','','','')
INSERT INTO sys_Role_Menu VALUES('16','38','','','','','')
INSERT INTO sys_Role_Menu VALUES('16','39','','','','','')
INSERT INTO sys_Role_Menu VALUES('16','40','','','','','')
INSERT INTO sys_Role_Menu VALUES('16','41','','','','','')
INSERT INTO sys_Role_Menu VALUES('16','42','','','','','')
INSERT INTO sys_Role_Menu VALUES('16','43','','','','','')

-- 0	Ban Giam Hieu
INSERT INTO sys_Role_Menu VALUES('0','36','','','','','')
INSERT INTO sys_Role_Menu VALUES('0','37','','','','','')
INSERT INTO sys_Role_Menu VALUES('0','38','','','','','')
INSERT INTO sys_Role_Menu VALUES('0','39','','','','','')
INSERT INTO sys_Role_Menu VALUES('0','40','','','','','')
INSERT INTO sys_Role_Menu VALUES('0','41','','','','','')
INSERT INTO sys_Role_Menu VALUES('0','42','','','','','')
INSERT INTO sys_Role_Menu VALUES('0','43','','','','','')

-- 1	Dao tao -- xem
INSERT INTO sys_Role_Menu VALUES('1','36','','','','','')
INSERT INTO sys_Role_Menu VALUES('1','37','','','','','')
INSERT INTO sys_Role_Menu VALUES('1','38','','','','','')
INSERT INTO sys_Role_Menu VALUES('1','39','','','','','')
INSERT INTO sys_Role_Menu VALUES('1','40','','','','','')
INSERT INTO sys_Role_Menu VALUES('1','41','','','','','')
INSERT INTO sys_Role_Menu VALUES('1','42','','','','','')
INSERT INTO sys_Role_Menu VALUES('1','43','','','','','')

-- 2	Phong Hanh Chanh 
INSERT INTO sys_Role_Menu VALUES('2','36','','','','','')
INSERT INTO sys_Role_Menu VALUES('2','37','','','','','')
INSERT INTO sys_Role_Menu VALUES('2','38','','','','','')
INSERT INTO sys_Role_Menu VALUES('2','39','','','','','')
INSERT INTO sys_Role_Menu VALUES('2','40','','','','','')
INSERT INTO sys_Role_Menu VALUES('2','41','','','','','')
INSERT INTO sys_Role_Menu VALUES('2','42','','','','','')
INSERT INTO sys_Role_Menu VALUES('2','43','','','','','')

-- 4	Phòng đảm bảo chất lượng
INSERT INTO sys_Role_Menu VALUES('4','36','','','','','')
INSERT INTO sys_Role_Menu VALUES('4','37','','','','','')
INSERT INTO sys_Role_Menu VALUES('4','38','','','','','')
INSERT INTO sys_Role_Menu VALUES('4','39','','','','','')
INSERT INTO sys_Role_Menu VALUES('4','40','','','','','')
INSERT INTO sys_Role_Menu VALUES('4','41','','','','','')
INSERT INTO sys_Role_Menu VALUES('4','42','','','','','')
INSERT INTO sys_Role_Menu VALUES('4','43','','','','','')

-- 6	Công nghệ thông tin
INSERT INTO sys_Role_Menu VALUES('6','36','','','','','')
INSERT INTO sys_Role_Menu VALUES('6','37','','','','','')
INSERT INTO sys_Role_Menu VALUES('6','38','','','','','')
INSERT INTO sys_Role_Menu VALUES('6','39','','','','','')
INSERT INTO sys_Role_Menu VALUES('6','40','','','','','')
INSERT INTO sys_Role_Menu VALUES('6','41','','','','','')
INSERT INTO sys_Role_Menu VALUES('6','42','','','','','')
INSERT INTO sys_Role_Menu VALUES('6','43','','','','','')

-- 7	Dien tu
INSERT INTO sys_Role_Menu VALUES('7','36','','','','','')
INSERT INTO sys_Role_Menu VALUES('7','37','','','','','')
INSERT INTO sys_Role_Menu VALUES('7','38','','','','','')
INSERT INTO sys_Role_Menu VALUES('7','39','','','','','')
INSERT INTO sys_Role_Menu VALUES('7','40','','','','','')
INSERT INTO sys_Role_Menu VALUES('7','41','','','','','')
INSERT INTO sys_Role_Menu VALUES('7','42','','','','','')
INSERT INTO sys_Role_Menu VALUES('7','43','','','','','')

-- 8	Ky That lanh
INSERT INTO sys_Role_Menu VALUES('8','36','','','','','')
INSERT INTO sys_Role_Menu VALUES('8','37','','','','','')
INSERT INTO sys_Role_Menu VALUES('8','38','','','','','')
INSERT INTO sys_Role_Menu VALUES('8','39','','','','','')
INSERT INTO sys_Role_Menu VALUES('8','40','','','','','')
INSERT INTO sys_Role_Menu VALUES('8','41','','','','','')
INSERT INTO sys_Role_Menu VALUES('8','42','','','','','')
INSERT INTO sys_Role_Menu VALUES('8','43','','','','','')

-- 9	Co khi dong luc
INSERT INTO sys_Role_Menu VALUES('9','36','','','','','')
INSERT INTO sys_Role_Menu VALUES('9','37','','','','','')
INSERT INTO sys_Role_Menu VALUES('9','38','','','','','')
INSERT INTO sys_Role_Menu VALUES('9','39','','','','','')
INSERT INTO sys_Role_Menu VALUES('9','40','','','','','')
INSERT INTO sys_Role_Menu VALUES('9','41','','','','','')
INSERT INTO sys_Role_Menu VALUES('9','42','','','','','')
INSERT INTO sys_Role_Menu VALUES('9','43','','','','','')

-- 10	co khi chinh xac
INSERT INTO sys_Role_Menu VALUES('10','36','','','','','')
INSERT INTO sys_Role_Menu VALUES('10','37','','','','','')
INSERT INTO sys_Role_Menu VALUES('10','38','','','','','')
INSERT INTO sys_Role_Menu VALUES('10','39','','','','','')
INSERT INTO sys_Role_Menu VALUES('10','40','','','','','')
INSERT INTO sys_Role_Menu VALUES('10','41','','','','','')
INSERT INTO sys_Role_Menu VALUES('10','42','','','','','')
INSERT INTO sys_Role_Menu VALUES('10','43','','','','','')

-- 11	lai xe
INSERT INTO sys_Role_Menu VALUES('11','36','','','','','')
INSERT INTO sys_Role_Menu VALUES('11','37','','','','','')
INSERT INTO sys_Role_Menu VALUES('11','38','','','','','')
INSERT INTO sys_Role_Menu VALUES('11','39','','','','','')
INSERT INTO sys_Role_Menu VALUES('11','40','','','','','')
INSERT INTO sys_Role_Menu VALUES('11','41','','','','','')
INSERT INTO sys_Role_Menu VALUES('11','42','','','','','')
INSERT INTO sys_Role_Menu VALUES('11','43','','','','','')

-- 12	TT Aptech
INSERT INTO sys_Role_Menu VALUES('12','36','','','','','')
INSERT INTO sys_Role_Menu VALUES('12','37','','','','','')
INSERT INTO sys_Role_Menu VALUES('12','38','','','','','')
INSERT INTO sys_Role_Menu VALUES('12','39','','','','','')
INSERT INTO sys_Role_Menu VALUES('12','40','','','','','')
INSERT INTO sys_Role_Menu VALUES('12','41','','','','','')
INSERT INTO sys_Role_Menu VALUES('12','42','','','','','')
INSERT INTO sys_Role_Menu VALUES('12','43','','','','','')

-- 13	Trung tam co dien tu
INSERT INTO sys_Role_Menu VALUES('13','36','','','','','')
INSERT INTO sys_Role_Menu VALUES('13','37','','','','','')
INSERT INTO sys_Role_Menu VALUES('13','38','','','','','')
INSERT INTO sys_Role_Menu VALUES('13','39','','','','','')
INSERT INTO sys_Role_Menu VALUES('13','40','','','','','')
INSERT INTO sys_Role_Menu VALUES('13','41','','','','','')
INSERT INTO sys_Role_Menu VALUES('13','42','','','','','')
INSERT INTO sys_Role_Menu VALUES('13','43','','','','','')

-- 14	TT Cat May
INSERT INTO sys_Role_Menu VALUES('14','36','','','','','')
INSERT INTO sys_Role_Menu VALUES('14','37','','','','','')
INSERT INTO sys_Role_Menu VALUES('14','38','','','','','')
INSERT INTO sys_Role_Menu VALUES('14','39','','','','','')
INSERT INTO sys_Role_Menu VALUES('14','40','','','','','')
INSERT INTO sys_Role_Menu VALUES('14','41','','','','','')
INSERT INTO sys_Role_Menu VALUES('14','42','','','','','')
INSERT INTO sys_Role_Menu VALUES('14','43','','','','','')

-- 15	ke toan
INSERT INTO sys_Role_Menu VALUES('15','36','','','','','')
INSERT INTO sys_Role_Menu VALUES('15','37','','','','','')
INSERT INTO sys_Role_Menu VALUES('15','38','','','','','')
INSERT INTO sys_Role_Menu VALUES('15','39','','','','','')
INSERT INTO sys_Role_Menu VALUES('15','40','','','','','')
INSERT INTO sys_Role_Menu VALUES('15','41','','','','','')
INSERT INTO sys_Role_Menu VALUES('15','42','','','','','')
INSERT INTO sys_Role_Menu VALUES('15','43','','','','','')

--------
INSERT INTO VaiTro VALUES(N'Người dự tuyển',getdate(),'','','','','')