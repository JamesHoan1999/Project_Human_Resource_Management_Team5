-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.31 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for samsungsds.class2.team5.employeemanagement
CREATE DATABASE IF NOT EXISTS `samsungsds.class2.team5.employeemanagement` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `samsungsds.class2.team5.employeemanagement`;

-- Dumping structure for table samsungsds.class2.team5.employeemanagement.department
CREATE TABLE IF NOT EXISTS `department` (
  `DepartmentID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'ID phòng ban',
  `DepartmentCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Mã phòng ban',
  `DepartmentName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Tên phòng ban',
  `CreatedBy` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Được tạo bởi ai',
  `CreatedDate` datetime DEFAULT NULL COMMENT 'Thời điểm tạo',
  `ModifiedBy` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Được sửa bởi ai',
  `ModifiedDate` datetime DEFAULT NULL COMMENT 'Thời điểm chỉnh sửa',
  `ManageId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Id trưởng phòng',
  PRIMARY KEY (`DepartmentID`),
  UNIQUE KEY `ManageId` (`ManageId`),
  CONSTRAINT `FK_department_ManageId` FOREIGN KEY (`ManageId`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Bảng phòng ban';

-- Dumping data for table samsungsds.class2.team5.employeemanagement.department: ~0 rows (approximately)
INSERT INTO `department` (`DepartmentID`, `DepartmentCode`, `DepartmentName`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `ManageId`) VALUES
	('4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'DC002', 'Phòng lập trình', 'Lưu Tiến Hoan', '2023-03-16 21:35:18', 'Lưu Tiến Hoan', '2023-03-16 21:35:24', '97af18f3-8229-5aa6-a28a-c375fdbfca6c'),
	('5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'DC003', 'Phòng đào tạo', 'Lưu Tiến Hoan', '2023-03-16 21:35:19', 'Lưu Tiến Hoan', '2023-03-16 21:35:23', 'fe27efcf-e4da-4594-9e1a-4f15f5a0ee8c'),
	('62a934fb-b7bf-47e3-b849-1ad0a657cd84', 'DC005', 'Phòng nhân sự', 'Lưu Tiến Hoan', '2023-03-16 21:35:20', 'Lưu Tiến Hoan', '2023-03-16 21:35:22', 'abc219ee-83ac-130b-9733-2fe4edcfe4a3'),
	('bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'DC004', 'Phòng kế toán', 'Lưu Tiến Hoan', '2023-03-16 21:35:19', 'Lưu Tiến Hoan', '2023-03-16 21:35:22', '86a8b8d5-f4bf-339d-a4ef-f171465cc0a1'),
	('bd0757f4-a2ae-4649-b62c-125dbc29d884', 'DC001', 'Phòng kĩ thuật', 'Lưu Tiến Hoan', '2023-03-16 21:35:17', 'Lưu Tiến Hoan', '2023-03-16 21:35:25', '5ecfff4a-5f0b-1ce8-a3bd-f67f5642bffc'),
	('c4d84e79-ca5c-44d4-9b12-cb37344342a5', 'DC006', 'Phòng an ninh', 'Lưu Tiến Hoan', '2023-03-16 21:35:20', 'Lưu Tiến Hoan', '2023-03-16 21:35:21', '460cb7a6-8cc1-1553-b2a3-84644e0f619a');

-- Dumping structure for table samsungsds.class2.team5.employeemanagement.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `EmployeeID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'ID nhân viên',
  `EmployeeCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'MÃ nhân viên',
  `EmployeeName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Tên nhân viên',
  `DepartmentID` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Mã phòng ban ,khóa ngoại đến bảng department',
  `PositionName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Tên vị tí',
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Địa chỉ',
  `DateOfBirth` date DEFAULT NULL COMMENT 'Ngày sinh',
  `Gender` tinyint DEFAULT NULL COMMENT 'Giới tính (0:nam ,1 :nữ ,2: khác)',
  `IdentityNumber` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Số chứng minh nhân dân',
  `IdentityDate` date DEFAULT NULL COMMENT 'Ngày cấp CMND',
  `IdentityPlace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Nơi cấp CMND',
  `TelephoneNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Số đt di động',
  `PhoneNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'số đt cố định',
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Địa chỉ email',
  `BankAccountNumber` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Số tài khoản ngân hàng',
  `BankName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Tên ngân hàng',
  `BankBranchName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Tên chi nhánh',
  `CreatedBy` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Được tạo bởi ai',
  `CreatedDate` datetime DEFAULT NULL COMMENT 'Thời điểm tạo',
  `ModifiedBy` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Được sửa bởi ai',
  `ModifiedDate` datetime DEFAULT NULL COMMENT 'Thời điểm chỉnh sửa',
  `Salary` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `IX_employee_EmployeeCode` (`EmployeeCode`),
  KEY `IX_employee_EmployeeName` (`EmployeeName`),
  KEY `IX_employee_TelephoneNumber` (`TelephoneNumber`),
  KEY `FK_employee_department_DepartmentId` (`DepartmentID`),
  CONSTRAINT `FK_employee_department_DepartmentId` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Bảng thông tin nhân viên';

-- Dumping data for table samsungsds.class2.team5.employeemanagement.employee: ~0 rows (approximately)
INSERT INTO `employee` (`EmployeeID`, `EmployeeCode`, `EmployeeName`, `DepartmentID`, `PositionName`, `Address`, `DateOfBirth`, `Gender`, `IdentityNumber`, `IdentityDate`, `IdentityPlace`, `TelephoneNumber`, `PhoneNumber`, `Email`, `BankAccountNumber`, `BankName`, `BankBranchName`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModifiedDate`, `Salary`) VALUES
	('0199deda-e0a4-33ae-b462-1a6649e87fd2', 'NV00251', 'Nguyễn Hải Tùng', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Bảo vệ', 'Số 360 đường Cầu Giấy', '1998-07-31', 1, '027099734699', '2023-02-21', 'CA Quảng Ninh', '0971970387', '02437696246', 'NV00084@gmail.com', '1903477888344', 'Vietcombank', 'Hoàng Quốc Việt', 'Nguyễn Thanh Lâm', '2023-02-14 05:26:19', 'Lưu Tiến Hoan', '2023-03-14 02:54:25', 13848667.44),
	('03765823-d577-1eef-9a13-e94bc428d6a1', 'NV00746', 'Nguyễn Văn Anh', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Tester', 'Số 32 đường Cầu Giấy', '1994-09-01', 2, '027099424746', '2022-12-21', 'CA Bắc Ninh', '0974666856', '02433437278', 'NV00046@gmail.com', '1903479016690', 'TP Bank', 'Cầu Giấy', 'Lưu Tiến Hoan', '2023-01-24 13:40:07', 'Lưu Tiến Hoan', '2023-03-02 20:37:57', 13599693.70),
	('03e4fc9d-b5ec-2ab6-9f39-3fdeeb3b6556', 'NV00547', 'Lưu Văn Long', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Tester', 'Số 282 đường Cầu Giấy', '1994-02-25', 0, '027099683240', '2020-01-01', 'CA Quảng Ninh', '0978456484', '02436916242', 'NV00601@gmail.com', '1903479012252', 'Vietcombank', 'Hoàng Quốc Việt', 'Nguyễn Thanh Lâm', '2023-02-06 00:46:00', 'Nguyễn Thanh Lâm', '2023-03-16 09:26:25', 12392512.25),
	('0dcbded2-549f-474d-8687-74daac6e3ff4', 'NV00012', 'Nguyễn Tiến Trọng', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Bảo vệ', 'Số 351 đường Láng', '2004-10-26', 1, '027099427128', '2020-01-02', 'CA Quảng Ninh', '0970818487', '02434398663', 'NV00166@gmail.com', '1903470978184', 'Techcombank', 'Bắc Từ Liêm', 'Lưu Tiến Hoan', '2023-01-01 00:00:12', 'Đinh Thế Anh', '2023-03-05 14:29:35', 10680349.57),
	('1223efa3-2dc0-1fbe-b646-fb53b28c04ee', 'NV00046', 'Đinh Anh Huy', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Tester', 'Số 128 đường Hoàng Quốc Việt', '1993-03-15', 0, '027099966680', '2020-09-22', 'CA Hà Nội', '0975942650', '02436378066', 'NV00255@gmail.com', '1903474373917', 'Vietcombank', 'Cầu Giấy', 'Đinh Thế Anh', '2023-01-21 08:14:48', 'Nguyễn Thanh Lâm', '2023-03-10 10:48:22', 13629874.48),
	('142bf2f5-d60b-3fca-b9e2-97b5d78051ce', 'NV00987', 'Lưu Hải Hoan', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Nhân viên Marketing', 'Số 245 đường Hoàng Quốc Việt', '1995-04-26', 1, '027099662623', '2021-02-11', 'CA Vĩnh Phúc', '0979133700', '02438642586', 'NV00742@gmail.com', '1903477001004', 'BIDV', 'Bắc Từ Liêm', 'Nguyễn Thanh Lâm', '2023-01-13 10:52:37', 'Nguyễn Thanh Lâm', '2023-03-02 00:01:09', 13629123.02),
	('19c1b3c9-5dda-270b-a15a-1767dced7b8f', 'NV00807', 'Đinh Văn Tùng', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Lập trình viên', 'Số 26 đường Hoàng Quốc Việt', '2005-12-10', 1, '027099797597', '2022-02-26', 'CA Vĩnh Phúc', '0974773178', '02433390235', 'NV00067@gmail.com', '1903474885839', 'TP Bank', 'Hoàng Quốc Việt', 'Lưu Tiến Hoan', '2023-01-04 09:01:32', 'Đinh Thế Anh', '2023-03-08 06:33:51', 17728157.93),
	('1a7cea84-1ac2-17dd-bdac-f2acfe8f4e3e', 'NV00936', 'Nguyễn Tiến Tùng', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Lập trình viên', 'Số 52 đường Xuân Thủy', '1994-05-31', 1, '027099947423', '2020-10-22', 'CA Bắc Ninh', '0970635449', NULL, 'NV00635@gmail.com', '1903472586829', 'Vietcombank', NULL, 'Đinh Thế Anh', '2023-02-04 10:00:13', NULL, '2023-03-16 21:21:45', 12956190.42),
	('1e2e265a-5fa8-1218-a3b1-de3afeb5dcbd', 'NV00326', 'Đỗ Hải Lâm', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Bảo vệ', 'Số 113 đường Đê La Thành', '2005-07-20', 2, '027099011931', '2020-01-02', 'CA Hà Nội', '0971660081', '02434112039', 'NV00736@gmail.com', '1903473664354', 'Techcombank', 'Bắc Từ Liêm', 'Lưu Tiến Hoan', '2023-01-01 00:15:45', 'Nguyễn Thanh Lâm', '2023-03-02 00:01:24', 17218726.47),
	('1eefca7a-fac7-4b5b-9896-0a4250facdc8', 'NV00637', 'Tạ Tiến Huy', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Tester', 'Số 324 đường Đê La Thành', '2003-04-10', 2, '027099194929', '2023-03-02', 'CA Bắc Ninh', '0976676602', '02436843852', 'NV00624@gmail.com', '1903470587501', 'BIDV', 'Hoàng Quốc Việt', 'Lưu Tiến Hoan', '2023-01-11 10:51:49', 'Lưu Tiến Hoan', '2023-03-02 00:00:06', 10474303.79),
	('211d4b13-83c8-501b-ad0b-0712ffbb42d0', 'NV00496', 'Nguyễn Anh Hoàng', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Tester', 'Số 178 đường Hoàng Quốc Việt', '1998-06-30', 1, '027099772474', '2020-12-29', 'CA Quảng Ninh', '0975554305', '02436775456', 'NV00288@gmail.com', '1903474490111', 'Vietcombank', 'Hai Bà Trưng', 'Lưu Tiến Hoan', '2023-02-22 02:07:43', 'Lưu Tiến Hoan', '2023-03-11 01:37:25', 14146136.14),
	('23fda899-e8a8-3dad-b2ad-aa9ca8136aad', 'NV00843', 'Đỗ Thế An', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Bảo vệ', 'Số 396 đường Đê La Thành', '1996-03-28', 1, '027099580468', '2020-09-21', 'CA Hải Dương', '0978959568', '02435955747', 'NV00920@gmail.com', '1903471710297', 'TP Bank', 'Cầu Giấy', 'Nguyễn Thanh Lâm', '2023-01-01 00:01:02', 'Nguyễn Thanh Lâm', '2023-03-12 12:09:11', 17568916.08),
	('2bbf4b6e-eba8-4b7d-b74f-7f0505e9f0ac', 'NV00570', 'Lưu Thế Mạnh', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Nhân viên ', 'Số 15 đường Cầu Giấy', '1994-06-05', 0, '027099969518', '2021-12-30', 'CA Bắc Ninh', '0979637024', '02432565727', 'NV00418@gmail.com', '1903475342956', 'BIDV', 'Hoàng Quốc Việt', 'Đinh Thế Anh', '2023-02-09 05:18:11', 'Lưu Tiến Hoan', '2023-03-10 13:36:20', 14901034.51),
	('2f325601-7920-1298-b6eb-aff8aef2dd64', 'NV00311', 'Đỗ Tiến Huệ', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Lập trình viên', 'Số 77 đường Xuân Thủy', '2005-10-25', 0, '027099259069', '2020-04-07', 'CA Quảng Ninh', '0975932844', '02438532603', 'NV00591@gmail.com', '1903471875647', 'TP Bank', 'Cầu Giấy', 'Lưu Tiến Hoan', '2023-02-16 23:35:04', 'Đinh Thế Anh', '2023-03-12 09:09:08', 17950214.44),
	('2fc2e50c-3fa2-5664-b30f-42daa7019277', 'NV00538', 'Nguyễn Thanh Dũng', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Bảo vệ', 'Số 124 đường Láng', '1994-01-24', 0, '027099383999', '2022-03-19', 'CA Bắc Ninh', '0978798726', '02430242240', 'NV00987@gmail.com', '1903476042974', 'Techcombank', 'Bắc Từ Liêm', 'Đinh Thế Anh', '2023-01-01 01:19:23', 'Nguyễn Thanh Lâm', '2023-03-06 23:22:46', 15274679.00),
	('306b68a7-2804-4cdd-98cd-e3af962c5b73', 'NV00791', 'Tạ Hải An', '62a934fb-b7bf-47e3-b849-1ad0a657cd84', 'Tester', 'Số 135 đường Đê La Thành', '2002-08-07', 2, '027099139715', '2020-10-30', 'CA Hà Nội', '0977003904', '02436366291', 'NV00094@gmail.com', '1903472879609', 'Techcombank', 'Hoàng Quốc Việt', 'Lưu Tiến Hoan', '2023-02-12 00:06:25', 'Đinh Thế Anh', '2023-03-06 23:43:45', 11111934.22),
	('31ab59b6-971f-2244-bb0a-2d32add03e1f', 'NV00032', 'Nguyễn Anh Hoàng', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Bảo vệ', 'Số 332 đường Láng', '2005-12-01', 0, '027099803145', '2022-01-13', 'CA Hà Nội', '0979914440', '02430188745', 'NV00908@gmail.com', '1903475180527', 'TP Bank', 'Hoàng Quốc Việt', 'Nguyễn Thanh Lâm', '2023-02-19 22:04:19', 'Đinh Thế Anh', '2023-03-14 12:31:30', 13547702.87),
	('3277e1df-65ec-2563-afce-eb02c7bbc0f9', 'NV00499', 'Đinh Tiến Dũng', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Bảo vệ', 'Số 115 đường Hoàng Quốc Việt', '1994-09-29', 2, '027099652481', '2020-03-06', 'CA Bắc Ninh', '0977809021', '02435106121', 'NV00284@gmail.com', '1903471386805', 'Vietcombank', 'Hoàng Quốc Việt', 'Đinh Thế Anh', '2023-01-01 00:00:10', 'Lưu Tiến Hoan', '2023-03-12 00:59:55', 17311009.21),
	('3590ef9b-ae2e-4543-bcc1-7bfdfb435aa8', 'NV00667', 'Tạ Tiến Trọng', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Lập trình viên', 'Số 283 đường Láng', '1994-04-30', 2, '027099992392', '2020-12-27', 'CA Bắc Ninh', '0970944398', '02432030342', 'NV00759@gmail.com', '1903472008752', 'Vietcombank', 'Cầu Giấy', 'Đinh Thế Anh', '2023-01-01 00:00:10', 'Đinh Thế Anh', '2023-03-02 11:52:07', 16199666.17),
	('3cfaf188-f08f-1b23-8f5c-d783c2d7de23', 'NV00340', 'Nguyễn Hải An', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Bảo vệ', 'Số 144 đường Láng', '1993-03-12', 2, '027099512614', '2020-10-10', 'CA Bắc Ninh', '0975215538', '02431331468', 'NV00495@gmail.com', '1903470594054', 'VP Bank', 'Hoàng Quốc Việt', 'Nguyễn Thanh Lâm', '2023-01-03 21:35:33', 'Lưu Tiến Hoan', '2023-03-06 04:11:06', 11476126.77),
	('3f4f24eb-1601-12d3-bbfa-32a0f0b3177e', 'NV00393', 'Đỗ Anh Hoàng', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Lập trình viên', 'Số 284 đường Đê La Thành', '1997-09-02', 2, '027099945678', '2020-02-29', 'CA Hải Dương', '0979869502', '02439456780', 'NV00637@gmail.com', '1903476173622', 'Techcombank', 'Bắc Từ Liêm', 'Nguyễn Thanh Lâm', '2023-01-10 07:31:52', 'Đinh Thế Anh', '2023-03-02 00:08:53', 10544179.22),
	('460cb7a6-8cc1-1553-b2a3-84644e0f619a', 'NV00122', 'Lưu Hải Huệ', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Lập trình viên', 'Số 167 đường Hoàng Quốc Việt', '1995-04-03', 0, '027099269405', '2020-07-09', 'CA Vĩnh Phúc', '0970046847', '02432325206', 'NV00460@gmail.com', '1903479402850', 'Vietcombank', 'Cầu Giấy', 'Nguyễn Thanh Lâm', '2023-01-28 20:25:47', 'Lưu Tiến Hoan', '2023-03-09 09:58:24', 15002310.90),
	('4a823cac-cb16-4ffb-a399-6bc5ccaa0788', 'NV00863', 'Nguyễn Hải Long', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Bảo vệ', 'Số 166 đường Xuân Thủy', '2001-08-24', 0, '027099954577', '2023-02-08', 'CA Hải Dương', '0972239545', '02439145352', 'NV00100@gmail.com', '1903477074669', 'VP Bank', 'Cầu Giấy', 'Nguyễn Thanh Lâm', '2023-01-14 18:00:24', 'Đinh Thế Anh', '2023-03-02 00:00:44', 11138887.37),
	('4ab7da74-ef19-5a2b-93bd-dbb4d0149a0f', 'NV00778', 'Nguyễn Văn Anh', '62a934fb-b7bf-47e3-b849-1ad0a657cd84', 'Nhân viên Sale', 'Số 32 đường Láng', '1994-12-25', 0, '027099121916', '2020-07-19', 'CA Vĩnh Phúc', '0971403703', '02435756634', 'NV00164@gmail.com', '1903472340357', 'TP Bank', 'Bắc Từ Liêm', 'Nguyễn Thanh Lâm', '2023-02-07 02:09:31', 'Đinh Thế Anh', '2023-03-02 00:00:02', 12853767.42),
	('4af3d53e-45bd-4fda-8bd1-4d25b9c0e1ca', 'NV00729', 'Đỗ Thanh Dũng', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Bảo vệ', 'Số 325 đường Láng', '1994-10-29', 0, '027099815572', '2021-06-21', 'CA Hải Dương', '0970044479', '02438155729', 'NV00447@gmail.com', '1903474178565', 'VP Bank', 'Hai Bà Trưng', 'Lưu Tiến Hoan', '2023-01-22 23:24:30', 'Lưu Tiến Hoan', '2023-03-07 12:17:25', 10699807.79),
	('4b5ba386-bb2e-48af-a0b5-0539cf84fb7e', 'NV00703', 'Đỗ Anh Tùng', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Lập trình viên', 'Số 189 đường Láng', '1993-04-03', 1, '027099956942', '2022-05-22', 'CA Hải Dương', '0978261948', '02439545777', 'NV00822@gmail.com', '1903472605535', 'Techcombank', 'Bắc Từ Liêm', 'Nguyễn Thanh Lâm', '2023-01-08 01:25:24', 'Nguyễn Thanh Lâm', '2023-03-12 06:08:37', 14422999.35),
	('4d6aacfc-dfab-2d36-bc3e-c2a166fe57a5', 'NV00066', 'Tạ Thanh Huy', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Lập trình viên', 'Số 216 đường Cầu Giấy', '1995-10-18', 2, '027099932578', '2021-01-13', 'CA Bắc Ninh', '0972629953', NULL, 'NV00249@gmail.com', '1903479797650', 'BIDV', NULL, 'Nguyễn Thanh Lâm', '2023-01-14 16:18:52', NULL, '2023-03-16 21:21:40', 10575565.69),
	('4f8855bf-fbe2-41ff-bee2-60bdb684e1ef', 'NV00070', 'Đỗ Tiến Huy', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Lập trình viên', 'Số 332 đường Cầu Giấy', '1993-10-20', 1, '027099509328', '2021-07-06', 'CA Hà Nội', '0975121634', '02435028742', 'NV00689@gmail.com', '1903479468089', 'Techcombank', 'Hoàng Quốc Việt', 'Lưu Tiến Hoan', '2023-02-08 22:40:42', 'Đinh Thế Anh', '2023-03-04 10:25:19', 16179536.51),
	('4faa3c19-2b49-3494-acb9-adcba39a9a0e', 'NV00523', 'Lưu Văn Long', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Nhân viên Sale', 'Số 129 đường Xuân Thủy', '1996-10-09', 1, '027099267192', '2023-01-09', 'CA Bắc Ninh', '0973023205', '02438804741', 'NV00081@gmail.com', '1903472594866', 'VP Bank', 'Hoàng Quốc Việt', 'Đinh Thế Anh', '2023-01-06 03:19:37', 'Nguyễn Thanh Lâm', '2023-03-02 00:06:47', 13385237.26),
	('53ce7bbb-cdbc-59a0-947d-efd3dc46bec3', 'NV00544', 'Đỗ Anh Trọng', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Bảo vệ', 'Số 137 đường Đê La Thành', '2004-07-29', 0, '027099362363', '2020-02-22', 'CA Quảng Ninh', '0970979774', NULL, 'NV00539@gmail.com', '1903478419543', 'Techcombank', NULL, 'Nguyễn Thanh Lâm', '2023-02-18 07:06:32', NULL, '2023-03-16 21:21:42', 10259369.75),
	('57a9bbea-6ec9-404a-baf4-bd9e7ff9fbbb', 'NV00558', 'Tạ Tiến Huệ', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Nhân viên Truyền thông', 'Số 249 đường Láng', '2003-03-28', 0, '027099174376', '2021-01-05', 'CA Hải Dương', '0976131116', '02438407654', 'NV00822@gmail.com', '1903470178192', 'BIDV', 'Hoàng Quốc Việt', 'Đinh Thế Anh', '2023-02-07 07:30:21', 'Lưu Tiến Hoan', '2023-03-16 12:52:35', 10056184.58),
	('5afab115-8523-5cec-8d42-d1f4502a1df2', 'NV00342', 'Lưu Văn Long', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Bảo vệ', 'Số 274 đường Xuân Thủy', '1993-04-01', 0, '027099423552', '2023-01-14', 'CA Hải Dương', '0975010413', '02430529994', 'NV00973@gmail.com', '1903478002749', 'Vietcombank', 'Cầu Giấy', 'Nguyễn Thanh Lâm', '2023-01-13 06:48:37', 'Lưu Tiến Hoan', '2023-03-03 23:48:22', 13880321.33),
	('5b941e81-ce1f-2d3c-8ce8-daac72b6bbd5', 'NV00882', 'Đỗ Anh Anh', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Lập trình viên', 'Số 314 đường Đê La Thành', '1993-05-18', 0, '027099377417', '2022-01-05', 'CA Bắc Ninh', '0974931243', '02431548119', 'NV00021@gmail.com', '1903479570892', 'VP Bank', 'Cầu Giấy', 'Lưu Tiến Hoan', '2023-02-15 13:27:54', 'Đinh Thế Anh', '2023-03-14 08:21:52', 10065833.67),
	('5dda2f3c-b64d-577f-aa48-4e433c4bd1cf', 'NV00881', 'Lưu Anh Huệ', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Bảo vệ', 'Số 34 đường Đê La Thành', '1993-03-07', 1, '027099627239', '2020-01-09', 'CA Quảng Ninh', '0971256400', NULL, 'NV00727@gmail.com', '1903476571724', 'Techcombank', NULL, 'Đinh Thế Anh', '2023-01-18 21:20:39', NULL, '2023-03-16 21:21:38', 10584687.24),
	('5ecfff4a-5f0b-1ce8-a3bd-f67f5642bffc', 'NV00008', 'Đỗ Anh Tùng', 'bd0757f4-a2ae-4649-b62c-125dbc29d884', 'Nhân viên Sale', 'Số 302 đường Cầu Giấy', '1997-08-03', 0, '027099842943', '2022-05-09', 'CA Hải Dương', '0972522040', '02431396522', 'NV00194@gmail.com', '1903470382895', 'BIDV', 'Cầu Giấy', 'Lưu Tiến Hoan', '2023-02-27 21:42:16', 'Nguyễn Thanh Lâm', '2023-03-03 12:50:28', 12586510.42),
	('5ef08abb-df3c-240f-b7fe-d6bff03bcd11', 'NV00083', 'Lưu Thế Huệ', 'bd0757f4-a2ae-4649-b62c-125dbc29d884', 'Bảo vệ', 'Số 131 đường Xuân Thủy', '1997-09-04', 0, '027099913473', '2020-04-17', 'CA Hải Dương', '0974140164', '02434239600', 'NV00808@gmail.com', '1903470975498', 'Vietcombank', 'Hai Bà Trưng', 'Đinh Thế Anh', '2023-01-01 01:00:32', 'Lưu Tiến Hoan', '2023-03-02 00:08:32', 12819830.35),
	('68d48dda-6caf-48f5-aa45-67ed4ad90aef', 'NV00252', 'Đỗ Tiến Hoan', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Bảo vệ', 'Số 218 đường Đê La Thành', '1995-01-07', 0, '027099046828', '2021-04-27', 'CA Quảng Ninh', '0970660582', '02433079605', 'NV00252@gmail.com', '1903474965714', 'BIDV', 'Hai Bà Trưng', 'Lưu Tiến Hoan', '2023-01-01 00:50:37', 'Lưu Tiến Hoan', '2023-03-07 03:29:58', 13913638.61),
	('6db5af58-92a9-2ee9-aafa-eadee108eeaa', 'NV00184', 'Đỗ Thế Mạnh', 'bd0757f4-a2ae-4649-b62c-125dbc29d884', 'Nhân viên Sale', 'Số 246 đường Láng', '1993-01-18', 0, '027099407621', '2020-03-22', 'CA Hà Nội', '0977476287', NULL, 'NV00245@gmail.com', '1903471918088', 'TP Bank', NULL, 'Nguyễn Thanh Lâm', '2023-01-01 00:00:18', NULL, '2023-03-16 21:21:39', 15187258.11),
	('6ecf855e-7884-132d-bd4f-fa8f5e8aebba', 'NV00819', 'Lưu Thế Huy', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Tester', 'Số 191 đường Cầu Giấy', '1993-01-17', 1, '027099229562', '2020-10-17', 'CA Quảng Ninh', '0977095194', '02430227623', 'NV00427@gmail.com', '1903477496121', 'Vietcombank', 'Cầu Giấy', 'Đinh Thế Anh', '2023-02-28 16:07:43', 'Lưu Tiến Hoan', '2023-03-02 02:04:26', 17596428.52),
	('707e2e8a-d43d-457e-bbe3-c0c96b9db3f3', 'NV00803', 'Tạ Anh Anh', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Nhân viên Sale', 'Số 60 đường Xuân Thủy', '2005-12-29', 0, '027099614367', '2021-02-01', 'CA Hà Nội', '0977220622', '02436031201', 'NV00206@gmail.com', '1903470707679', 'TP Bank', 'Cầu Giấy', 'Đinh Thế Anh', '2023-02-11 11:54:23', 'Đinh Thế Anh', '2023-03-04 06:08:39', 16941671.04),
	('72456a50-018e-5a45-bf10-98ad9229fbb0', 'NV00686', 'Lưu Thanh Mạnh', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Tester', 'Số 50 đường Hoàng Quốc Việt', '1994-11-09', 0, '027099296902', '2021-11-08', 'CA Bắc Ninh', '0975574446', '02436206226', 'NV00838@gmail.com', '1903473171322', 'Techcombank', 'Hoàng Quốc Việt', 'Nguyễn Thanh Lâm', '2023-01-19 19:48:48', 'Lưu Tiến Hoan', '2023-03-16 16:51:29', 15133525.90),
	('724bd055-09f4-315d-90ea-66de63cac9a7', 'NV00453', 'Nguyễn Văn An', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Bảo vệ', 'Số 228 đường Láng', '1995-12-05', 2, '027099981581', '2020-01-11', 'CA Hà Nội', '0977590113', '02438036540', 'NV00446@gmail.com', '1903477828561', 'VP Bank', 'Cầu Giấy', 'Lưu Tiến Hoan', '2023-02-26 09:37:57', 'Đinh Thế Anh', '2023-03-13 23:18:15', 14894025.24),
	('73e1ff06-737d-4e61-a46c-b973d7894109', 'NV00718', 'Đỗ Thanh Tùng', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Nhân viên Truyền thông', 'Số 353 đường Hoàng Quốc Việt', '1993-01-02', 0, '027099730026', '2021-05-29', 'CA Quảng Ninh', '0970795429', '02438454256', 'NV00052@gmail.com', '1903475982148', 'BIDV', 'Bắc Từ Liêm', 'Đinh Thế Anh', '2023-01-07 16:47:19', 'Nguyễn Thanh Lâm', '2023-03-04 14:55:03', 12790160.27),
	('7eb0c94d-67cc-198b-bef7-bbef3c2b1ab3', 'NV00425', 'Nguyễn Anh Lâm', 'bd0757f4-a2ae-4649-b62c-125dbc29d884', 'Tester', 'Số 310 đường Cầu Giấy', '1999-02-17', 0, '027099710590', '2021-01-15', 'CA Vĩnh Phúc', '0972186357', '02430729229', 'NV00220@gmail.com', '1903473796136', 'Techcombank', 'Bắc Từ Liêm', 'Lưu Tiến Hoan', '2023-01-01 02:51:44', 'Nguyễn Thanh Lâm', '2023-03-13 17:53:19', 14423564.28),
	('82d6a758-bf4c-1ca4-98ae-aed959ca9668', 'NV00478', 'Nguyễn Văn Huy', 'bd0757f4-a2ae-4649-b62c-125dbc29d884', 'Bảo vệ', 'Số 375 đường Xuân Thủy', '1993-01-02', 1, '027099661712', '2020-03-15', 'CA Bắc Ninh', '0973352495', '02432736850', 'NV00659@gmail.com', '1903471931837', 'BIDV', 'Bắc Từ Liêm', 'Đinh Thế Anh', '2023-01-01 00:01:29', 'Đinh Thế Anh', '2023-03-11 00:46:04', 10692739.38),
	('836e683f-550c-45b8-82da-89f5e5ef72a3', 'NV00619', 'Đỗ Anh Long', 'bd0757f4-a2ae-4649-b62c-125dbc29d884', 'Tester', 'Số 136 đường Xuân Thủy', '2005-08-08', 0, '027099893581', '2021-05-28', 'CA Hải Dương', '0978300635', '02434358004', 'NV00215@gmail.com', '1903471717381', 'BIDV', 'Cầu Giấy', 'Nguyễn Thanh Lâm', '2023-01-01 00:14:57', 'Nguyễn Thanh Lâm', '2023-03-02 00:09:09', 14742070.61),
	('861355b5-258c-2ce0-a4e7-ead87b198ade', 'NV00078', 'Đỗ Hải Hoàng', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Bảo vệ', 'Số 265 đường Hoàng Quốc Việt', '1993-01-02', 0, '027099720572', '2021-04-10', 'CA Quảng Ninh', '0977733854', '02432625925', 'NV00208@gmail.com', '1903479369856', 'Vietcombank', 'Bắc Từ Liêm', 'Nguyễn Thanh Lâm', '2023-02-02 15:47:00', 'Nguyễn Thanh Lâm', '2023-03-09 23:55:08', 10715361.51),
	('86a8b8d5-f4bf-339d-a4ef-f171465cc0a1', 'NV00089', 'Tạ Anh Hoan', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Bảo vệ', 'Số 206 đường Xuân Thủy', '2003-11-04', 0, '027099630123', '2022-12-20', 'CA Quảng Ninh', '0976922631', '02433803966', 'NV00340@gmail.com', '1903475474842', 'Vietcombank', 'Cầu Giấy', 'Đinh Thế Anh', '2023-02-13 17:06:17', 'Lưu Tiến Hoan', '2023-03-14 14:01:45', 13530963.42),
	('92064680-6177-4cb8-967e-cdf846e5bea5', 'NV00456', 'Tạ Thế Hùng', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Tester', 'Số 118 đường Xuân Thủy', '2005-02-13', 1, '027099431156', '2020-02-16', 'CA Quảng Ninh', '0974212765', NULL, 'NV00420@gmail.com', '1903472541320', 'VP Bank', NULL, 'Lưu Tiến Hoan', '2023-01-30 08:45:07', NULL, NULL, 14986567.42),
	('9445409f-fb00-3133-afd8-b06feffc6c2f', 'NV00355', 'Tạ Văn Lâm', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Nhân viên Sale', 'Số 302 đường Xuân Thủy', '1996-01-29', 1, '027099983000', '2020-03-20', 'CA Hải Dương', '0973265664', '02435222707', 'NV00241@gmail.com', '1903471866494', 'VP Bank', 'Hoàng Quốc Việt', 'Lưu Tiến Hoan', '2023-01-17 00:51:25', 'Nguyễn Thanh Lâm', '2023-03-09 11:01:34', 14768149.43),
	('96d2265f-8d36-3966-a3a9-d1c9cf5ba09e', 'NV00148', 'Nguyễn Anh Hoan', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Bảo vệ', 'Số 380 đường Cầu Giấy', '1995-01-30', 1, '027099469685', '2022-09-08', 'CA Vĩnh Phúc', '0978524323', '02430669685', 'NV00151@gmail.com', '1903471856726', 'Techcombank', 'Bắc Từ Liêm', 'Đinh Thế Anh', '2023-01-29 13:19:05', 'Nguyễn Thanh Lâm', '2023-03-08 16:32:11', 14307405.53),
	('97af18f3-8229-5aa6-a28a-c375fdbfca6c', 'NV00037', 'Lưu Tiến Mạnh', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Tester', 'Số 115 đường Láng', '2003-09-26', 0, '027099551922', '2020-12-04', 'CA Vĩnh Phúc', '0977794960', '02431208162', 'NV00264@gmail.com', '1903473882996', 'Techcombank', 'Cầu Giấy', 'Đinh Thế Anh', '2023-01-19 13:46:53', 'Đinh Thế Anh', '2023-03-06 02:29:01', 13276721.77),
	('9bdba755-55d8-55f6-8f59-10ff551bcf52', 'NV00561', 'Đinh Hải Huy', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Nhân viên Sale', 'Số 141 đường Láng', '2003-09-01', 0, '027099853986', '2021-10-04', 'CA Vĩnh Phúc', '0971212368', '02433080861', 'NV00945@gmail.com', '1903475625489', 'BIDV', 'Cầu Giấy', 'Nguyễn Thanh Lâm', '2023-01-01 12:31:02', 'Đinh Thế Anh', '2023-03-16 05:53:13', 13920871.62),
	('9fb21444-b2ab-1a7d-a603-d23eef0ca9e2', 'NV00180', 'Đinh Thế Dũng', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Nhân viên Truyền thông', 'Số 328 đường Đê La Thành', '1994-08-14', 0, '027099635930', '2021-05-27', 'CA Quảng Ninh', '0973950814', '02430548505', 'NV00866@gmail.com', '1903474771531', 'TP Bank', 'Hai Bà Trưng', 'Lưu Tiến Hoan', '2023-01-26 11:02:59', 'Đinh Thế Anh', '2023-03-16 13:04:03', 11374606.25),
	('9fceefd8-59d7-3ecd-a935-5fcbffd8656f', 'NV00979', 'Đỗ Thế An', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Nhân viên Sale', 'Số 234 đường Đê La Thành', '1995-06-08', 0, '027099057480', '2022-09-18', 'CA Bắc Ninh', '0974477542', '02434403344', 'NV00754@gmail.com', '1903471024028', 'BIDV', 'Cầu Giấy', 'Đinh Thế Anh', '2023-01-01 00:27:32', 'Lưu Tiến Hoan', '2023-03-05 16:03:34', 14773601.45),
	('a1513586-3d7d-4dea-8aab-ca7eb4bccc0f', 'NV00042', 'Đỗ Anh Hoan', 'bd0757f4-a2ae-4649-b62c-125dbc29d884', 'Lập trình viên', 'Số 348 đường Láng', '1993-01-08', 2, '027099566620', '2021-01-06', 'CA Quảng Ninh', '0975649649', NULL, 'NV00215@gmail.com', '1903474499041', 'Vietcombank', NULL, 'Lưu Tiến Hoan', '2023-01-01 00:00:08', NULL, NULL, 17670691.65),
	('a43e898d-ba65-3a8c-a4b1-03c700b5b1b7', 'NV00595', 'Đỗ Anh An', 'bd0757f4-a2ae-4649-b62c-125dbc29d884', 'Bảo vệ', 'Số 300 đường Xuân Thủy', '1997-04-01', 0, '027099925881', '2022-07-06', 'CA Vĩnh Phúc', '0977634541', '02435896542', 'NV00663@gmail.com', '1903475678206', 'TP Bank', 'Hai Bà Trưng', 'Nguyễn Thanh Lâm', '2023-01-03 19:40:28', 'Đinh Thế Anh', '2023-03-05 16:04:48', 12310041.42),
	('a558a0b4-9195-5bf6-afad-d7e1c4f16696', 'NV00993', 'Nguyễn Hải Huy', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Bảo vệ', 'Số 84 đường Láng', '1997-03-06', 2, '027099748149', '2023-02-21', 'CA Bắc Ninh', '0970025782', '02433181233', 'NV00072@gmail.com', '1903472645154', 'Vietcombank', 'Bắc Từ Liêm', 'Nguyễn Thanh Lâm', '2023-02-10 00:47:57', 'Lưu Tiến Hoan', '2023-03-02 13:18:34', 14348388.52),
	('a6d8e49f-3cc4-5bbe-be3b-a8ed40ec53bb', 'NV00152', 'Lưu Tiến Mạnh', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Lập trình viên', 'Số 27 đường Cầu Giấy', '2002-01-07', 2, '027099397292', '2023-02-03', 'CA Vĩnh Phúc', '0972864537', '02435194486', 'NV00979@gmail.com', '1903470670346', 'TP Bank', 'Hai Bà Trưng', 'Lưu Tiến Hoan', '2023-01-01 05:39:13', 'Đinh Thế Anh', '2023-03-02 00:04:54', 13056110.74),
	('a9a981a1-d41c-4fa9-a3cc-10bfdb6be2ba', 'NV00392', 'Tạ Hải Hoan', 'c4d84e79-ca5c-44d4-9b12-cb37344342a5', 'Tester', 'Số 373 đường Đê La Thành', '1997-03-21', 2, '027099609321', '2022-09-04', 'CA Quảng Ninh', '0972645695', '02433694896', 'NV00264@gmail.com', '1903471503900', 'Vietcombank', 'Hoàng Quốc Việt', 'Lưu Tiến Hoan', '2023-01-12 20:44:30', 'Nguyễn Thanh Lâm', '2023-03-05 07:40:52', 14419483.44),
	('aaae2f0d-bcf8-453e-95a7-293550cf29fe', 'NV00176', 'Đinh Hải Trọng', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Tester', 'Số 280 đường Láng', '1999-01-17', 1, '027099232677', '2020-01-20', 'CA Vĩnh Phúc', '0974059108', '02433712782', 'NV00660@gmail.com', '1903474873108', 'TP Bank', 'Hai Bà Trưng', 'Đinh Thế Anh', '2023-01-01 00:14:28', 'Lưu Tiến Hoan', '2023-03-07 05:46:52', 17598206.49),
	('aada5cff-b41f-2557-91f5-ecffc2e13c0d', 'NV00451', 'Đinh Văn Dũng', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Nhân viên Marketing', 'Số 344 đường Xuân Thủy', '1993-01-06', 2, '027099742136', '2020-01-02', 'CA Hải Dương', '0974720449', '02439768429', 'NV00041@gmail.com', '1903473057538', 'Vietcombank', 'Hoàng Quốc Việt', 'Đinh Thế Anh', '2023-01-30 11:08:27', 'Nguyễn Thanh Lâm', '2023-03-02 02:37:34', 10956590.39),
	('abc219ee-83ac-130b-9733-2fe4edcfe4a3', 'NV00077', 'Lưu Hải Anh', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Nhân viên ', 'Số 118 đường Xuân Thủy', '1993-01-04', 0, '027099656543', '2021-03-09', 'CA Hải Dương', '0974999494', '02438919605', 'NV00532@gmail.com', '1903477256821', 'TP Bank', 'Cầu Giấy', 'Đinh Thế Anh', '2023-02-26 12:18:37', 'Lưu Tiến Hoan', '2023-03-11 07:01:02', 11220111.14),
	('ad09ba3a-0a6f-450e-9187-3453c62adbaf', 'NV00359', 'Lưu Văn An', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Nhân viên ', 'Số 296 đường Đê La Thành', '2004-12-08', 0, '027099260430', '2021-05-15', 'CA Hải Dương', '0975971765', '02430348260', 'NV00898@gmail.com', '1903474794273', 'VP Bank', 'Cầu Giấy', 'Nguyễn Thanh Lâm', '2023-01-01 00:00:12', 'Đinh Thế Anh', '2023-03-02 00:00:04', 10268804.35),
	('adc2be7d-2ec9-3ebe-a04b-cfee85a64d8f', 'NV00952', 'Nguyễn Thanh Hùng', '62a934fb-b7bf-47e3-b849-1ad0a657cd84', 'Lập trình viên', 'Số 149 đường Cầu Giấy', '1993-12-26', 1, '027099199592', '2021-04-17', 'CA Vĩnh Phúc', '0970757357', '02436236341', 'NV00550@gmail.com', '1903472548602', 'Techcombank', 'Hoàng Quốc Việt', 'Lưu Tiến Hoan', '2023-02-22 13:32:27', 'Nguyễn Thanh Lâm', '2023-03-04 22:51:39', 10920702.84),
	('b2fbdff2-e38e-54d7-8d8c-b9a60c3d5a2c', 'NV00346', 'Nguyễn Anh Hùng', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Tester', 'Số 167 đường Đê La Thành', '1993-01-02', 2, '027099084316', '2020-04-26', 'CA Quảng Ninh', '0970101172', NULL, 'NV00077@gmail.com', '1903473419098', 'Techcombank', NULL, 'Nguyễn Thanh Lâm', '2023-01-01 00:00:02', NULL, NULL, 16590752.07),
	('b3818c33-e3eb-3e42-b44f-eec8bb8cdb2c', 'NV00125', 'Nguyễn Thế An', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Tester', 'Số 63 đường Xuân Thủy', '1993-01-20', 1, '027099547499', '2022-05-07', 'CA Bắc Ninh', '0970638861', '02435783827', 'NV00035@gmail.com', '1903471707705', 'Vietcombank', 'Bắc Từ Liêm', 'Đinh Thế Anh', '2023-01-13 04:53:03', 'Lưu Tiến Hoan', '2023-03-15 03:32:22', 13831187.96),
	('b6e037cd-18aa-45b1-953a-a3a4c3c2cf4d', 'NV00303', 'Đỗ Thanh Mạnh', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Lập trình viên', 'Số 120 đường Xuân Thủy', '1998-08-19', 1, '027099164071', '2022-06-30', 'CA Quảng Ninh', '0976155974', '02432870829', 'NV00321@gmail.com', '1903479608689', 'TP Bank', 'Cầu Giấy', 'Nguyễn Thanh Lâm', '2023-02-21 09:36:11', 'Nguyễn Thanh Lâm', '2023-03-07 07:05:26', 14331103.54),
	('b899aefc-2d85-145d-988d-0db422e0d016', 'NV00420', 'Lưu Hải Lâm', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Bảo vệ', 'Số 326 đường Cầu Giấy', '1994-06-02', 2, '027099496834', '2020-04-21', 'CA Bắc Ninh', '0975813398', '02433308129', 'NV00476@gmail.com', '1903479788140', 'Vietcombank', 'Cầu Giấy', 'Đinh Thế Anh', '2023-01-31 20:05:55', 'Đinh Thế Anh', '2023-03-14 11:56:25', 13688162.45),
	('b9e81aaa-4a91-5658-9d6a-9be4b6f0c90d', 'NV00313', 'Nguyễn Hải Trọng', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Lập trình viên', 'Số 130 đường Láng', '2001-11-09', 1, '027099372220', '2021-01-08', 'CA Hải Dương', '0978699764', '02435501672', 'NV00926@gmail.com', '1903478500001', 'BIDV', 'Cầu Giấy', 'Đinh Thế Anh', '2023-01-16 23:20:58', 'Lưu Tiến Hoan', '2023-03-04 18:59:39', 16187359.66),
	('bb97877b-2657-100a-880b-e4b240ced8ae', 'NV00419', 'Đỗ Văn Long', 'bd0757f4-a2ae-4649-b62c-125dbc29d884', 'Bảo vệ', 'Số 103 đường Láng', '1995-08-05', 2, '027099358180', '2022-02-01', 'CA Bắc Ninh', '0973238311', '02436024275', 'NV00552@gmail.com', '1903472670974', 'BIDV', 'Hoàng Quốc Việt', 'Đinh Thế Anh', '2023-02-12 03:50:47', 'Nguyễn Thanh Lâm', '2023-03-02 02:03:38', 13884552.00),
	('bfb2268d-7b0b-29d3-8abc-0192dad1beca', 'NV00941', 'Đinh Văn Hoàng', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Lập trình viên', 'Số 57 đường Láng', '2004-01-17', 1, '027099846547', '2021-09-28', 'CA Vĩnh Phúc', '0971417998', NULL, 'NV00768@gmail.com', '1903478631725', 'VP Bank', NULL, 'Nguyễn Thanh Lâm', '2023-01-25 07:13:11', NULL, NULL, 13013686.31),
	('c07f87de-e339-19ed-a6ba-9c63bb293ef4', 'NV00494', 'Nguyễn Tiến Huy', 'c4d84e79-ca5c-44d4-9b12-cb37344342a5', 'Nhân viên Marketing', 'Số 73 đường Đê La Thành', '2001-04-10', 2, '027099022862', '2023-03-07', 'CA Vĩnh Phúc', '0977569227', '02435236092', 'NV00200@gmail.com', '1903475557673', 'Techcombank', 'Cầu Giấy', 'Đinh Thế Anh', '2023-02-27 18:54:06', 'Đinh Thế Anh', '2023-03-16 09:39:30', 12024455.71),
	('c1c0a19e-1fdb-4674-ab94-dda16b9ef752', 'NV00768', 'Đinh Thanh Hoàng', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Lập trình viên', 'Số 302 đường Hoàng Quốc Việt', '1993-06-15', 0, '027099125587', '2021-09-23', 'CA Bắc Ninh', '0974710648', '02435903039', 'NV00457@gmail.com', '1903470308488', 'BIDV', 'Bắc Từ Liêm', 'Lưu Tiến Hoan', '2023-02-03 09:37:19', 'Đinh Thế Anh', '2023-03-02 01:37:34', 10245297.22),
	('c1f0db52-3ec5-308a-9660-cd89bceb01ea', 'NV00588', 'Nguyễn Văn Long', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Bảo vệ', 'Số 169 đường Cầu Giấy', '1993-01-09', 2, '027099823205', '2020-01-04', 'CA Bắc Ninh', '0974005164', '02439165248', 'NV00726@gmail.com', '1903471401798', 'BIDV', 'Bắc Từ Liêm', 'Nguyễn Thanh Lâm', '2023-01-10 17:07:46', 'Đinh Thế Anh', '2023-03-02 00:00:45', 17645785.55),
	('c9adcc22-459e-1089-b67a-a09a4a18ec23', 'NV00954', 'Nguyễn Thế Huệ', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Lập trình viên', 'Số 367 đường Láng', '1998-10-25', 1, '027099861276', '2021-01-01', 'CA Vĩnh Phúc', '0970957931', '02438209125', 'NV00266@gmail.com', '1903479721234', 'TP Bank', 'Hoàng Quốc Việt', 'Đinh Thế Anh', '2023-02-14 01:39:42', 'Nguyễn Thanh Lâm', '2023-03-02 00:35:58', 17237789.96),
	('ca5b39bd-5aea-500e-a943-dc8febd35a14', 'NV00507', 'Đỗ Anh Hoan', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Lập trình viên', 'Số 329 đường Hoàng Quốc Việt', '1996-05-20', 0, '027099708733', '2022-02-10', 'CA Vĩnh Phúc', '0978695881', '02439319021', 'NV00775@gmail.com', '1903477661979', 'VP Bank', 'Hai Bà Trưng', 'Lưu Tiến Hoan', '2023-01-16 21:50:19', 'Nguyễn Thanh Lâm', '2023-03-06 11:11:16', 15170918.64),
	('ca6a5cc6-03ac-533a-b1bb-8a955c60c0f7', 'NV00440', 'Tạ Anh Anh', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Tester', 'Số 209 đường Hoàng Quốc Việt', '1994-08-15', 0, '027099064128', '2020-03-31', 'CA Vĩnh Phúc', '0979265788', '02430167895', 'NV00729@gmail.com', '1903471636388', 'BIDV', 'Hai Bà Trưng', 'Lưu Tiến Hoan', '2023-01-21 13:19:13', 'Đinh Thế Anh', '2023-03-02 00:00:03', 16061648.10),
	('cf356e9c-f0d8-26a1-ae87-8736eedec198', 'NV00943', 'Tạ Thanh Hoàng', '62a934fb-b7bf-47e3-b849-1ad0a657cd84', 'Tester', 'Số 119 đường Đê La Thành', '1997-01-06', 2, '027099878028', '2021-01-26', 'CA Bắc Ninh', '0979938086', '02433473398', 'NV00464@gmail.com', '1903471868026', 'BIDV', 'Bắc Từ Liêm', 'Lưu Tiến Hoan', '2023-01-07 10:43:28', 'Nguyễn Thanh Lâm', '2023-03-02 02:05:18', 16519562.04),
	('d27b1920-8edc-22bc-b8da-09196cf2bb48', 'NV00164', 'Nguyễn Hải Hoan', 'bd0757f4-a2ae-4649-b62c-125dbc29d884', 'Nhân viên ', 'Số 112 đường Hoàng Quốc Việt', '1993-08-01', 2, '027099001081', '2020-11-18', 'CA Bắc Ninh', '0971018391', '02432659265', 'NV00047@gmail.com', '1903477882677', 'TP Bank', 'Hai Bà Trưng', 'Đinh Thế Anh', '2023-01-21 03:42:42', 'Nguyễn Thanh Lâm', '2023-03-02 00:15:57', 13839399.26),
	('d2d3fdb6-4a1a-11ce-867e-cbf0db45e93d', 'NV00465', 'Đỗ Văn Huy', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Nhân viên Sale', 'Số 221 đường Láng', '2003-05-27', 2, '027099290976', '2021-05-03', 'CA Bắc Ninh', '0973624963', '02433189673', 'NV00032@gmail.com', '1903475876963', 'BIDV', 'Hai Bà Trưng', 'Đinh Thế Anh', '2023-01-16 20:06:41', 'Lưu Tiến Hoan', '2023-03-16 14:28:19', 14792007.13),
	('d3ce3db3-fe9a-3351-bce6-b4e2c09c7ed0', 'NV00059', 'Đinh Văn Long', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Tester', 'Số 253 đường Xuân Thủy', '2003-09-02', 2, '027099695997', '2020-10-17', 'CA Hải Dương', '0977036592', '02436751218', 'NV00932@gmail.com', '1903479263412', 'TP Bank', 'Hai Bà Trưng', 'Đinh Thế Anh', '2023-01-01 00:00:07', 'Đinh Thế Anh', '2023-03-10 22:39:35', 17459601.95),
	('d4e38293-5fa0-4b0b-be7d-f29e9ceeb0f8', 'NV00117', 'Tạ Anh Hoan', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Lập trình viên', 'Số 39 đường Hoàng Quốc Việt', '1999-05-03', 0, '027099061212', '2022-09-03', 'CA Bắc Ninh', '0974581219', '02430855043', 'NV00796@gmail.com', '1903476737231', 'TP Bank', 'Hoàng Quốc Việt', 'Đinh Thế Anh', '2023-01-26 09:30:29', 'Lưu Tiến Hoan', '2023-03-15 11:25:18', 12109525.29),
	('d7cb4192-f87c-2dbd-ac05-8dafa28b09fc', 'NV00800', 'Đinh Tiến An', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Nhân viên Truyền thông', 'Số 10 đường Láng', '2003-03-22', 2, '027099743731', '2022-07-04', 'CA Vĩnh Phúc', '0973682712', NULL, 'NV00455@gmail.com', '1903471686957', 'Vietcombank', NULL, 'Lưu Tiến Hoan', '2023-02-06 00:59:55', NULL, NULL, 17476743.12),
	('d8ce3664-91d4-15aa-a24b-ccce0fb323d2', 'NV00265', 'Đỗ Hải Anh', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Tester', 'Số 275 đường Hoàng Quốc Việt', '2000-06-20', 1, '027099097133', '2022-11-24', 'CA Bắc Ninh', '0979406195', '02438023210', 'NV00466@gmail.com', '1903471002562', 'Vietcombank', 'Cầu Giấy', 'Đinh Thế Anh', '2023-02-20 00:48:33', 'Đinh Thế Anh', '2023-03-13 14:59:48', 13400525.00),
	('de862d3a-41aa-121e-bead-af683470c951', 'NV00513', 'Lưu Hải Lâm', '4dac2855-0b22-48f2-a225-4a862cfd2bf8', 'Tester', 'Số 392 đường Cầu Giấy', '1994-07-01', 0, '027099359145', '2021-07-28', 'CA Vĩnh Phúc', '0977507366', '02430700444', 'NV00930@gmail.com', '1903476228508', 'TP Bank', 'Cầu Giấy', 'Đinh Thế Anh', '2023-01-01 00:00:47', 'Đinh Thế Anh', '2023-03-03 00:04:28', 13564472.91),
	('df55a7cf-f425-320f-8bb7-9611b08dcdbe', 'NV00206', 'Lưu Hải Mạnh', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Tester', 'Số 334 đường Cầu Giấy', '1995-04-16', 1, '027099530474', '2022-04-15', 'CA Vĩnh Phúc', '0975532921', '02436775488', 'NV00060@gmail.com', '1903471650692', 'BIDV', 'Cầu Giấy', 'Lưu Tiến Hoan', '2023-01-01 03:03:45', 'Nguyễn Thanh Lâm', '2023-03-15 20:22:11', 16804948.52),
	('e25a7ab2-4c23-48a9-9cf3-3a1a9859b6f5', 'NV00877', 'Lưu Hải Mạnh', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Lập trình viên', 'Số 312 đường Cầu Giấy', '2003-06-24', 2, '027099041629', '2023-02-15', 'CA Vĩnh Phúc', '0976217585', '02433217585', 'NV00882@gmail.com', '1903479030557', 'BIDV', 'Hai Bà Trưng', 'Nguyễn Thanh Lâm', '2023-01-09 18:55:39', 'Nguyễn Thanh Lâm', '2023-03-09 06:20:15', 10196735.19),
	('e2b8eccc-0cea-1a3f-b1db-6977b4eb20f2', 'NV00818', 'Lưu Tiến Hùng', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Nhân viên Sale', 'Số 58 đường Cầu Giấy', '1994-10-26', 2, '027099097387', '2020-06-17', 'CA Hà Nội', '0971920404', '02430365093', 'NV00554@gmail.com', '1903479504400', 'BIDV', 'Hai Bà Trưng', 'Lưu Tiến Hoan', '2023-01-20 09:52:04', 'Đinh Thế Anh', '2023-03-09 20:56:56', 16890437.02),
	('e3de2f0a-d85b-39fd-8445-01fdafcfaa14', 'NV00854', 'Nguyễn Thế Hoan', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Bảo vệ', 'Số 170 đường Hoàng Quốc Việt', '2002-06-18', 1, '027099174657', '2021-08-25', 'CA Quảng Ninh', '0975512252', '02432535066', 'NV00301@gmail.com', '1903479528476', 'VP Bank', 'Hai Bà Trưng', 'Đinh Thế Anh', '2023-02-11 13:26:34', 'Nguyễn Thanh Lâm', '2023-03-12 22:05:46', 13219722.06),
	('e8f20fa6-4a5d-1afa-bfae-e9fe2fda6bf9', 'NV00652', 'Đinh Tiến Lâm', '62a934fb-b7bf-47e3-b849-1ad0a657cd84', 'Lập trình viên', 'Số 378 đường Cầu Giấy', '1995-05-16', 1, '027099605647', '2022-02-27', 'CA Quảng Ninh', '0979699566', '02439247047', 'NV00334@gmail.com', '1903470478256', 'TP Bank', 'Cầu Giấy', 'Lưu Tiến Hoan', '2023-02-02 02:50:53', 'Nguyễn Thanh Lâm', '2023-03-04 14:26:58', 13011785.04),
	('ee8cafe2-ffa2-52db-9ec9-1c2edc8655e0', 'NV00732', 'Nguyễn Thanh Mạnh', '62a934fb-b7bf-47e3-b849-1ad0a657cd84', 'Bảo vệ', 'Số 78 đường Đê La Thành', '2001-11-08', 1, '027099530367', '2021-02-15', 'CA Quảng Ninh', '0975212297', '02436406646', 'NV00944@gmail.com', '1903474947016', 'Techcombank', 'Hoàng Quốc Việt', 'Nguyễn Thanh Lâm', '2023-01-01 00:00:07', 'Lưu Tiến Hoan', '2023-03-13 14:09:11', 15667106.03),
	('eeb55497-75c3-185e-b12f-3bab63d18fe9', 'NV00629', 'Tạ Hải Hùng', 'c4d84e79-ca5c-44d4-9b12-cb37344342a5', 'Tester', 'Số 372 đường Cầu Giấy', '1993-01-02', 1, '027099574708', '2021-08-10', 'CA Vĩnh Phúc', '0971392570', '02438598427', 'NV00646@gmail.com', '1903476302417', 'TP Bank', 'Bắc Từ Liêm', 'Lưu Tiến Hoan', '2023-01-27 15:23:42', 'Đinh Thế Anh', '2023-03-08 18:56:20', 11568282.24),
	('f34816b5-530a-360a-93fb-231d1d7fff7c', 'NV00840', 'Tạ Thế Hoan', 'c4d84e79-ca5c-44d4-9b12-cb37344342a5', 'Nhân viên Sale', 'Số 167 đường Hoàng Quốc Việt', '2002-02-18', 1, '027099078000', '2021-12-14', 'CA Vĩnh Phúc', '0972389284', '02431562785', 'NV00696@gmail.com', '1903476231588', 'BIDV', 'Cầu Giấy', 'Nguyễn Thanh Lâm', '2023-01-08 13:34:21', 'Đinh Thế Anh', '2023-03-10 07:59:41', 12163042.46),
	('f74d6e93-3f4d-3121-af21-3dccfbeedabe', 'NV00387', 'Tạ Anh Tùng', '62a934fb-b7bf-47e3-b849-1ad0a657cd84', 'Tester', 'Số 185 đường Hoàng Quốc Việt', '2003-08-01', 0, '027099454256', '2020-07-23', 'CA Hải Dương', '0970860958', '02430984782', 'NV00858@gmail.com', '1903479284819', 'BIDV', 'Cầu Giấy', 'Đinh Thế Anh', '2023-01-02 16:17:53', 'Đinh Thế Anh', '2023-03-11 12:46:25', 13266987.37),
	('fa1eb768-cfda-21ad-b021-590521bfcbbe', 'NV00670', 'Nguyễn Hải Huy', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Bảo vệ', 'Số 356 đường Cầu Giấy', '2005-12-17', 2, '027099091982', '2021-08-11', 'CA Quảng Ninh', '0972818897', '02433311583', 'NV00652@gmail.com', '1903471837242', 'Vietcombank', 'Bắc Từ Liêm', 'Nguyễn Thanh Lâm', '2023-01-02 00:15:44', 'Đinh Thế Anh', '2023-03-03 15:58:57', 15991348.24),
	('fabfe6bb-03da-11a6-ab49-22a54dbc771b', 'NV00300', 'Nguyễn Văn An', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Tester', 'Số 307 đường Cầu Giấy', '2003-09-24', 1, '027099895641', '2020-06-15', 'CA Hà Nội', '0978561778', '02434284597', 'NV00347@gmail.com', '1903470984684', 'VP Bank', 'Hoàng Quốc Việt', 'Lưu Tiến Hoan', '2023-02-25 23:39:15', 'Đinh Thế Anh', '2023-03-05 18:44:53', 10612663.58),
	('fb5abcc4-e2fb-25d7-a8a4-1ddb513e4caf', 'NV00556', 'Tạ Hải Tùng', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Nhân viên ', 'Số 303 đường Xuân Thủy', '1993-02-08', 0, '027099916494', '2022-01-16', 'CA Quảng Ninh', '0978230239', '02435744777', 'NV00240@gmail.com', '1903475419244', 'VP Bank', 'Hai Bà Trưng', 'Lưu Tiến Hoan', '2023-01-13 21:11:07', 'Nguyễn Thanh Lâm', '2023-03-02 00:16:16', 10606273.92),
	('fdfdcaf4-9b2a-2db1-bce6-f5ec4fae8aa2', 'NV00685', 'Nguyễn Thế An', 'bc6d82da-55c1-48ba-ab5d-3e86829e33cd', 'Nhân viên Sale', 'Số 69 đường Hoàng Quốc Việt', '1997-04-08', 1, '027099589637', '2021-08-20', 'CA Quảng Ninh', '0974089369', '02431385679', 'NV00250@gmail.com', '1903476171119', 'Vietcombank', 'Hai Bà Trưng', 'Lưu Tiến Hoan', '2023-01-09 02:22:30', 'Nguyễn Thanh Lâm', '2023-03-09 02:19:43', 12450508.61),
	('fe27efcf-e4da-4594-9e1a-4f15f5a0ee8c', 'NV00052', 'Tạ Tiến Anh', '5a32a739-0460-4dd5-a6ea-1a4c494bc7a5', 'Nhân viên ', 'Số 50 đường Xuân Thủy', '2005-07-07', 0, '027099550431', '2021-08-31', 'CA Bắc Ninh', '0977592392', '02434086127', 'NV00927@gmail.com', '1903471706783', 'Vietcombank', 'Hai Bà Trưng', 'Lưu Tiến Hoan', '2023-02-03 09:07:13', 'Đinh Thế Anh', '2023-03-15 18:21:41', 11752521.46);

-- Dumping structure for procedure samsungsds.class2.team5.employeemanagement.Proc_Department_DeleteByID
DELIMITER //
CREATE PROCEDURE `Proc_Department_DeleteByID`(IN v_DepartmentID CHAR(36))
    COMMENT '--Author:HoanOliver\r\n--CreatedDate:29/10/2022\r\n--Decription:Lấy thông tin nhân viên theo id\r\n--ModifiedBy:\r\n--Tham số :EmpId CHAR(36)\r\n--Code chạy thử: CALL `misa.web09.tcdn.lthoan`.Proc_Department_DeleteByID (IN EmpId CHAR(36))\r\n  '
BEGIN
DELETE FROM department WHERE DepartmentID=v_DepartmentID;

END//
DELIMITER ;

-- Dumping structure for procedure samsungsds.class2.team5.employeemanagement.Proc_Department_GetALL
DELIMITER //
CREATE PROCEDURE `Proc_Department_GetALL`()
    COMMENT '--Author:HoanOliver\r\n--CreatedDate:29/10/2022\r\n--Decription:Lấy tất cả phòng ban\r\n--ModifiedBy:\r\n--Code chạy thử: CALL `misa.web09.tcdn.lthoan`.Proc_Department_GetALL();\r\n  '
BEGIN
SELECT d.DepartmentID,
       d.DepartmentCode,
       d.DepartmentName,
       d.CreatedBy,
       d.CreatedDate,
       d.ModifiedBy,
       d.ModifiedDate FROM department d;
END//
DELIMITER ;

-- Dumping structure for procedure samsungsds.class2.team5.employeemanagement.Proc_Department_GetByID
DELIMITER //
CREATE PROCEDURE `Proc_Department_GetByID`(IN v_DepartmentID CHAR(36))
    COMMENT '--Author:HoanOliver\r\n--CreatedDate:29/10/2022\r\n--Decription:Lấy thông tin phòng ban theo id\r\n--ModifiedBy:\r\n--Tham số :EmpId CHAR(36)\r\n--Code chạy thử: CALL `misa.web09.tcdn.lthoan`.Proc_Department_GetByID ("025d2cc1-51d1-acda-233f-8ca2ea2e8060")'
BEGIN

SELECT d.DepartmentID,
       d.DepartmentCode,
       d.DepartmentName,
       d.CreatedBy,
       d.CreatedDate,
       d.ModifiedBy,
       d.ModifiedDate FROM department d  WHERE d.DepartmentID = v_DepartmentID;
END//
DELIMITER ;

-- Dumping structure for procedure samsungsds.class2.team5.employeemanagement.Proc_Employee_CheckDuplicateCode_Insert
DELIMITER //
CREATE PROCEDURE `Proc_Employee_CheckDuplicateCode_Insert`(IN v_EmployeeCode VARCHAR(20), OUT isDuplicate INT)
    COMMENT '--Author:HoanOliver\r\n--CreatedDate:29/10/2022\r\n--Decription:Check mã nhân viên trùng khi thêm mới\r\n--Tham số:v_EmployeeCode:Mã nhân viên muốn kiểm tra\r\n--              Output :isDuplicate: trả về 1 nếu không bị trùng ,nếu trùng trả về 0\r\n--ModifiedBy:\r\n--Code chạy thử: CALL `misa.web09.tcdn.lthoan`.Proc_Employee_CheckDuplicateCode_Insert(IN v_EmployeeCode VARCHAR(20), OUT isDuplicate INT)'
BEGIN
SET @EmpCode=(SELECT EmployeeCode FROM employee WHERE EmployeeCode=v_EmployeeCode );

set isDuplicate= ISNULL(@EmpCode);
END//
DELIMITER ;

-- Dumping structure for procedure samsungsds.class2.team5.employeemanagement.Proc_Employee_CheckDuplicateCode_Update
DELIMITER //
CREATE PROCEDURE `Proc_Employee_CheckDuplicateCode_Update`(IN v_EmployeeID CHAR(36), IN v_EmployeeCode VARCHAR(20), OUT isDuplicate INT)
    COMMENT '--Author:HoanOliver\r\n--CreatedDate:29/10/2022\r\n--Decription:Check mã nhân viên trùng khi thêm mới\r\n--Tham số:v_EmployeeCode:Mã nhân viên muốn kiểm tra\r\n--         v_EmployeeID:ID nhân viên muốn kiểm tra trùng mã\r\n-- Output :isDuplicate: trả về 1 nếu không bị trùng ,nếu trùng trả về 0\r\n--ModifiedBy:\r\n--Code chạy thử: CALL `misa.web09.tcdn.lthoan`.Proc_Employee_CheckDuplicateCode_Update(IN v_EmployeeID CHAR(36), IN v_EmployeeCode VARCHAR(20), OUT isDuplicate INT)'
BEGIN
SET @CurrentEmpCode=(SELECT EmployeeCode FROM employee WHERE EmployeeID=v_EmployeeID );

IF @CurrentEmpCode = v_EmployeeCode THEN
set isDuplicate =1;
ELSE
set @Empcode=(SELECT EmployeeCode FROM employee WHERE EmployeeCode=v_EmployeeCode );

set isDuplicate= ISNULL(@EmpCode);
END IF;
END//
DELIMITER ;

-- Dumping structure for procedure samsungsds.class2.team5.employeemanagement.Proc_Employee_DeleteBatch
DELIMITER //
CREATE PROCEDURE `Proc_Employee_DeleteBatch`(IN ListID varchar(1000))
    DETERMINISTIC
    COMMENT '--Author:HoanOliver\r\n--CreatedDate:29/10/2022\r\n--Decription:Xóa nhiều nhân viên theo danh sách ID\r\n--ModifiedBy:\r\n--Tham số :ListID TEXT:danh sách ID muốn xóa\r\n--Code chạy thử: CALL `misa.web09.tcdn.lthoan`.Proc_Employee_DeleteMultiple ()\r\n  '
BEGIN

DELETE FROM employee WHERE EmployeeID IN (ListID);
 
END//
DELIMITER ;

-- Dumping structure for procedure samsungsds.class2.team5.employeemanagement.Proc_Employee_DeleteByID
DELIMITER //
CREATE PROCEDURE `Proc_Employee_DeleteByID`(IN v_EmployeeID CHAR(36))
    COMMENT '--Author:HoanOliver\r\n--CreatedDate:29/10/2022\r\n--Decription:Lấy thông tin nhân viên theo id\r\n--ModifiedBy:\r\n--Tham số :EmpId CHAR(36)\r\n--Code chạy thử: CALL `misa.web09.tcdn.lthoan`.Proc_Employee_DeleteByID (IN EmpId CHAR(36))\r\n  '
BEGIN
DELETE FROM employee WHERE EmployeeID = v_EmployeeID;

END//
DELIMITER ;

-- Dumping structure for procedure samsungsds.class2.team5.employeemanagement.Proc_Employee_DeleteMultiple
DELIMITER //
CREATE PROCEDURE `Proc_Employee_DeleteMultiple`(IN listID VARCHAR(1000))
    DETERMINISTIC
    COMMENT '--Author:HoanOliver\r\n--CreatedDate:29/10/2022\r\n--Decription:Xóa nhiều nhân viên theo danh sách ID\r\n--ModifiedBy:\r\n--Tham số :ListID TEXT:danh sách ID muốn xóa\r\n--Code chạy thử: CALL `misa.web09.tcdn.lthoan`.Proc_Employee_DeleteMultiple ()\r\n  '
BEGIN


  set @query = CONCAT('DELETE FROM employee WHERE EmployeeID IN(',listID,');');    
  PREPARE query FROM @query;
  EXECUTE query;


 


END//
DELIMITER ;

-- Dumping structure for procedure samsungsds.class2.team5.employeemanagement.Proc_Employee_GetALL
DELIMITER //
CREATE PROCEDURE `Proc_Employee_GetALL`()
    COMMENT '--Author:HoanOliver\r\n--CreatedDate:29/10/2022\r\n--Decription:Lấy tất cả nhân viên\r\n--ModifiedBy:\r\n--Code chạy thử: CALL `misa.web09.tcdn.lthoan`.Proc_Employee_GetALL()\r\n  '
BEGIN
SELECT e.EmployeeID,
       e.EmployeeCode,
       e.EmployeeName,
       e.DepartmentID,
       d.DepartmentName,
       e.PositionName,
       e.Address,
       e.DateOfBirth,
       e.Gender,
       e.IdentityNumber,
       e.IdentityDate,
       e.IdentityPlace,
       e.TelephoneNumber,
       e.PhoneNumber,
       e.Email,
       e.BankAccountNumber,
       e.BankName,
       e.BankBranchName,
       e.CreatedBy,
       e.CreatedDate,
       e.ModifiedBy,
       e.ModifiedDate 
       FROM employee e,department d
       WHERE e.DepartmentID=d.DepartmentID  ORDER BY e.CreatedDate DESC ;
END//
DELIMITER ;

-- Dumping structure for procedure samsungsds.class2.team5.employeemanagement.Proc_Employee_GetByID
DELIMITER //
CREATE PROCEDURE `Proc_Employee_GetByID`(IN v_EmployeeID CHAR(36))
    COMMENT '--Author:HoanOliver\r\n--CreatedDate:29/10/2022\r\n--Decription:Lấy thông tin nhân viên theo id\r\n--ModifiedBy:\r\n--Tham số :EmpId CHAR(36)\r\n--Code chạy thử: CALL `misa.web09.tcdn.lthoan`.Proc_Employee_GetByID ("025d2cc1-51d1-acda-233f-8ca2ea2e8060")\r\n  '
BEGIN
SELECT e.EmployeeID,
       e.EmployeeCode,
       e.EmployeeName,
       e.DepartmentID,
       d.DepartmentName,
       e.PositionName,
       e.Address,
       e.DateOfBirth,
       e.Gender,
       e.IdentityNumber,
       e.IdentityDate,
       e.IdentityPlace,
       e.TelephoneNumber,
       e.PhoneNumber,
       e.Email,
       e.BankAccountNumber,
       e.BankName,
       e.BankBranchName,
       e.CreatedBy,
       e.CreatedDate,
       e.ModifiedBy,
       e.ModifiedDate 
       FROM employee e,department d
       WHERE e.EmployeeID=v_EmployeeID AND d.DepartmentID=e.DepartmentID;
END//
DELIMITER ;

-- Dumping structure for procedure samsungsds.class2.team5.employeemanagement.Proc_Employee_GetFilterAndPaging
DELIMITER //
CREATE PROCEDURE `Proc_Employee_GetFilterAndPaging`(IN pageNumber INT, IN pageSize INT, IN keySearch VARCHAR(1000))
    COMMENT '\r\n  -- Author:        HoanOliver\r\n  -- Created date:  29/10/2022\r\n  -- Description:   Lấy danh sách nhân viên và tổng số nhân viên có phân trang và tìm kiếm\r\n  --Tham  số: pageNumber:Số thứ tự trang muốn lấy\r\n  --          pageSize:Số bản ghi trên 1 trang\r\n  --          keySearch:Từ khóa tìm kiếm\r\n  -- Modified by:   \r\n  -- Code chạy thử: CALL `misa.web09.tcdn.lthoan`.Proc_Employee_GetFilterAndPaging(0, 10,"Hoan");'
BEGIN
  -- Kiểm tra nếu tham số đầu vào v_Where bị NULL --> gán giá trị cho v_Where = ''
  -- --> Kiểm tra giá trị v_Where nếu = '' thì set v_Where = '(1=1)'
  
  IF IFNULL(keySearch, '') = '' THEN
    set @searchClause = '(1=1)';
  ELSE 
    SET @searchClause=CONCAT('(employee.EmployeeName  LIKE "%',keySearch,'%"','OR ','employee.EmployeeCode LIKE "%',keySearch,'%"','OR ','employee.TelephoneNumber LIKE "%',keySearch,'%")');

  END IF;
-- Tính toán ra thứ tự bản ghi bắt đầu lấy
  set @numberBegin=(pageNumber - 1 )*pageSize;
  set @numberRecordInOnePage=pageSize;

    SET @filterQuery = CONCAT('SELECT 
       employee.EmployeeID,
       employee.EmployeeCode,
       employee.EmployeeName,
       employee.DepartmentID,
       department.DepartmentName,
       employee.PositionName,
       employee.Address,
       employee.DateOfBirth,
       employee.Gender,
       employee.IdentityNumber,
       employee.IdentityDate,
       employee.IdentityPlace,
       employee.TelephoneNumber,
       employee.PhoneNumber,
       employee.Email,
       employee.BankAccountNumber,
       employee.BankName,
       employee.BankBranchName,
       employee.CreatedBy,
       employee.CreatedDate,
       employee.ModifiedBy,
       employee.ModifiedDate 
       FROM employee ,department 
       WHERE employee.DepartmentID=department.DepartmentID AND',@searchClause,  'ORDER BY employee.CreatedDate DESC LIMIT ',@numberBegin, ',', @numberRecordInOnePage);


  -- filterQuery và @filterQuery có ý nghĩa khác nhau
  -- filterQuery là 1 statement
  -- @filterQuery là 1 biến có kiểu dữ liệu là string
  PREPARE filterQuery FROM @filterQuery;
  EXECUTE filterQuery;
  DEALLOCATE PREPARE filterQuery;

  -- Lấy ra tổng số bản ghi thỏa mãn điều kiện lọc
  SET @filterQuery = CONCAT('SELECT count(EmployeeID) AS TotalCount FROM employee WHERE ',@searchClause);
  PREPARE filterQuery FROM @filterQuery;
  EXECUTE filterQuery;
  DEALLOCATE PREPARE filterQuery;
END//
DELIMITER ;

-- Dumping structure for procedure samsungsds.class2.team5.employeemanagement.Proc_Employee_GetNewCode
DELIMITER //
CREATE PROCEDURE `Proc_Employee_GetNewCode`(OUT newEmployeeCode varchar(20))
    COMMENT '--Author:HoanOliver\r\n--CreatedDate:29/10/2022\r\n--Decription:Lấy mã nhân viên lớn nhất\r\n--ModifiedBy:\r\n--Code chạy thử: CALL `misa.web09.tcdn.lthoan`.Proc_Employee_GetNewCode()\r\n  '
BEGIN
SET @MaxCode=(SELECT MAX(CONVERT(SUBSTRING(EmployeeCode,3),UNSIGNED )) FROM employee e) +1;



set newEmployeeCode=CONCAT('NV',@MaxCode);


END//
DELIMITER ;

-- Dumping structure for procedure samsungsds.class2.team5.employeemanagement.Proc_Employee_Insert
DELIMITER //
CREATE PROCEDURE `Proc_Employee_Insert`(IN v_EmployeeID char(36), IN v_EmployeeCode varchar(20), IN v_EmployeeName varchar(100), IN v_DepartmentID char(36), IN v_PositionName varchar(255), IN v_Address varchar(255), IN v_DateOfBirth date, IN v_Gender tinyint, IN v_IdentityNumber varchar(25), IN v_IdentityDate date, IN v_IdentityPlace varchar(255), IN v_TelePhoneNumber varchar(50), IN v_PhoneNumber varchar(50), IN v_Email varchar(100), IN v_BankAccountNumber varchar(25), IN v_BankName varchar(255), IN v_BankBranchName varchar(255), IN v_CreatedBy varchar(100), IN v_CreatedDate datetime, IN v_ModifiedBy varchar(100), IN v_ModifiedDate datetime)
    COMMENT ' --Author:HoanOliver\r\n--CreatedDate:29/10/2022\r\n--Decription:Thêm mới nhân viên\r\n--ModifiedBy:\r\n--Tham số :v_EmployeeID CHAR(36) :ID nhân viên\r\n--        v_EmployeeCode VARCHAR(20): Mã nhân viên\r\n--        v_EmployeeName VARCHAR(100):Tên nhân viên\r\n--        v_DepartmentID CHAR(36) :ID phòng ban\r\n--        v_PositionName VARCHAR(255):Tên vị trí\r\n--        v_Address VARCHAR(255) :Địa chỉ\r\n--        v_DateOfBirth DATE :Ngày sinh\r\n--        v_Gender tinyint :Giới tính\r\n--        v_IdentityNumber VARCHAR(25):Số chứng minh nhân dân\r\n--        v_IdentityDate DATE :Ngày cấp cmnd\r\n--        v_IdentityPlace VARCHAR(255) :Nơi cấp cmnd\r\n--        v_TelePhoneNumber VARCHAR(50) :Số điện thoại di động \r\n--        v_PhoneNumber VARCHAR(50) :Số điện thoại cố định\r\n--        v_Email VARCHAR(100) :Địa chỉ email \r\n--        v_BankAccountNumber VARCHAR(25):Số tài khoản ngân hàng\r\n--        v_BankName VARCHAR(255):Tên ngân hàng\r\n--        v_BankBranchName VARCHAR(255):Tên chi nhánh ngân hàng  \r\n--        v_CreatedBy VARCHAR(100) :Người tạo\r\n--        v_CreatedDate DATETIME :Ngày tạo\r\n--        v_ModifiedBy VARCHAR(100) :Người sửa\r\n--        v_ModifiedDate DATETIME : Thời gian sửa \r\n--\r\n--Code chạy thử: \r\nCALL `misa.web09.tcdn.lthoan`.Proc_Employee_Insert (UUID(),"NV17020757","Hoan Oliver", "71810c0d-0ce3-c9de-8ee8-dda14fa1343b",\r\n "Giám Đốc", "Bắc Ninh", CURDATE(), 0, "027099004705", CURDATE(), "CA Bắc Ninh", "0381010844", "0243666888", "17020757@vnu.edu.vn",\r\n "19034743410011", "Techcombank", "Hoàng Quốc Việt","Hoan") ;\r\n  '
BEGIN
  INSERT INTO employee (EmployeeID, EmployeeCode, EmployeeName, DepartmentID, PositionName, Address, DateOfBirth, Gender, IdentityNumber, IdentityDate, IdentityPlace, TelephoneNumber, PhoneNumber, Email, BankAccountNumber, BankName, BankBranchName, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate)
    VALUES (v_EmployeeID, v_EmployeeCode, v_EmployeeName, v_DepartmentID, v_PositionName, v_Address, v_DateOfBirth, v_Gender, v_IdentityNumber, v_IdentityDate, v_IdentityPlace, v_TelePhoneNumber, v_PhoneNumber, v_Email, v_BankAccountNumber, v_BankName, v_BankBranchName, v_CreatedBy, NOW(), NULL, NULL);



END//
DELIMITER ;

-- Dumping structure for procedure samsungsds.class2.team5.employeemanagement.Proc_Employee_Update
DELIMITER //
CREATE PROCEDURE `Proc_Employee_Update`(IN v_EmployeeID char(36), IN v_EmployeeCode varchar(20), IN v_EmployeeName varchar(100), IN v_DepartmentID char(36), IN v_PositionName varchar(255), IN v_Address varchar(255), IN v_DateOfBirth date, IN v_Gender tinyint, IN v_IdentityNumber varchar(25), IN v_IdentityDate date, IN v_IdentityPlace varchar(255), IN v_TelePhoneNumber varchar(50), IN v_PhoneNumber varchar(50), IN v_Email varchar(100), IN v_BankAccountNumber varchar(25), IN v_BankName varchar(255), IN v_BankBranchName varchar(255), IN v_CreatedBy varchar(100), IN v_CreatedDate datetime, IN v_ModifiedBy varchar(100), IN v_ModifiedDate datetime)
    COMMENT ' --Author:HoanOliver\r\n--CreatedDate:29/10/2022\r\n--Decription:Thêm mới nhân viên\r\n--ModifiedBy:\r\n--Tham số :v_EmployeeID CHAR(36) :ID nhân viên\r\n--        v_EmployeeCode VARCHAR(20): Mã nhân viên\r\n--        v_EmployeeName VARCHAR(100):Tên nhân viên\r\n--        v_DepartmentID CHAR(36) :ID phòng ban\r\n--        v_PositionName VARCHAR(255):Tên vị trí\r\n--        v_Address VARCHAR(255) :Địa chỉ\r\n--        v_DateOfBirth DATE :Ngày sinh\r\n--        v_Gender tinyint :Giới tính\r\n--        v_IdentityNumber VARCHAR(25):Số chứng minh nhân dân\r\n--        v_IdentityDate DATE :Ngày cấp cmnd\r\n--        v_IdentityPlace VARCHAR(255) :Nơi cấp cmnd\r\n--        v_TelePhoneNumber VARCHAR(50) :Số điện thoại di động \r\n--        v_PhoneNumber VARCHAR(50) :Số điện thoại cố định\r\n--        v_Email VARCHAR(100) :Địa chỉ email \r\n--        v_BankAccountNumber VARCHAR(25):Số tài khoản ngân hàng\r\n--        v_BankName VARCHAR(255):Tên ngân hàng\r\n--        v_BankBranchName VARCHAR(255):Tên chi nhánh ngân hàng  \r\n--        v_CreatedBy VARCHAR(100) :Người tạo\r\n--        v_CreatedDate DATETIME :Ngày tạo\r\n--        v_ModifiedBy VARCHAR(100) :Người sửa\r\n--        v_ModifiedDate DATETIME : Thời gian sửa \r\n--\r\n--Code chạy thử: \r\nCALL `misa.web09.tcdn.lthoan`.Proc_Employee_Update (UUID(),"NV17020757","Hoan Oliver", "71810c0d-0ce3-c9de-8ee8-dda14fa1343b",\r\n "Giám Đốc", "Bắc Ninh", CURDATE(), 0, "027099004705", CURDATE(), "CA Bắc Ninh", "0381010844", "0243666888", "17020757@vnu.edu.vn",\r\n "19034743410011", "Techcombank", "Hoàng Quốc Việt" ,"HOAN") ;\r\n  '
BEGIN

  UPDATE employee e

  SET EmployeeCode = v_EmployeeCode,
      EmployeeName = v_EmployeeName,
      DepartmentID = v_DepartmentID,
      PositionName = v_PositionName,
      Address = v_Address,
      DateOfBirth = v_DateOfBirth,
      Gender = v_Gender,
      IdentityNumber = v_IdentityNumber,
      IdentityDate = v_IdentityDate,
      IdentityPlace = v_IdentityPlace,
      TelephoneNumber = v_TelePhoneNumber,
      PhoneNumber = v_PhoneNumber,
      Email = v_Email,
      BankAccountNumber = v_BankAccountNumber,
      BankName = v_BankName,
      BankBranchName = v_BankBranchName,
      ModifiedBy = v_ModifiedBy,
      ModifiedDate = NOW()

  WHERE EmployeeID = v_EmployeeID;

END//
DELIMITER ;

-- Dumping structure for table samsungsds.class2.team5.employeemanagement.user
CREATE TABLE IF NOT EXISTS `user` (
  `UserId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `UserCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `Username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `Password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `FullName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `vendorCode` (`UserCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Bảng thông tin người dùng';

-- Dumping data for table samsungsds.class2.team5.employeemanagement.user: ~0 rows (approximately)
INSERT INTO `user` (`UserId`, `UserCode`, `Username`, `Password`, `FullName`) VALUES
	('4a811da6-150a-4cc6-9fa7-80a067afb197', 'AD001', 'Admin1', '123456', 'Lưu Tiến Hoan'),
	('5435bea6-7ba3-4846-ae95-ed487fe4fa09', 'AD002', 'Admin2', '228386', 'Đinh Thế Anh '),
	('8749aef6-56c7-4ada-a8ce-ef0f678b4258', 'AD003', 'Admin3', '240599', 'Nguyễn Thanh Lâm');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
