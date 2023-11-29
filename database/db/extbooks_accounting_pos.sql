-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 21, 2023 at 10:37 AM
-- Server version: 8.0.27
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `extbooks_accounting_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `airline`
--

CREATE TABLE `airline` (
  `AirLineID` int NOT NULL,
  `AirLineName` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airline`
--

INSERT INTO `airline` (`AirLineID`, `AirLineName`) VALUES
(1, 'AKBAR TRAVEL'),
(2, 'AIR BLUE'),
(3, 'AL DIYAFA');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int UNSIGNED NOT NULL,
  `start_time` datetime NOT NULL,
  `finish_time` datetime NOT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `employee_id` int UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointment_service`
--

CREATE TABLE `appointment_service` (
  `appointment_id` int UNSIGNED NOT NULL,
  `service_id` int UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE `attachment` (
  `AttachmentID` int NOT NULL,
  `InvoiceNo` varchar(25) DEFAULT NULL,
  `FileName` varchar(75) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `billers`
--

CREATE TABLE `billers` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billers`
--

INSERT INTO `billers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `state`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Faheem', '1675923361.jpg', 'Electric store', NULL, 'adeem@example.com', '03315873298', 'Jhelum', 'Jhelum', 'Punjab', '49600', 'Pakistan', 1, '2021-08-28 23:44:37', '2023-02-09 01:16:01'),
(2, 'Zaigham Shah', NULL, 'Shah Corporation', NULL, 'za@shahcorporationltd.com', '0345-9512786', 'Shah Corporation Building Kala Gujran Phatak GTRoad Jhelum', 'Jhelum', NULL, NULL, NULL, 1, '2021-09-28 17:25:56', '2022-09-12 10:40:27'),
(3, 'test', NULL, 'test company', '3442', 'test@example.com', '4523423', 'fds', 'peshawar', 'kpk', '25000', 'pakistan', 0, '2023-01-18 09:00:03', '2023-01-18 09:22:49');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `InvoiceDetailID` int NOT NULL,
  `InvoiceMasterID` int DEFAULT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `Rate` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bill_master`
--

CREATE TABLE `bill_master` (
  `InvoiceMasterID` int NOT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `InvoiceType` varchar(30) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `WalkinCustomerName` varchar(155) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `ReferenceNo` varchar(35) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL,
  `PaymentDetails` varchar(255) DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `DescriptionNotes` varchar(255) DEFAULT NULL,
  `CustomerNotes` varchar(255) DEFAULT NULL,
  `SubTotal` double(8,2) DEFAULT NULL,
  `DiscountPer` double(8,2) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL,
  `DiscountAmount` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Shipping` double(8,2) DEFAULT NULL,
  `GrandTotal` double(8,2) DEFAULT NULL,
  `Paid` double(8,2) DEFAULT NULL,
  `Balance` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `BranchID` int NOT NULL,
  `BranchName` varchar(150) DEFAULT NULL,
  `BranchContact` varchar(50) DEFAULT NULL,
  `BranchEmail` varchar(50) DEFAULT NULL,
  `BranchAddress` varchar(150) DEFAULT NULL,
  `BranchLogo` varchar(50) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`BranchID`, `BranchName`, `BranchContact`, `BranchEmail`, `BranchAddress`, `BranchLogo`, `CreatedDate`, `UpdatedDate`) VALUES
(2, 'Allianz Marketing Management', '+971551923008', 'hr@fcb.ae', 'Clover bay Tower Office #1212', '1667395197.jpg', '2022-11-02 13:19:57', '2022-11-02 13:19:57'),
(3, 'Grand Alliance Commercial Brokerage LLC', '045693717', 'hr@fcb.ae', 'Office No 303, Marasi Drive, Clover Bay Tower', '1667471486.jpg', '2022-11-03 10:31:26', NULL),
(4, 'Friends Marketing Management', '047170220', 'hr@fcb.ae', 'Clover Bay Tower, Office No 1807', '1667478735.jpg', '2022-11-03 12:32:15', NULL),
(5, 'Extensive IT Services', '047170220', 'hr@fcb.ae', 'Clover Bay Tower, Office No 1807', '1667478819.jpg', '2022-11-03 12:33:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Philips', NULL, 0, '2021-08-28 23:07:12', '2021-09-06 16:54:17'),
(2, 'Sogo', NULL, 0, '2021-08-28 23:07:25', '2021-09-06 16:54:17'),
(3, 'Dawlance', '20210906115107.png', 0, '2021-09-06 16:51:07', '2021-09-12 21:56:39'),
(4, 'Sumsung', '20210906115343.png', 0, '2021-09-06 16:53:43', '2021-09-12 21:56:39'),
(5, 'IBM', '1683626582.jpg', 1, '2021-09-12 21:57:23', '2023-05-09 16:03:02'),
(6, 'puma', '1683626333.png', 1, '2021-09-25 18:34:35', '2023-05-09 15:58:53');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Technology', NULL, NULL, 0, '2021-08-28 23:04:24', '2021-09-12 21:54:48'),
(2, 'Hardware', NULL, 1, 0, '2021-08-28 23:05:11', '2021-09-12 21:54:48'),
(3, 'Refrigerator', NULL, NULL, 0, '2021-09-06 16:45:11', '2021-09-12 21:54:48'),
(4, 'Microwave Oven', NULL, NULL, 0, '2021-09-06 16:46:45', '2021-09-12 21:54:48'),
(5, 'Inverter', NULL, NULL, 0, '2021-09-06 16:47:03', '2021-09-12 21:54:48'),
(6, 'LED', NULL, NULL, 0, '2021-09-06 16:47:15', '2021-09-12 21:54:48'),
(7, 'Washing Machine', NULL, NULL, 0, '2021-09-06 16:47:44', '2021-09-12 21:54:48'),
(8, 'Oven', NULL, NULL, 0, '2021-09-06 17:21:13', '2021-09-12 21:54:48'),
(9, 'Iron', NULL, NULL, 0, '2021-09-06 18:50:45', '2021-09-12 21:54:48'),
(10, 'Soap', NULL, NULL, 0, '2021-09-12 22:12:49', '2021-09-25 17:42:34'),
(11, 'Shampoo', NULL, NULL, 1, '2021-09-12 22:20:21', '2021-09-12 22:20:21'),
(12, 'Cleaner', NULL, NULL, 0, '2021-09-12 22:21:27', '2021-09-25 17:42:34'),
(13, 'Teezaab', NULL, 12, 0, '2021-09-12 22:21:45', '2021-09-25 17:42:34'),
(14, 'Gel', NULL, NULL, 1, '2021-09-25 17:43:05', '2021-09-25 17:43:05'),
(15, 'Extra Strong', NULL, 14, 1, '2021-09-25 17:43:37', '2021-09-25 17:43:37'),
(16, 'Mega Hold', NULL, 14, 1, '2021-09-25 17:43:58', '2021-09-25 17:43:58'),
(17, 'Gum', NULL, 14, 1, '2021-09-25 17:44:16', '2021-09-25 17:44:16'),
(18, 'Wax', NULL, NULL, 1, '2021-09-25 17:44:47', '2021-09-25 17:44:47'),
(19, 'Matte', NULL, 18, 1, '2021-09-25 17:45:14', '2021-09-25 17:45:14'),
(20, 'Wet', NULL, 18, 1, '2021-09-25 17:45:35', '2021-09-25 17:45:35'),
(21, 'Gold', NULL, 18, 1, '2021-09-25 17:45:58', '2021-09-25 17:45:58'),
(22, 'Wax extra strong', NULL, 18, 1, '2021-09-25 17:49:58', '2021-09-25 17:49:58'),
(23, 'Wax strong matte', NULL, 18, 1, '2021-09-25 17:50:38', '2021-09-25 17:50:38'),
(24, 'Wax bubble gum', NULL, 18, 1, '2021-09-25 17:50:55', '2021-09-25 17:50:55'),
(25, 'Wax Clay', NULL, 18, 1, '2021-09-25 17:51:14', '2021-09-25 17:51:14'),
(26, 'Conditioner', NULL, NULL, 1, '2021-09-25 17:51:49', '2021-09-25 17:51:49'),
(27, 'Spray Argan', NULL, 26, 1, '2021-09-25 17:52:49', '2021-09-25 17:52:49'),
(28, 'Spray Keratein', NULL, 26, 1, '2021-09-25 17:53:19', '2021-09-25 17:53:19'),
(29, 'Spray Blue', NULL, 26, 1, '2021-09-25 17:53:39', '2021-09-25 17:53:39'),
(30, 'Spray Pink', NULL, 26, 1, '2021-09-25 18:02:37', '2021-09-25 18:02:37'),
(31, 'After Shave Cream', NULL, NULL, 1, '2021-09-25 18:42:45', '2022-01-20 09:26:31'),
(32, 'Shave Cream & Cologne Zodiac', NULL, 31, 1, '2021-09-25 18:44:00', '2021-09-25 18:44:00'),
(33, 'Shave Cream & Cologne Wizard', NULL, 31, 1, '2021-09-25 18:44:36', '2021-09-25 18:44:36'),
(34, 'Shave Cream & Cologne Rain Drop', NULL, 31, 1, '2021-09-25 18:45:04', '2021-09-25 18:45:04'),
(35, 'Hair Mask', NULL, NULL, 1, '2021-09-25 18:45:51', '2021-09-25 18:45:51'),
(36, 'Conditioner Cream', NULL, NULL, 1, '2021-09-25 18:46:25', '2021-09-25 18:46:25'),
(37, 'Massage Oil', NULL, NULL, 1, '2021-09-25 18:46:43', '2021-09-25 18:46:43'),
(38, 'Shaving Gel', NULL, NULL, 1, '2021-09-25 18:47:00', '2021-09-25 18:47:00'),
(39, 'Oxidant Cream', NULL, NULL, 1, '2021-09-25 18:47:39', '2021-09-25 18:47:39'),
(40, 'Serum', NULL, NULL, 1, '2021-09-25 18:48:42', '2021-09-25 18:48:42');

-- --------------------------------------------------------

--
-- Table structure for table `challan_detail`
--

CREATE TABLE `challan_detail` (
  `ChallanDetailID` int NOT NULL,
  `ChallanMasterID` int NOT NULL,
  `ChallanNo` varchar(10) DEFAULT NULL,
  `ChallanDate` date DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `Rate` double(8,2) DEFAULT NULL,
  `TaxAmount` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `challan_master`
--

CREATE TABLE `challan_master` (
  `ChallanMasterID` int NOT NULL,
  `ChallanNo` varchar(10) DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `WalkinCustomerName` varchar(75) DEFAULT NULL,
  `PlaceOfSupply` varchar(25) DEFAULT NULL,
  `ReferenceNo` varchar(25) DEFAULT NULL,
  `ChallanDate` date DEFAULT NULL,
  `ChallanType` varchar(25) DEFAULT NULL,
  `CustomerNotes` varchar(255) DEFAULT NULL,
  `DescriptionNotes` varchar(255) DEFAULT NULL,
  `TermAndCondition` varchar(255) DEFAULT NULL,
  `File` varchar(75) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `SubTotal` double(8,2) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL,
  `DiscountPer` double(8,2) DEFAULT NULL,
  `DiscountAmount` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Shipping` double(8,2) DEFAULT NULL,
  `GrandTotal` double(8,2) DEFAULT NULL,
  `Paid` double(8,2) DEFAULT NULL,
  `Balance` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `challan_type`
--

CREATE TABLE `challan_type` (
  `ChallanTypeID` int NOT NULL,
  `ChallanTypeName` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `challan_type`
--

INSERT INTO `challan_type` (`ChallanTypeID`, `ChallanTypeName`) VALUES
(2, 'Supply of Goods'),
(3, 'Job Work'),
(4, 'Supply on Approval'),
(5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `chartofaccount`
--

CREATE TABLE `chartofaccount` (
  `ChartOfAccountID` int NOT NULL,
  `CODE` varchar(15) DEFAULT NULL,
  `ChartOfAccountName` varchar(75) DEFAULT NULL,
  `OpenDebit` int DEFAULT NULL,
  `OpenCredit` int DEFAULT NULL,
  `L1` int DEFAULT NULL,
  `L2` int DEFAULT NULL,
  `L3` int DEFAULT NULL,
  `Category` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chartofaccount`
--

INSERT INTO `chartofaccount` (`ChartOfAccountID`, `CODE`, `ChartOfAccountName`, `OpenDebit`, `OpenCredit`, `L1`, `L2`, `L3`, `Category`) VALUES
(100000, 'A', 'ASSETS', NULL, NULL, 100000, 100000, 100000, NULL),
(110000, 'A', 'CURRENT ASSET', NULL, NULL, 100000, 100000, 110000, NULL),
(110100, 'A', 'CASH ACCOUNT', NULL, NULL, 100000, 110000, 110100, NULL),
(110101, 'A', 'CASH IN HAND', NULL, NULL, 100000, 110000, 110100, 'CASH'),
(110106, 'A', 'PETTY CASH', NULL, NULL, 100000, 110000, 110100, NULL),
(110200, 'A', 'BANK DEPOSITS', NULL, NULL, 100000, 110000, 110200, NULL),
(110201, 'A', 'BANK1', NULL, NULL, 100000, 110000, 110200, 'BANK'),
(110202, 'A', 'BANK2', NULL, NULL, 100000, 110000, 110200, 'BANK'),
(110250, 'A', 'Credit Card ACCOUNT.', NULL, NULL, 100000, 110000, 110200, 'CARD'),
(110300, 'A', 'JAYLIN PAY.', NULL, NULL, 100000, 110000, 110200, NULL),
(110400, 'A', 'A/C RECEIVABLE.', NULL, NULL, 100000, 110000, 110400, 'AR'),
(110401, 'A', 'PARTY A/C.', NULL, NULL, 100000, 110000, 110400, NULL),
(110402, 'A', 'OTHER RECEIVABLES', NULL, NULL, 100000, 110000, 110400, NULL),
(110420, 'A', 'STAFF ADVANCES.', NULL, NULL, 100000, 110000, 110400, NULL),
(110430, 'A', 'OTHER ADVANCES', NULL, NULL, 100000, 110000, 110400, NULL),
(110490, 'A', 'BAD DEBTS', NULL, NULL, 100000, 110000, 110400, NULL),
(110500, 'A', 'INVENTORY', NULL, NULL, 100000, 110000, 110500, NULL),
(110501, 'A', 'STOCK IN HAND', NULL, NULL, 100000, 110000, 110500, NULL),
(110600, 'A', 'MISC. ADJUSTMENTS', NULL, NULL, 100000, 110000, 110600, NULL),
(110700, 'A', 'STOCK INVENTORY', NULL, NULL, 100000, 110000, 110000, NULL),
(110800, 'A', 'TAX ON PURCHASES', NULL, NULL, 100000, 110000, 110000, NULL),
(110900, 'A', 'PREPAID RENT', NULL, NULL, 100000, 110000, 110000, NULL),
(110901, 'A', 'EMPLOYEE SALAYR ADVANCE', NULL, NULL, 100000, 110000, 110000, NULL),
(110902, 'A', 'PREPAID VISA', NULL, NULL, 100000, 110000, 110000, NULL),
(110903, 'A', 'INPUT EXCISE TAX', NULL, NULL, 100000, 110000, 110000, NULL),
(110904, 'A', 'INPUT VAT', NULL, NULL, 100000, 110000, 110000, NULL),
(110905, 'A', 'PREPAID LEGAL FEES', NULL, NULL, 100000, 110000, 110000, NULL),
(110906, 'A', 'PREPAID OTHERS', NULL, NULL, 100000, 110000, 110000, NULL),
(110907, 'A', 'PREPAID INSURANCE', NULL, NULL, 100000, 110000, 110000, NULL),
(110908, 'A', 'SECURITY DEPOSIT', NULL, NULL, 100000, 110000, 110000, NULL),
(110909, 'A', 'OFFICE SUPPLIES', NULL, NULL, 100000, 110000, 110000, NULL),
(111009, 'A', 'acaca', NULL, NULL, 100000, 110000, 110000, 'BANK'),
(111109, 'A', 'fsgv', NULL, NULL, 100000, 110000, 110000, '0'),
(120100, 'A', 'FIXED ASSETS', NULL, NULL, 100000, 120000, 120100, NULL),
(120101, 'A', 'ACCUMULATED DESPRECIATION', NULL, NULL, 100000, 120000, 120100, NULL),
(120103, 'A', 'OFFICE EQUIPMENT', NULL, NULL, 100000, 120000, 120100, NULL),
(120104, 'A', 'MACHINERY & EQUIPMENT', NULL, NULL, 100000, 120000, 120100, NULL),
(120105, 'A', 'LAND & BUILDING', NULL, NULL, 100000, 120000, 120100, NULL),
(120106, 'A', 'GOOD WILL', NULL, NULL, 100000, 120000, 120100, NULL),
(120125, 'A', 'VEHICLES', NULL, NULL, 100000, 120000, 120100, NULL),
(120127, 'A', 'PREMISES(SHOP)', NULL, NULL, 100000, 120000, 120100, NULL),
(130000, 'A', 'OTHER ASSETS', NULL, NULL, 100000, 130000, 130000, NULL),
(130100, 'A', 'PREPAID EXPENSES', NULL, NULL, 100000, 130000, 130100, NULL),
(130200, 'A', 'LONG TERM INVESTMENTS', NULL, NULL, 100000, 130000, 130200, NULL),
(140000, 'A', 'DEFERRED ASSETS', NULL, NULL, 100000, 140000, 140000, NULL),
(140100, 'A', 'DEFERRED ASSETS', NULL, NULL, 100000, 140000, 140100, NULL),
(140200, 'A', 'DEPOSITS', NULL, NULL, 100000, 140000, 140200, NULL),
(140300, 'A', 'LEASEHOLD IMPROV.NET', NULL, NULL, 100000, 140000, 140300, NULL),
(200000, 'L', 'LIABILITIES', NULL, NULL, 200000, 200000, 200000, NULL),
(210000, 'L', 'ACCOUNTS PAYABLE', NULL, NULL, 200000, 210000, 210000, NULL),
(210100, 'L', 'A/C PAYABLE', NULL, NULL, 200000, 210000, 210100, 'AP'),
(210101, 'L', 'ADVANCE PAYMENT', NULL, NULL, 200000, 210000, 210100, NULL),
(210102, 'L', 'OTHER PAYABLES', NULL, NULL, 200000, 210000, 210100, NULL),
(210103, 'L', 'BALANCE ADJUSTMENT', NULL, NULL, 200000, 210000, 210100, NULL),
(210104, 'L', 'RENT PAYABLE', NULL, NULL, 200000, 210000, 210300, NULL),
(210105, 'L', 'TELEPHONE EXPENSE PAYABLE', NULL, NULL, 200000, 210000, 210100, NULL),
(210106, 'L', 'PDC PAYABLE', NULL, NULL, 200000, 210000, 210100, NULL),
(210107, 'L', 'WATER & ELECTRICITY PAYABLE', NULL, NULL, 200000, 210000, 210100, NULL),
(210108, 'L', 'SALARY PAYABLE', NULL, NULL, 200000, 210000, 210100, NULL),
(210109, 'L', 'EXCISE TAX PAYABLE', NULL, NULL, 200000, 210000, 210100, NULL),
(210110, 'L', 'OUTPUT VAT', NULL, NULL, 200000, 210000, 210100, NULL),
(210111, 'L', 'OTHER EXCISE TAX', NULL, NULL, 200000, 210000, 210100, NULL),
(210112, 'L', 'VAT PAYABLE', NULL, NULL, 200000, 210000, 210100, NULL),
(210113, 'L', 'UNEARNED REVENUE', NULL, NULL, 200000, 210000, 210100, NULL),
(210114, 'L', 'PROFESSIONAL FEE PAYABLE', NULL, NULL, 200000, 210000, 210100, NULL),
(210115, 'L', 'ACCRUED EXPENSE', NULL, NULL, 200000, 210000, 210100, NULL),
(210300, 'L', 'TAX PAYABLES', NULL, NULL, 200000, 210000, 210300, NULL),
(210301, 'L', 'W/H TAX Deductions', NULL, NULL, 200000, 210000, 210300, NULL),
(210302, 'L', 'MARKETING COMMISSION PAYABLE.', NULL, NULL, 200000, 210000, 210300, NULL),
(210303, 'L', 'TAKAFAL PAYABLE.', NULL, NULL, 200000, 210000, 210300, NULL),
(220000, 'L', 'SECURITIES', NULL, NULL, 200000, 220000, 220000, NULL),
(220100, 'L', 'SECURITIES', NULL, NULL, 200000, 220000, 220100, NULL),
(230000, 'L', 'VAT A/C', NULL, NULL, 200000, 230000, 230000, NULL),
(230100, 'L', 'VAT-OUTPUT TAX', NULL, NULL, 200000, 230000, 230000, NULL),
(230200, 'L', 'VAT-INPUT TAX', NULL, NULL, 200000, 230000, 230000, NULL),
(240000, 'L', 'LONG TERM LIABILITY', NULL, NULL, 200000, 200000, 240000, NULL),
(240100, 'L', 'ANNUAL LEAVE PAYABLE', NULL, NULL, 200000, 200000, 240000, NULL),
(240101, 'L', 'END OF SERVICE BENEFITS', NULL, NULL, 200000, 200000, 240000, NULL),
(240102, 'L', 'STAFFAIR TICKET PAYABLE', NULL, NULL, 200000, 200000, 240000, NULL),
(300000, 'C', 'STOCKHOLDERS EQUITY', NULL, NULL, 300000, 300000, 300000, NULL),
(310000, 'C', 'STOCKHOLDERS EQUITY', NULL, NULL, 300000, 310000, 310000, NULL),
(310100, 'C', 'CAPITAL STOCK.', NULL, NULL, 300000, 310000, 310100, NULL),
(310101, 'C', 'CAPITAL A/C.', NULL, NULL, 300000, 310000, 310100, NULL),
(310102, 'C', 'PROFIT AND LOSS A/C.', NULL, NULL, 300000, 310000, 310100, NULL),
(310103, 'C', 'CURRENT PERIOD PROF/LOSS.', NULL, NULL, 300000, 310000, 310100, NULL),
(310104, 'C', 'PARTNERS WITHDRAWAL', NULL, NULL, 300000, 310000, 310100, NULL),
(310105, 'C', 'SHARE CPAITAL ACCOUNT', NULL, NULL, 300000, 310000, 310100, NULL),
(310106, 'C', 'SHAREHOLDERS\'S CURRENT ACCOUNT', NULL, NULL, 300000, 310000, 310100, NULL),
(310107, 'C', 'RETAINED EARNINGS', NULL, NULL, 300000, 310000, 310100, NULL),
(310108, 'C', 'OWNERS EQUITY', NULL, NULL, 300000, 310000, 310100, NULL),
(320000, 'C', 'CAPITAL WITHDRAWALS', NULL, NULL, 300000, 320000, 320000, NULL),
(320100, 'C', 'CAPITAL WITHDRAWALS', NULL, NULL, 300000, 320000, 320100, NULL),
(400000, 'R', 'REVENUES', NULL, NULL, 400000, 400000, 400000, NULL),
(410000, 'R', 'SALES', NULL, NULL, 400000, 410000, 410000, NULL),
(410100, 'R', 'SALES', NULL, NULL, 400000, 410000, 410100, NULL),
(410101, 'R', 'COMMISSION.', NULL, NULL, 400000, 410000, 410100, NULL),
(410150, 'R', 'SALE OF TICKET', NULL, NULL, 400000, 410000, 410100, NULL),
(410151, 'R', 'INCOME FROM REPAIR', NULL, NULL, 400000, 410000, 410100, NULL),
(410152, 'R', 'DISCOUNT RECEIVED', NULL, NULL, 400000, 410000, 410100, NULL),
(410155, 'R', 'SALES DISCOUNTS', NULL, NULL, 400000, 410000, 410100, NULL),
(410172, 'R', 'FREIGHT CHARGES', NULL, NULL, 400000, 410000, 410100, NULL),
(410173, 'R', 'INCOME SALE COMMISSION.', NULL, NULL, 400000, 410000, 410100, NULL),
(410175, 'R', 'SALE RETURNS.', NULL, NULL, 400000, 410000, 410100, NULL),
(410180, 'R', 'SALE RETURN DISCOUNT.', NULL, NULL, 400000, 410000, 410100, NULL),
(410185, 'R', 'SALE RETURN FREIGHT', NULL, NULL, 400000, 410000, 410100, NULL),
(410200, 'R', 'OTHER INCOME', NULL, NULL, 400000, 410000, 410200, NULL),
(410201, 'R', 'MISC. INCOME', NULL, NULL, 400000, 410000, 410200, NULL),
(410205, 'R', 'OTHER SALES.', NULL, NULL, 400000, 410000, 410200, NULL),
(420000, 'R', 'OTHER REVENUES', NULL, NULL, 400000, 420000, 420000, NULL),
(420100, 'R', 'OTHER INCOME', NULL, NULL, 400000, 420000, 420100, NULL),
(420101, 'R', 'OTHER INCOME 2', NULL, NULL, 400000, 420000, 420100, NULL),
(420104, 'R', 'PENDING/TARGET INCOME', NULL, NULL, 400000, 420000, 420100, NULL),
(420105, 'R', 'SERVICE CHARGES', NULL, NULL, 400000, 420000, 420100, NULL),
(420200, 'R', 'OTHER INCOME', NULL, NULL, 400000, 420000, 420200, NULL),
(420201, 'R', 'GENERAL INCOME', NULL, NULL, 400000, 420000, 420200, NULL),
(420202, 'R', 'INTEREST INCOME', NULL, NULL, 400000, 420000, 420200, NULL),
(420203, 'R', 'LATE FEE INCOME', NULL, NULL, 400000, 420000, 420200, NULL),
(420204, 'R', 'DISCOUNT', NULL, NULL, 400000, 420000, 420200, NULL),
(420205, 'R', 'OTHER CHARGES', NULL, NULL, 400000, 420000, 420200, NULL),
(500000, 'E', 'TOTAL EXPENSES', NULL, NULL, 500000, 500000, 500000, NULL),
(500100, 'E', 'Shipping Expenses', NULL, NULL, 500000, 500000, 500000, NULL),
(500200, 'E', 'COST OF SALES', NULL, NULL, 500000, 500000, 500000, NULL),
(500300, 'E', 'TAXES:-:', NULL, NULL, 500000, 500000, 500000, '0'),
(510000, 'E', 'COST OF GOODS SOLD.', NULL, NULL, 500000, 510000, 510000, NULL),
(510100, 'E', 'MATERIAL INVENTORY', NULL, NULL, 500000, 510000, 510100, NULL),
(510101, 'E', 'OPENING STOCK.', NULL, NULL, 500000, 510000, 510100, NULL),
(510102, 'E', 'PURCHASES', NULL, NULL, 500000, 510000, 510100, NULL),
(510103, 'E', 'PURCHASE OF TICKET', NULL, NULL, 500000, 510000, 510100, NULL),
(510104, 'E', 'DISCOUNT ALLOWED', NULL, NULL, 500000, 510000, 510100, NULL),
(510105, 'E', 'PURCHASE DISCOUNTS', NULL, NULL, 500000, 510000, 510100, NULL),
(510107, 'E', 'PURCHASE LOADING', NULL, NULL, 500000, 510000, 510100, NULL),
(510109, 'E', 'PURCHASE UNLOADING', NULL, NULL, 500000, 510000, 510100, NULL),
(510110, 'E', 'PURCHASE RETURN.', NULL, NULL, 500000, 510000, 510100, NULL),
(510117, 'E', 'ZAKAT ACCOUNT.', NULL, NULL, 500000, 510000, 510100, NULL),
(510120, 'E', 'PURCHASES MISC. ADJ.', NULL, NULL, 500000, 510000, 510100, NULL),
(510122, 'E', 'PURCHASE BENDING', NULL, NULL, 500000, 510000, 510100, NULL),
(510140, 'E', 'ADNAN PAY.', NULL, NULL, 500000, 510000, 510100, NULL),
(510145, 'E', 'STOCK EXPENSES', NULL, NULL, 500000, 510000, 510100, NULL),
(510200, 'E', 'PACKING MATERIAL EXPENS.', NULL, NULL, 500000, 510000, 510200, NULL),
(510300, 'E', 'POWER:-', NULL, NULL, 500000, 510000, 510300, NULL),
(510400, 'E', 'MARKETING EXPENSES', NULL, NULL, 500000, 510000, 510400, NULL),
(510441, 'E', 'MARKETING SALARIES', NULL, NULL, 500000, 510000, 510400, NULL),
(510451, 'E', 'MARKETING PHONE/MOB EXP.', NULL, NULL, 500000, 510000, 510400, NULL),
(510461, 'E', 'ENTERTAINMENT', NULL, NULL, 500000, 510000, 510400, NULL),
(520000, 'E', 'GEN & ADMIN EXPENSES', NULL, NULL, 500000, 520000, 520000, NULL),
(520100, 'E', 'PAYROLL EXPENSES', NULL, NULL, 500000, 520000, 520100, NULL),
(520200, 'E', 'MAINTENANCE', NULL, NULL, 500000, 520000, 520200, NULL),
(530000, 'E', 'ORGANISATION EXPENSE.', NULL, NULL, 500000, 530000, 530000, NULL),
(530100, 'E', 'PAYROLL EXPENSES', NULL, NULL, 500000, 530000, 530100, NULL),
(530200, 'E', 'ASSETS INSURANCE', NULL, NULL, 500000, 530000, 530200, NULL),
(540000, 'E', 'REPAIR & MAINTENANCE', NULL, NULL, 500000, 540000, 540000, NULL),
(540100, 'E', 'REPAIR & MAINTENANCE', NULL, NULL, 500000, 540000, 540100, NULL),
(540110, 'E', 'R/M VEHICLE.', NULL, NULL, 500000, 540000, 540100, NULL),
(540111, 'E', 'R/M FURNITURE & FIXTURE', NULL, NULL, 500000, 540000, 540100, NULL),
(540112, 'E', 'R/M EQUIPMENT / COMPUTER', NULL, NULL, 500000, 540000, 540100, NULL),
(540130, 'E', 'GIFT ACCOUNT.', NULL, NULL, 500000, 540000, 540100, NULL),
(550000, 'E', 'OFFICE EXPENSES', NULL, NULL, 500000, 550000, 550000, NULL),
(550100, 'E', 'OFFICE EXPENSES', NULL, NULL, 500000, 550000, 550100, NULL),
(550110, 'E', 'PRINTING & STATIONARY', NULL, NULL, 500000, 550000, 550100, NULL),
(550114, 'E', 'VEHICLE EXP.', NULL, NULL, 500000, 550000, 550100, NULL),
(550115, 'E', 'LICENCE EXPENSE.', NULL, NULL, 500000, 550000, 550100, NULL),
(550116, 'E', 'TELEPHONE BILLS', NULL, NULL, 500000, 550000, 550100, NULL),
(550120, 'E', 'WATER BILLS', NULL, NULL, 500000, 550000, 550100, NULL),
(550121, 'E', 'ELECTRIC BILL.', NULL, NULL, 500000, 550000, 550100, NULL),
(550123, 'E', 'HOME EXPENSES', NULL, NULL, 500000, 550000, 550100, NULL),
(550124, 'E', 'ROOM RENT.', NULL, NULL, 500000, 550000, 550100, NULL),
(550125, 'E', 'TRAVELLING EXP.', NULL, NULL, 500000, 550000, 550100, NULL),
(550126, 'E', 'TEA & FOOD EXPENSES', NULL, NULL, 500000, 550000, 550100, NULL),
(550130, 'E', 'POL VEHICLE.', NULL, NULL, 500000, 550000, 550100, NULL),
(550132, 'E', 'LEGAL & PROFESSIONAL', NULL, NULL, 500000, 550000, 550100, NULL),
(550134, 'E', 'MISC. EXPENSES', NULL, NULL, 500000, 550000, 550100, NULL),
(550136, 'E', 'CHARITY & DONATIONS', NULL, NULL, 500000, 550000, 550100, NULL),
(550138, 'E', 'NEWS PAPERS', NULL, NULL, 500000, 550000, 550100, NULL),
(550140, 'E', 'MEMBERSHIP FEE', NULL, NULL, 500000, 550000, 550100, NULL),
(560000, 'E', 'FINANCIAL EXPENSES', NULL, NULL, 500000, 560000, 560000, NULL),
(560100, 'E', 'FINANCIAL EXPENSES', NULL, NULL, 500000, 560000, 560100, NULL),
(560110, 'E', 'BANK CHARGES', NULL, NULL, 500000, 560000, 560100, NULL),
(560111, 'E', 'FEE CHARGED', NULL, NULL, 500000, 560000, 560100, NULL),
(570000, 'E', 'DEPRICIATION', NULL, NULL, 500000, 570000, 570000, NULL),
(570100, 'E', 'DEPRICIATION', NULL, NULL, 500000, 570000, 570100, NULL),
(580100, 'E', 'TAXES:-', NULL, NULL, 500000, 580000, 580100, NULL),
(580120, 'E', 'TAX PAYABLE', NULL, NULL, 500000, 580000, 580120, NULL),
(580130, 'E', 'SALES TAX.', NULL, NULL, 500000, 580000, 580100, NULL),
(580135, 'E', 'INCOME TAX.', NULL, NULL, 500000, 580000, 580100, NULL),
(580140, 'E', 'PROFESSIONAL TAX (EXCISE)', NULL, NULL, 500000, 580000, 580100, NULL),
(580145, 'E', 'TOLL TAX.', NULL, NULL, 500000, 580000, 580100, NULL),
(590000, 'E', 'OTHER EXPENSES', NULL, NULL, 500000, 590000, 590000, NULL),
(590100, 'E', 'OTHER EXPENSES', NULL, NULL, 500000, 590000, 590100, NULL),
(590101, 'E', 'OTHER EXPENSES', NULL, NULL, 500000, 590000, 590100, NULL),
(590104, 'E', 'OFFICE EXPENCE.', NULL, NULL, 500000, 590000, 590100, NULL),
(590105, 'E', 'OFFICE RENT.', NULL, NULL, 500000, 590000, 590100, NULL),
(590106, 'E', 'COMPUTER EXPENSES', NULL, NULL, 500000, 590000, 590100, NULL),
(590107, 'E', 'BAD DEBTS ', NULL, NULL, 500000, 590000, 590100, NULL),
(590108, 'E', 'CASH SHORT /EXCESS', NULL, NULL, 500000, 590000, 590100, NULL),
(590109, 'E', 'PREVIOUS PERIOD P&L.', NULL, NULL, 500000, 590000, 590100, NULL),
(600000, 'S', 'SUSPENSE', NULL, NULL, 600000, 600000, 600000, NULL),
(610100, 'S', 'SUSPENSE', NULL, NULL, 600000, 610000, 610100, NULL),
(610101, 'S', 'SUSPENSE', NULL, NULL, 600000, 610000, 610100, NULL),
(610102, 'S', 'CLEARING ACCOUNT.', NULL, NULL, 600000, 610000, 610100, NULL),
(610103, 'S', 'CHEQUE ACCOUNT.', NULL, NULL, 600000, 610000, 610100, NULL),
(610104, 'S', 'EXCESS & SHORT ACCOUNT.', NULL, NULL, 600000, 610000, 610100, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `CompanyID` int NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `Name2` varchar(255) DEFAULT NULL,
  `TRN` varchar(150) DEFAULT NULL COMMENT 'tax registration no',
  `Currency` varchar(3) DEFAULT NULL,
  `Mobile` varchar(75) DEFAULT NULL,
  `Contact` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Website` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Logo` varchar(255) DEFAULT NULL,
  `BackgroundLogo` varchar(255) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Signature` varchar(255) DEFAULT NULL,
  `DigitalSignature` varchar(255) DEFAULT NULL,
  `EstimateInvoiceTitle` varchar(150) DEFAULT NULL,
  `SaleInvoiceTitle` varchar(150) DEFAULT NULL,
  `DeliveryChallanTitle` varchar(150) DEFAULT NULL,
  `CreditNoteTitle` varchar(150) DEFAULT NULL,
  `PurchaseInvoiceTitle` varchar(150) DEFAULT NULL,
  `DebitNoteTitle` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`CompanyID`, `Name`, `Name2`, `TRN`, `Currency`, `Mobile`, `Contact`, `Email`, `Website`, `Address`, `Logo`, `BackgroundLogo`, `CreatedDate`, `UpdatedDate`, `Signature`, `DigitalSignature`, `EstimateInvoiceTitle`, `SaleInvoiceTitle`, `DeliveryChallanTitle`, `CreditNoteTitle`, `PurchaseInvoiceTitle`, `DebitNoteTitle`) VALUES
(1, 'Extensive IT Services', NULL, '123456789', 'AED', NULL, '+971 4 584 8310', 'info@eits.ae', 'www.eits.ae', 'Office #1807 Clover Bay Tower, Business Bay - Dubai', '1686900356.png', '1673075815.png', '2023-06-16 07:25:56', '2023-06-16 07:25:56', '1670523242.png', '<h2><strong>Finance Director,</strong></h2>\r\n\r\n<p><strong>Kashif</strong></p>', 'Quotation', 'Sale Inoice by', 'Delivery Note', 'Credit Note', 'Purchase Bill', 'Debit Note');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int NOT NULL,
  `used` int NOT NULL,
  `expired_date` date NOT NULL,
  `user_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', 166, '2020-11-01 00:22:58', '2021-08-28 22:51:37'),
(2, 'Euro', 'Euro', 0.85, '2020-11-01 01:29:12', '2020-11-10 23:15:34'),
(3, 'Pakistani Rupees', 'Rs', 1, '2021-08-28 22:50:54', '2021-08-28 22:50:54');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int UNSIGNED NOT NULL,
  `customer_group_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `expense` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_group_id`, `user_id`, `name`, `company_name`, `email`, `phone_number`, `tax_no`, `address`, `city`, `state`, `postal_code`, `country`, `deposit`, `expense`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'walk-in', 'General', NULL, '0000000000', NULL, 'Other', 'variant', NULL, NULL, NULL, NULL, NULL, 1, '2021-08-28 23:39:03', '2021-08-28 23:39:03');

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `name`, `percentage`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Walk-in', '0', 1, '2021-08-28 23:37:00', '2021-09-07 17:08:16'),
(2, 'Distributor', '0', 1, '2021-09-12 22:08:01', '2021-09-30 18:17:48'),
(3, 'Gift', '0', 1, '2021-09-29 16:58:13', '2021-09-29 16:58:13'),
(4, 'Salesperson', '0', 1, '2021-09-29 17:22:41', '2021-09-29 17:22:41'),
(5, 'Staff', '0', 1, '2021-09-30 18:17:09', '2021-09-30 18:17:09'),
(6, 'Sample', '0', 1, '2021-09-30 21:40:04', '2021-10-14 22:09:21'),
(7, 'Staff Gift', '0', 1, '2021-09-30 21:45:46', '2021-09-30 21:45:46'),
(8, 'online', '0', 1, '2021-10-01 22:49:01', '2021-10-01 22:49:01'),
(9, 'Daraz', '0', 1, '2022-01-07 12:49:20', '2022-01-07 12:49:20'),
(10, 'Saraakuch', '0', 1, '2022-01-07 12:49:35', '2022-01-07 12:49:35'),
(11, 'Shop', '0', 1, '2022-01-07 12:50:49', '2022-01-07 12:50:49'),
(12, 'Mart', '0', 1, '2022-01-07 12:51:46', '2022-01-07 12:51:46');

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image_thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`id`, `name`, `description`, `image_thumbnail`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pizza', NULL, '1690438883.jpg', '1', '2023-02-27 10:45:32', '2023-07-27 01:21:24'),
(2, 'Omlate', NULL, '1690438915.jpg', '1', '2023-02-28 09:43:57', '2023-07-27 01:21:55'),
(4, 'Ice Cream', NULL, '1690438968.jpg', '1', '2023-04-16 14:04:35', '2023-07-27 01:22:48'),
(5, 'Shawarma', NULL, '1690438999.jpg', '1', '2023-05-05 16:43:41', '2023-07-27 01:23:19'),
(6, 'Shami Burger', NULL, '1690439065.jpg', '1', '2023-05-06 18:13:39', '2023-07-27 01:24:25'),
(7, 'Alo Parata', NULL, '1690439028.jpg', '1', '2023-05-12 05:38:15', '2023-07-27 01:23:48');

-- --------------------------------------------------------

--
-- Table structure for table `dish_images`
--

CREATE TABLE `dish_images` (
  `id` bigint UNSIGNED NOT NULL,
  `dish_id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dish_images`
--

INSERT INTO `dish_images` (`id`, `dish_id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Image 1', '1677512780.jpg', '2023-02-27 10:46:20', '2023-02-27 10:46:20'),
(2, 1, 'Image 2', '1677512813.jpg', '2023-02-27 10:46:53', '2023-02-27 10:46:53'),
(3, 2, 'Omelet small', '1677595508.png', '2023-02-28 09:45:08', '2023-02-28 09:45:08');

-- --------------------------------------------------------

--
-- Table structure for table `dish_recipes`
--

CREATE TABLE `dish_recipes` (
  `id` bigint UNSIGNED NOT NULL,
  `dish_id` int UNSIGNED NOT NULL,
  `dish_type_id` int UNSIGNED DEFAULT NULL,
  `item_id` int UNSIGNED DEFAULT NULL,
  `base_unit_amount_cooked` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child_unit_amount_cooked` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dish_recipes`
--

INSERT INTO `dish_recipes` (`id`, `dish_id`, `dish_type_id`, `item_id`, `base_unit_amount_cooked`, `child_unit_amount_cooked`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 28, '.7', '700', '2023-02-27 10:50:19', '2023-02-27 10:50:19'),
(2, 2, 3, 29, '1', '3', '2023-02-28 09:48:29', '2023-02-28 09:48:29'),
(3, 2, 3, 28, '.2', '200', '2023-02-28 09:48:52', '2023-02-28 09:48:52'),
(4, 2, 4, 28, '1', '1000', '2023-02-28 09:49:24', '2023-02-28 09:49:24'),
(5, 1, 2, 29, '2', '6', '2023-03-01 10:11:12', '2023-03-01 10:11:12'),
(6, 1, 1, 29, '0.5', '6', '2023-03-20 06:56:37', '2023-03-20 06:56:37'),
(7, 1, 8, 28, '1', '1000', '2023-05-02 23:12:21', '2023-05-02 23:12:21'),
(8, 1, 8, 29, '1.5', '18', '2023-05-02 23:13:09', '2023-05-02 23:13:09'),
(9, 7, 13, 28, '2', '2000', '2023-05-12 05:38:15', '2023-05-12 05:38:15'),
(10, 7, 13, 29, '2', '24', '2023-05-12 05:38:15', '2023-05-12 05:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `dish_tables`
--

CREATE TABLE `dish_tables` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dish_tables`
--

INSERT INTO `dish_tables` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Take Away', '2023-03-09 11:27:02', '2023-03-09 11:27:02'),
(2, 'Table 01', '2023-03-09 11:27:02', '2023-03-09 11:27:02');

-- --------------------------------------------------------

--
-- Table structure for table `dish_types`
--

CREATE TABLE `dish_types` (
  `id` bigint UNSIGNED NOT NULL,
  `dish_id` int UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dish_types`
--

INSERT INTO `dish_types` (`id`, `dish_id`, `type`, `price`, `image`, `code`, `created_at`, `updated_at`) VALUES
(1, 1, 'Small', '10', 'small_pizza.jpg', 'RES-11111', '2023-02-27 10:45:50', '2023-02-27 10:45:50'),
(2, 1, 'Medium', '20', 'large_pizza.jpg', 'RES-22222', '2023-02-27 10:45:59', '2023-02-27 10:45:59'),
(3, 2, 'Small', '10', 'small_omelate.jpg', 'RES-os1111', '2023-02-28 09:44:26', '2023-02-28 09:44:26'),
(4, 2, 'Medium', '20', 'medium_omelate.jpg', 'RES-om1111', '2023-02-28 09:44:34', '2023-02-28 09:44:34'),
(5, 2, 'Large', '30', 'large_omelate.jpg', 'RES-ol1111', '2023-02-28 09:44:41', '2023-02-28 09:44:41'),
(7, 4, '1/3', '1000', '1683615916.jpg', 'RES-34', '2023-04-16 14:04:55', '2023-05-09 13:05:16'),
(8, 1, 'Large', '30', '1683615624.jpg', 'RES-65438', '2023-05-02 23:11:38', '2023-05-09 13:00:24'),
(12, 6, '1/3', '250', '1683617454.jpg', 'RES-12345', '2023-05-09 13:30:54', '2023-05-09 13:30:54'),
(10, 5, '1', '120', '1683617185.jpg', 'RES-123456', '2023-05-09 13:26:25', '2023-05-09 13:26:25'),
(11, 6, '1/5', '3000', '1683617406.jpg', 'RES-4567854', '2023-05-09 13:30:06', '2023-05-09 13:30:06'),
(13, 7, 'Alo Parata', '400', '1683887895.jpg', 'RES-40109222', '2023-05-12 05:38:15', '2023-05-12 05:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `phone`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Miss Autumn Yost Sr.', 'upton.natasha@herman.biz', '+1 (361) 926-8817', '2023-06-06 11:11:51', '2023-06-06 11:11:51', NULL),
(2, 'Ulices Schuppe DVM', 'vsmitham@mills.com', '+1.980.984.2753', '2023-06-06 11:11:51', '2023-06-06 11:11:51', NULL),
(3, 'Sydnee Gorczany', 'hrempel@balistreri.org', '(348) 390-3526 x31565', '2023-06-06 11:11:51', '2023-06-06 11:11:51', NULL),
(4, 'Miss Myah Lemke', 'batz.ernie@yost.com', '+1.496.342.2938', '2023-06-06 11:11:51', '2023-06-06 11:11:51', NULL),
(5, 'Brittany Dickens', 'erich.goyette@trantow.com', '458-349-2073 x3740', '2023-06-06 11:11:51', '2023-06-06 11:11:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `estimate_detail`
--

CREATE TABLE `estimate_detail` (
  `EstimateDetailID` int NOT NULL,
  `EstimateMasterID` int NOT NULL,
  `EstimateNo` varchar(10) DEFAULT NULL,
  `EstimateDate` date DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `Rate` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `DiscountType` double(8,2) DEFAULT NULL,
  `Gross` double(8,2) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL,
  `DiscountAmountItem` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_master`
--

CREATE TABLE `estimate_master` (
  `EstimateMasterID` int NOT NULL,
  `EstimateNo` varchar(10) DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `WalkinCustomerName` varchar(55) DEFAULT NULL,
  `PlaceOfSupply` varchar(25) DEFAULT NULL,
  `ReferenceNo` varchar(25) DEFAULT NULL,
  `EstimateDate` date DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `SubTotal` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `TaxType` varchar(25) DEFAULT NULL,
  `Total` double(8,2) DEFAULT NULL,
  `DiscountPer` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `Shipping` double(8,2) DEFAULT NULL,
  `GrandTotal` double(8,2) DEFAULT NULL,
  `CustomerNotes` varchar(255) DEFAULT NULL,
  `DescriptionNotes` varchar(255) DEFAULT NULL,
  `TermAndCondition` varchar(255) DEFAULT NULL,
  `File` varchar(75) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expense_detail`
--

CREATE TABLE `expense_detail` (
  `ExpenseDetailID` int NOT NULL,
  `ExpenseMasterID` int DEFAULT NULL,
  `ChartOfAccountID` int DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Amount` double(8,2) DEFAULT NULL,
  `Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expense_master`
--

CREATE TABLE `expense_master` (
  `ExpenseMasterID` int NOT NULL,
  `ExpenseNo` varchar(55) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `ChartOfAccountID` int DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `ReferenceNo` varchar(55) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `GrantTotal` double(8,2) DEFAULT NULL,
  `Paid` double(8,2) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_detail`
--

CREATE TABLE `invoice_detail` (
  `InvoiceDetailID` int NOT NULL,
  `InvoiceMasterID` int DEFAULT NULL,
  `dish_id` int DEFAULT NULL,
  `dish_type_id` int DEFAULT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `Rate` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `DiscountType` double(8,2) DEFAULT NULL,
  `DiscountAmountItem` double(10,2) DEFAULT NULL,
  `Gross` double(8,2) DEFAULT NULL,
  `Total` double(50,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_detail`
--

INSERT INTO `invoice_detail` (`InvoiceDetailID`, `InvoiceMasterID`, `dish_id`, `dish_type_id`, `InvoiceNo`, `ItemID`, `Description`, `SupplierID`, `PartyID`, `Qty`, `Rate`, `TaxPer`, `Tax`, `Discount`, `DiscountType`, `DiscountAmountItem`, `Gross`, `Total`) VALUES
(1, 1, NULL, NULL, 'BILL-00001', 22, NULL, 1, NULL, 100, 80.00, 5.00, 400.00, NULL, NULL, NULL, NULL, 8400.00),
(2, 2, NULL, NULL, 'INV-00001', 22, 'Mouse', NULL, 1, 10, 100.00, 5.00, 50.00, NULL, NULL, NULL, NULL, 1050.00),
(3, 3, NULL, NULL, 'INV-00002', 22, NULL, NULL, 1, 1, 100.00, 5.00, 4.75, 5.00, 1.00, 5.00, 95.00, 95.00);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_dish_details`
--

CREATE TABLE `invoice_dish_details` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_master_id` int UNSIGNED DEFAULT NULL,
  `dish_id` int UNSIGNED DEFAULT NULL,
  `dish_type_id` int DEFAULT NULL,
  `quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Processing','Cancelled','Completed','Delivered') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Processing',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_master`
--

CREATE TABLE `invoice_master` (
  `InvoiceMasterID` int NOT NULL,
  `WarehouseID` int DEFAULT NULL,
  `otherWareHouseID` int DEFAULT NULL,
  `InvoiceNo` varchar(10) DEFAULT NULL,
  `InvoiceType` varchar(30) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `DishTableID` int DEFAULT NULL,
  `WalkinCustomerName` varchar(155) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `ReferenceNo` varchar(35) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL,
  `PaymentDetails` varchar(255) DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `TaxType` varchar(55) DEFAULT NULL,
  `DescriptionNotes` varchar(255) DEFAULT NULL,
  `CustomerNotes` varchar(255) DEFAULT NULL,
  `SubTotal` double(10,2) DEFAULT NULL,
  `DiscountModel` enum('number','percentage') NOT NULL DEFAULT 'percentage',
  `DiscountPer` double(10,2) DEFAULT NULL,
  `Total` double(10,2) DEFAULT NULL,
  `TotalQty` double DEFAULT NULL,
  `DiscountAmount` double(10,2) DEFAULT NULL,
  `TaxPer` double(10,2) DEFAULT NULL,
  `Tax` double(10,2) DEFAULT NULL,
  `Shipping` double(10,2) DEFAULT NULL,
  `GrandTotal` double(10,2) DEFAULT NULL,
  `Paid` double(10,2) DEFAULT NULL,
  `Balance` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_master`
--

INSERT INTO `invoice_master` (`InvoiceMasterID`, `WarehouseID`, `otherWareHouseID`, `InvoiceNo`, `InvoiceType`, `Date`, `DueDate`, `PartyID`, `DishTableID`, `WalkinCustomerName`, `SupplierID`, `ReferenceNo`, `UserID`, `PaymentMode`, `PaymentDetails`, `Subject`, `TaxType`, `DescriptionNotes`, `CustomerNotes`, `SubTotal`, `DiscountModel`, `DiscountPer`, `Total`, `TotalQty`, `DiscountAmount`, `TaxPer`, `Tax`, `Shipping`, `GrandTotal`, `Paid`, `Balance`) VALUES
(1, 2, NULL, 'BILL-00001', NULL, '2023-08-17', '2023-08-17', NULL, NULL, NULL, 1, NULL, 1, 'Cash', NULL, NULL, NULL, NULL, 'Thanks for your business.', 8400.00, 'percentage', 0.00, 8400.00, NULL, 0.00, 0.00, 400.00, 0.00, 8400.00, 0.00, NULL),
(2, 2, NULL, 'INV-00001', NULL, '2023-08-18', '2023-08-18', 1, NULL, 'Walkin Customer', NULL, '104012', 1, 'Cash', NULL, NULL, NULL, NULL, NULL, 1050.00, 'percentage', 0.00, 871.50, 10, NULL, 17.00, 178.50, NULL, 1050.00, 1050.00, 0.00),
(3, 2, NULL, 'INV-00002', 'Invoice', '2023-08-18', '2023-08-18', 1, NULL, NULL, NULL, NULL, 1, 'Cash', NULL, NULL, 'TaxExclusive', NULL, 'Thanks for your business.', 95.00, 'percentage', 0.00, 95.00, NULL, 0.00, NULL, 4.75, 0.00, 99.75, 0.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_type`
--

CREATE TABLE `invoice_type` (
  `InvoiceTypeID` int NOT NULL,
  `InvoiceType` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_type`
--

INSERT INTO `invoice_type` (`InvoiceTypeID`, `InvoiceType`) VALUES
(1, 'Tax Invoice'),
(2, 'Invoice'),
(3, 'Proforma Invoice');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ItemID` int NOT NULL,
  `ItemCategoryID` int DEFAULT NULL,
  `BrandID` int DEFAULT NULL,
  `WarehouseID` int DEFAULT NULL,
  `UnitID` int UNSIGNED DEFAULT NULL,
  `ItemType` varchar(55) DEFAULT NULL,
  `ItemCode` varchar(255) DEFAULT NULL,
  `ItemImage` varchar(255) DEFAULT NULL,
  `ItemName` varchar(55) DEFAULT NULL,
  `UnitName` varchar(10) DEFAULT NULL,
  `Taxable` varchar(10) DEFAULT NULL,
  `TaxMethod` int DEFAULT '1',
  `TotalQty` double DEFAULT NULL,
  `Percentage` double(8,2) DEFAULT NULL,
  `CostPrice` double(8,2) DEFAULT NULL,
  `CostChartofAccountID` int DEFAULT NULL,
  `CostDescription` varchar(255) DEFAULT NULL,
  `SellingPrice` double(8,2) DEFAULT NULL,
  `SellingChartofAccountID` int DEFAULT NULL,
  `SellingDescription` varchar(255) DEFAULT NULL,
  `IsFeatured` tinyint DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ItemID`, `ItemCategoryID`, `BrandID`, `WarehouseID`, `UnitID`, `ItemType`, `ItemCode`, `ItemImage`, `ItemName`, `UnitName`, `Taxable`, `TaxMethod`, `TotalQty`, `Percentage`, `CostPrice`, `CostChartofAccountID`, `CostDescription`, `SellingPrice`, `SellingChartofAccountID`, `SellingDescription`, `IsFeatured`, `IsActive`) VALUES
(22, 1, 5, 1, 4, 'Goods', 'RES-4567890', '1692355163.jpg', 'Mouse', NULL, 'Yes', 1, NULL, 5.00, 80.00, 110000, NULL, 100.00, 110000, NULL, 1, 1),
(23, 1, 5, 1, 4, 'Goods', '23', '1683625478.jpg', 'Key Board', NULL, 'No', 1, NULL, NULL, 5000.00, 110000, NULL, 5500.00, 110000, NULL, 1, 1),
(24, 1, 5, 1, 4, 'Goods', '24', '1683625548.jpg', 'Monitor', NULL, 'No', 1, NULL, NULL, 80.00, 110000, NULL, 80.00, 110000, NULL, 1, 1),
(25, 1, 5, 1, 4, 'Goods', '25', '1683625627.jpg', 'Camera', NULL, 'No', 1, NULL, NULL, 42.00, 110000, NULL, 36.00, 110000, NULL, 1, 1),
(26, 1, 5, 1, 1, 'Goods', '26', '1683625658.jpg', 'Hands Free', NULL, 'No', 1, NULL, NULL, 42.00, 110000, NULL, 36.00, 110000, NULL, 1, 1),
(28, NULL, NULL, NULL, 1, 'Restaurant', '789865445', '1683625774.webp', 'Chicken', NULL, 'No', 1, NULL, NULL, 80.00, 110000, NULL, 80.00, 110000, NULL, 0, 0),
(29, NULL, NULL, NULL, 3, 'Restaurant', NULL, '1683625836.webp', 'Egg', NULL, 'No', 1, NULL, NULL, 80.00, 110000, NULL, 80.00, 110000, NULL, 0, 0),
(31, NULL, 6, NULL, 1, 'Goods', '234', '1683626044.jpg', 'Dirham Perfume', NULL, 'Yes', 1, NULL, 5.00, 80.00, 110000, NULL, 80.00, 110000, NULL, 0, 1),
(32, 1, 5, NULL, 1, 'Goods', '4325', '1683626127.jpg', 'Mobile', NULL, 'Yes', 1, NULL, 5.00, 80.00, 110000, NULL, 80.00, 110000, NULL, 0, 1),
(33, 2, 6, NULL, 4, 'Goods', '24541', '1683626192.jpg', 'Maagi', NULL, 'Yes', 1, NULL, 5.00, 80900.00, 110000, NULL, 804677.00, 110000, NULL, 0, 1),
(34, 4, 6, NULL, 4, 'Goods', '1239876', '1683627674.jpg', 'Office Equipments', NULL, 'Yes', 1, NULL, NULL, 8054.00, 110000, NULL, 8054.00, 110000, NULL, 0, 1),
(35, 5, 6, NULL, 4, 'Goods', '12359734', '1683627744.jpg', 'sfghsd', NULL, 'Yes', 1, NULL, NULL, 8054.00, 110000, NULL, 9000.00, 110000, NULL, 0, 1),
(36, 1, 5, NULL, 1, 'Goods', '120937019283', '1683627252.jpg', 'Paper cutting machine', NULL, 'Yes', 1, NULL, 10000.00, 80.00, 110000, NULL, 90.00, 110000, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `ItemCategoryID` int NOT NULL,
  `ParentID` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_category`
--

INSERT INTO `item_category` (`ItemCategoryID`, `ParentID`, `title`, `image`, `type`, `IsActive`) VALUES
(1, NULL, 'Electronics', '1683618238.jpg', 'POS', 1),
(2, NULL, 'Food Items', '1683617833.png', 'POS', 1),
(4, NULL, 'Office Accessories', '1683617978.jpg', 'POS', 1),
(5, 1, 'Mobiles', '1683617777.jpg', 'POS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `JournalID` int NOT NULL,
  `VHNO` varchar(15) DEFAULT NULL,
  `JournalType` varchar(10) DEFAULT NULL,
  `ChartOfAccountID` int DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `VoucherMstID` int DEFAULT NULL,
  `PettyMstID` int DEFAULT NULL,
  `InvoiceMasterID` int DEFAULT NULL,
  `ExpenseMasterID` int DEFAULT NULL,
  `PaymentMasterID` int DEFAULT NULL,
  `PurchasePaymentMasterID` int DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Dr` double(10,2) DEFAULT NULL,
  `Cr` double(10,2) DEFAULT NULL,
  `Trace` decimal(10,0) DEFAULT NULL,
  `BankReconcile` varchar(15) DEFAULT NULL,
  `ReconcileDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journal`
--

INSERT INTO `journal` (`JournalID`, `VHNO`, `JournalType`, `ChartOfAccountID`, `PartyID`, `SupplierID`, `VoucherMstID`, `PettyMstID`, `InvoiceMasterID`, `ExpenseMasterID`, `PaymentMasterID`, `PurchasePaymentMasterID`, `Narration`, `Date`, `Dr`, `Cr`, `Trace`, `BankReconcile`, `ReconcileDate`) VALUES
(1, 'BILL-00001', NULL, 510102, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2023-08-17', 8400.00, NULL, '111', NULL, NULL),
(2, 'BILL-00001', NULL, 210100, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2023-08-17', NULL, 8400.00, '11114', NULL, NULL),
(3, 'INV-00001', NULL, 110400, 1, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, '2023-08-18', 1050.00, NULL, '123', NULL, NULL),
(4, 'INV-00001', NULL, 410100, 1, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, '2023-08-18', NULL, 1050.00, '12345', NULL, NULL),
(5, 'INV-00001', NULL, 210300, 1, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, '2023-08-18', NULL, 178.50, '12346', NULL, NULL),
(6, 'INV-00002', NULL, 110400, 1, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '2023-08-18', 99.75, NULL, '123', NULL, NULL),
(7, 'INV-00002', NULL, 410100, 1, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '2023-08-18', NULL, 95.00, '12345', NULL, NULL),
(8, 'INV-00002', NULL, 210300, 1, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, '2023-08-18', NULL, 4.75, '12346', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_10_10_143303_create_attendances_table', 1),
(2, '2023_02_25_095423_create_units_table', 2),
(3, '2023_02_25_110407_create_dishes_table', 3),
(4, '2023_02_27_101155_add_unit_id_to_item', 4),
(5, '2023_02_26_110251_create_dish_recipes_table', 5),
(6, '2023_02_26_105746_create_dish_types_table', 6),
(7, '2023_02_25_110937_create_dish_images_table', 7),
(8, '2023_03_02_103212_create_invoice_dish_details_table', 8),
(9, '2023_03_02_103916_add_type_to_item_category', 9),
(10, '2023_03_08_162122_add_dish_type_id_to_invoice_dish_detail', 10),
(11, '2023_03_08_162200_add_cols_to_invoice_detail', 11),
(12, '2023_03_09_091758_create_dish_tables_table', 12),
(13, '2023_03_09_091933_add_dish_table_id_to_invoice_master', 13),
(14, '2023_03_14_172529_add_quantity_to_invoice_dish_details', 14),
(15, '2023_03_21_073307_add_price_to_invoice_dish_details', 15),
(16, '2023_05_10_093958_add_supplier_id_to_pos_setting', 16),
(17, '2023_05_19_112007_add_is_super_admin_to_user', 17),
(18, '2023_05_24_182831_create_payment_with_credit_cards_table', 18),
(19, '2023_06_06_000004_create_services_table', 19),
(20, '2023_06_06_000007_create_appointments_table', 20),
(21, '2023_06_06_000011_create_appointment_service_pivot_table', 21),
(22, '2023_06_06_000012_add_relationship_fields_to_appointments_table', 22);

-- --------------------------------------------------------

--
-- Table structure for table `party`
--

CREATE TABLE `party` (
  `PartyID` int NOT NULL,
  `CustomerGroupID` int DEFAULT NULL,
  `PartyName` text,
  `TRN` varchar(150) DEFAULT '',
  `Address` varchar(75) DEFAULT NULL,
  `City` varchar(175) DEFAULT NULL,
  `Mobile` varchar(150) DEFAULT NULL,
  `Phone` varchar(25) DEFAULT NULL,
  `Email` varchar(25) DEFAULT NULL,
  `Website` varchar(150) DEFAULT NULL,
  `Deposit` double DEFAULT NULL,
  `Expense` double DEFAULT NULL,
  `Active` varchar(3) DEFAULT NULL,
  `InvoiceDueDays` int DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `party`
--

INSERT INTO `party` (`PartyID`, `CustomerGroupID`, `PartyName`, `TRN`, `Address`, `City`, `Mobile`, `Phone`, `Email`, `Website`, `Deposit`, `Expense`, `Active`, `InvoiceDueDays`, `eDate`) VALUES
(1, NULL, 'Walkin Customer', '1234', '000000', NULL, '0000', '00000', '00000', '0000', NULL, NULL, 'Yes', 0, '2022-07-08 04:12:14');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `paymentID` bigint UNSIGNED NOT NULL,
  `PaymentReference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `InvoiceMasterID` int NOT NULL,
  `PartyID` int NOT NULL DEFAULT '0',
  `UserID` int NOT NULL,
  `Amount` double(8,2) NOT NULL,
  `Change` double(8,2) NOT NULL,
  `PayingMethod` enum('Cash','Gift Card','Credit Card','Card','Paypal','Deposit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cash',
  `PaymentNote` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`paymentID`, `PaymentReference`, `InvoiceMasterID`, `PartyID`, `UserID`, `Amount`, `Change`, `PayingMethod`, `PaymentNote`, `created_at`, `updated_at`) VALUES
(1, 'spr-20230818-104012', 2, 1, 1, 1050.00, 0.00, 'Cash', NULL, '2023-08-18 05:40:12', '2023-08-18 05:40:12');

-- --------------------------------------------------------

--
-- Table structure for table `payment_detail`
--

CREATE TABLE `payment_detail` (
  `PaymentDetailID` int NOT NULL,
  `PaymentMasterID` int DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `InvoiceMasterID` int DEFAULT NULL,
  `Payment` double(8,2) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_master`
--

CREATE TABLE `payment_master` (
  `PaymentMasterID` int NOT NULL,
  `PartyID` int DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `PaymentAmount` double(8,2) DEFAULT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL,
  `ChartOfAccountID` int DEFAULT NULL,
  `ReferenceNo` varchar(35) DEFAULT NULL,
  `File` varchar(35) DEFAULT NULL,
  `Notes` longtext,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_mode`
--

CREATE TABLE `payment_mode` (
  `ID` int NOT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_mode`
--

INSERT INTO `payment_mode` (`ID`, `PaymentMode`) VALUES
(1, 'Cash'),
(2, 'Bank Transfer'),
(3, 'Cheque'),
(4, 'Credit Card');

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_credit_cards`
--

CREATE TABLE `payment_with_credit_cards` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `customer_stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_with_credit_cards`
--

INSERT INTO `payment_with_credit_cards` (`id`, `payment_id`, `customer_id`, `customer_stripe_id`, `charge_id`, `created_at`, `updated_at`) VALUES
(1, 51, 1, 'cus_NxuDmudlrZ02sU', 'ch_3NByPJLdjSKBfaKw1UuVA0Wp', '2023-05-26 06:02:06', '2023-05-26 06:02:06'),
(2, 53, 1, 'cus_NxuDmudlrZ02sU', 'ch_3NByQuLdjSKBfaKw3xuHCGJs', '2023-05-26 06:03:44', '2023-05-26 06:03:44');

-- --------------------------------------------------------

--
-- Table structure for table `pettycash_detail`
--

CREATE TABLE `pettycash_detail` (
  `PettyDetID` int NOT NULL,
  `PettyMstID` int DEFAULT NULL,
  `PettyVoucher` varchar(12) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `ChOfAcc` int DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `Invoice` varchar(35) DEFAULT NULL,
  `RefNo` varchar(35) DEFAULT NULL,
  `Debit` double(10,2) DEFAULT NULL,
  `FromChOfAcc` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pettycash_detail`
--

INSERT INTO `pettycash_detail` (`PettyDetID`, `PettyMstID`, `PettyVoucher`, `SupplierID`, `Date`, `ChOfAcc`, `Narration`, `Invoice`, `RefNo`, `Debit`, `FromChOfAcc`) VALUES
(1, 1, 'PC23050001', NULL, '2023-05-05', 110100, 'abc', '598', '9595', 1550.00, 110100);

--
-- Triggers `pettycash_detail`
--
DELIMITER $$
CREATE TRIGGER `delete` AFTER DELETE ON `pettycash_detail` FOR EACH ROW begin
delete from journal where PettyMstID = old.PettyMstID;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `journal` AFTER INSERT ON `pettycash_detail` FOR EACH ROW begin
declare chart_name varchar(25);
select ChartOfAccountName into chart_name from chartofaccount where ChartOfAccountID=new.ChOfAcc;

INSERT INTO journal (VHNO,JournalType,ChartOfAccountID,PettyMstID,Narration,Date,Cr)
values (new.PettyVoucher,SUBSTRING(new.PettyVoucher,1,2),new.FromChOfAcc,new.PettyMstID,concat(new.Narration,' (', chart_name,') '),new.Date,new.Debit);


INSERT INTO journal (VHNO,JournalType,ChartOfAccountID,PettyMstID,Narration,Date,Dr)
values (new.PettyVoucher,SUBSTRING(new.PettyVoucher,1,2),new.ChOfAcc,new.PettyMstID,new.Narration,new.Date,new.Debit);


end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pettycash_master`
--

CREATE TABLE `pettycash_master` (
  `PettyMstID` int NOT NULL,
  `PettyVoucher` varchar(11) DEFAULT NULL,
  `ChOfAcc` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `Credit` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pettycash_master`
--

INSERT INTO `pettycash_master` (`PettyMstID`, `PettyVoucher`, `ChOfAcc`, `Date`, `Narration`, `Credit`) VALUES
(1, 'PC23050001', 110100, '2023-05-05', NULL, 1550.00);

-- --------------------------------------------------------

--
-- Table structure for table `pos_setting`
--

CREATE TABLE `pos_setting` (
  `id` int NOT NULL,
  `customer_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `biller_id` int NOT NULL,
  `product_number` int NOT NULL,
  `keybord_active` tinyint(1) NOT NULL,
  `stripe_public_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_dish_enabled` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_setting`
--

INSERT INTO `pos_setting` (`id`, `customer_id`, `warehouse_id`, `supplier_id`, `biller_id`, `product_number`, `keybord_active`, `stripe_public_key`, `stripe_secret_key`, `is_dish_enabled`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 1, 3, 0, 'pk_test_51KgiuzLdjSKBfaKwALCThydAYYTInVkIZwQ6rMx1QyDFfgaQ5vXKgkqhsjufiuKbIr9979eYLBB7HLblYbebUCkl00oxNiXJKM', 'sk_test_51KgiuzLdjSKBfaKw4Eyj3zIhm3WqFgJegPKcvv2oYgWd34VHXD3Kosrr8QGDNVp3xTTOdZukNwKAi9Y2xuy8T0ei00GuvP6HeS', 0, '2018-09-02 03:17:04', '2023-08-18 05:39:57');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_symbology` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` int NOT NULL,
  `unit_id` int NOT NULL,
  `purchase_unit_id` int NOT NULL,
  `sale_unit_id` int NOT NULL,
  `cost` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `promotion` tinyint DEFAULT NULL,
  `promotion_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_date` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `tax_id` int DEFAULT NULL,
  `tax_method` int DEFAULT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_variant` tinyint(1) DEFAULT NULL,
  `is_batch` tinyint(1) DEFAULT NULL,
  `is_diffPrice` tinyint(1) DEFAULT NULL,
  `featured` tinyint DEFAULT NULL,
  `product_list` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_list` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_list` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_batches`
--

CREATE TABLE `product_batches` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `batch_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_date` date NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `position` int NOT NULL,
  `item_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_warehouse`
--

CREATE TABLE `product_warehouse` (
  `id` int UNSIGNED NOT NULL,
  `product_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `warehouse_id` int NOT NULL,
  `qty` double NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchasepayment_detail`
--

CREATE TABLE `purchasepayment_detail` (
  `PurchasePaymentDetailID` int NOT NULL,
  `PurchasePaymentMasterID` int DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `InvoiceMasterID` int DEFAULT NULL,
  `Payment` double(8,2) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchasepayment_master`
--

CREATE TABLE `purchasepayment_master` (
  `PurchasePaymentMasterID` int NOT NULL,
  `SupplierID` int DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `PaymentAmount` double(8,2) DEFAULT NULL,
  `PaymentMode` varchar(25) DEFAULT NULL,
  `ChartOfAccountID` int DEFAULT NULL,
  `ReferenceNo` varchar(35) DEFAULT NULL,
  `File` varchar(35) DEFAULT NULL,
  `Notes` longtext,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_detail`
--

CREATE TABLE `purchase_order_detail` (
  `PurchaseOrderDetailID` int NOT NULL,
  `PurchaseOrderMasterID` int NOT NULL,
  `Date` date DEFAULT NULL,
  `ItemID` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Rate` double(8,2) DEFAULT NULL,
  `Qty` varchar(10) DEFAULT NULL,
  `Unit` varchar(10) DEFAULT NULL,
  `DiscountPer` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `TaxPer` double(8,2) DEFAULT NULL,
  `Amount` double(8,2) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_master`
--

CREATE TABLE `purchase_order_master` (
  `PurchaseOrderMasterID` int NOT NULL,
  `PON` varchar(10) DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `ReferenceNo` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `PONotes` varchar(255) DEFAULT NULL,
  `DeliveryNotes` longtext,
  `UserID` int DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `DiscountPer` double(8,2) DEFAULT NULL,
  `Discount` double(8,2) DEFAULT NULL,
  `Tax` double(8,2) DEFAULT NULL,
  `SubTotal` double(8,2) DEFAULT NULL,
  `GrandTotal` double(8,2) DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `RoleID` int NOT NULL,
  `Table` varchar(55) DEFAULT NULL,
  `Action` varchar(55) DEFAULT NULL,
  `Allow` varchar(1) DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`RoleID`, `Table`, `Action`, `Allow`) VALUES
(1, 'Invoice', 'List', 'Y'),
(12, 'Invoice', 'Create', 'Y'),
(13, 'Invoice', 'Update', 'Y'),
(14, 'Invoice', 'Delete', 'Y'),
(15, 'Invoice', 'View', 'Y'),
(16, 'Invoice', 'PDF', 'Y'),
(63, 'Voucher', 'List', 'Y'),
(64, 'Voucher', 'Create', 'Y'),
(65, 'Voucher', 'Update', 'Y'),
(66, 'Voucher', 'Delete', 'Y'),
(67, 'Voucher', 'View', 'Y'),
(68, 'Petty Cash', 'List', 'Y'),
(69, 'Petty Cash', 'Create', 'Y'),
(70, 'Petty Cash', 'Update', 'Y'),
(71, 'Petty Cash', 'Delete', 'Y'),
(72, 'Petty Cash', 'View', 'Y'),
(73, 'Adjustment Balance', 'Create', 'Y'),
(74, 'Chart of Account', 'List / Create', 'Y'),
(75, 'Chart of Account', 'Update', 'Y'),
(76, 'Chart of Account', 'Delete', 'Y'),
(77, 'Item/Inventory', 'List / Create', 'Y'),
(78, 'Item/Inventory', 'Update', 'Y'),
(79, 'Item/Inventory', 'Delete', 'Y'),
(80, 'Party / Customers', 'List / Create', 'Y'),
(81, 'Party / Customers', 'Update', 'Y'),
(82, 'Party / Customers', 'Delete', 'Y'),
(83, 'Supplier', 'List / Create', 'Y'),
(84, 'Supplier', 'Update', 'Y'),
(85, 'Supplier', 'Delete', 'Y'),
(86, 'User', 'List / Create', 'Y'),
(87, 'User', 'Update', 'Y'),
(88, 'User', 'Delete', 'Y'),
(89, 'User Rights', 'Assign', 'Y'),
(90, 'Party Ledger', 'View', 'Y'),
(91, 'Party Ledger', 'PDF', 'Y'),
(92, 'Party Balance', 'View', 'Y'),
(93, 'Party Balance', 'PDF', 'Y'),
(94, 'Yearly Report', 'View', 'Y'),
(95, 'Yearly Report', 'PDF', 'Y'),
(96, 'Ageing Report', 'View', 'Y'),
(97, 'Ageing Report', 'PDF', 'Y'),
(98, 'Party Analysis', 'View', 'Y'),
(99, 'Party Analysis', 'PDF', 'Y'),
(100, 'Party List', 'View', 'Y'),
(101, 'Party List', 'PDF', 'Y'),
(102, 'Outstanding Invoices', 'View', 'Y'),
(103, 'Outstanding Invoices', 'PDF', 'Y'),
(104, 'Supplier Ledger', 'View', 'Y'),
(105, 'Supplier Ledger', 'PDF', 'Y'),
(106, 'Supplier Balance', 'View', 'Y'),
(107, 'Supplier Balance', 'PDF', 'Y'),
(108, 'Sale Invoice', 'View', 'Y'),
(109, 'Sale Invoice', 'PDF', 'Y'),
(110, 'Ticket Register', 'View', 'Y'),
(111, 'Ticket Register', 'PDF', 'Y'),
(112, 'Airline Summary', 'View', 'Y'),
(113, 'Airline Summary', 'PDF', 'Y'),
(114, 'Sale Man Report', 'View', 'Y'),
(115, 'Sale Man Report', 'PDF', 'Y'),
(116, 'Tax Report', 'View', 'Y'),
(117, 'Tax Report', 'PDF', 'Y'),
(118, 'Sales Report', 'View', 'Y'),
(119, 'Sales Report', 'PDF', 'Y'),
(120, 'Voucher Report', 'View', 'Y'),
(121, 'Voucher Report', 'PDF', 'Y'),
(122, 'Cash Book', 'View', 'Y'),
(123, 'Cash Book', 'PDF', 'Y'),
(124, 'Day Book', 'View', 'Y'),
(125, 'Day Book', 'PDF', 'Y'),
(126, 'General Ledger', 'View', 'Y'),
(127, 'General Ledger', 'PDF', 'Y'),
(128, 'Trial Balance', 'View', 'Y'),
(129, 'Trial Balance', 'PDF', 'Y'),
(130, 'Trial with Activity', 'View', 'Y'),
(131, 'Trial with Activity', 'PDF', 'Y'),
(132, 'Yearly Summary', 'View', 'Y'),
(133, 'Yearly Summary', 'PDF', 'Y'),
(134, 'Profit & Loss ', 'View', 'Y'),
(135, 'Profit & Loss ', 'PDF', 'Y'),
(136, 'Balance Sheet', 'View', 'Y'),
(137, 'Balance Sheet', 'PDF', 'Y'),
(138, 'Invoice Summary', 'View', 'Y'),
(139, 'Invoice Summary', 'PDF', 'Y'),
(140, 'Party Wise Sale', 'View', 'Y'),
(141, 'Party Wise Sale', 'PDF', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `runtotaltestdata`
--

CREATE TABLE `runtotaltestdata` (
  `id` int NOT NULL,
  `value` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `runtotaltestdata`
--

INSERT INTO `runtotaltestdata` (`id`, `value`) VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 7),
(5, 9),
(6, 12),
(7, 13),
(8, 16),
(9, 22),
(10, 42),
(11, 57),
(12, 58),
(13, 59),
(14, 60);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int UNSIGNED NOT NULL,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `cash_register_id` int DEFAULT NULL,
  `customer_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `biller_id` int DEFAULT NULL,
  `item` int NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `extra_tax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `coupon_id` int DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `daraz_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_status` int NOT NULL,
  `payment_status` int NOT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `staff_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

CREATE TABLE `salesman` (
  `SalesmanID` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salesman`
--

INSERT INTO `salesman` (`SalesmanID`, `name`, `contact`, `email`, `CreatedDate`, `UpdatedDate`) VALUES
(1, 'Ahmad', '123456', 'ahmad@email.com', '2022-12-16 05:48:03', '2022-12-16 05:48:03'),
(2, 'Ali', '3232223', 'ali@email.com', '2022-12-16 05:48:03', '2022-12-16 05:48:03');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'MANICURE - 1', '62.00', '2023-06-06 11:11:51', '2023-06-06 11:11:51', NULL),
(2, 'PEDICURE - 1', '32.00', '2023-06-06 11:11:51', '2023-06-06 11:11:51', NULL),
(3, 'FOOT SPA - 1', '61.00', '2023-06-06 11:11:51', '2023-06-06 11:11:51', NULL),
(4, 'FOOT MASK - 1', '60.00', '2023-06-06 11:11:51', '2023-06-06 11:11:51', NULL),
(5, 'POLISH - 1', '94.00', '2023-06-06 11:11:51', '2023-06-06 11:11:51', NULL),
(6, 'HAND SPA -', '40.00', '2023-06-06 11:11:51', '2023-06-06 11:11:51', NULL),
(7, 'NAIL HAND POLISH - 1', '78.00', '2023-06-06 11:11:51', '2023-06-06 11:11:51', NULL),
(8, 'NAIL FOOT POLISH - 1', '60.00', '2023-06-06 11:11:51', '2023-06-06 11:11:51', NULL),
(9, 'EYEBROW THREADING - 1', '13.00', '2023-06-06 11:11:51', '2023-06-06 11:11:51', NULL),
(10, 'UPPER LIP THREADING - 1', '60.00', '2023-06-06 11:11:51', '2023-06-06 11:11:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sticker`
--

CREATE TABLE `sticker` (
  `stickerid` int NOT NULL,
  `itemid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `edate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` int NOT NULL,
  `SupplierName` varchar(150) DEFAULT NULL,
  `TRN` varchar(75) DEFAULT NULL COMMENT 'tax regsitration no',
  `Address` varchar(75) DEFAULT NULL,
  `Mobile` varchar(150) DEFAULT NULL,
  `Phone` varchar(150) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Website` varchar(150) DEFAULT NULL,
  `Active` varchar(3) DEFAULT NULL,
  `InvoiceDueDays` int DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `SupplierName`, `TRN`, `Address`, `Mobile`, `Phone`, `Email`, `Website`, `Active`, `InvoiceDueDays`, `eDate`) VALUES
(1, 'Walkin Supplier', NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', NULL, '2022-07-20 18:35:02');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_category`
--

CREATE TABLE `supplier_category` (
  `SupplierCatID` int NOT NULL,
  `SupplierCode` varchar(10) DEFAULT NULL,
  `SupplierCategory` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_category`
--

INSERT INTO `supplier_category` (`SupplierCatID`, `SupplierCode`, `SupplierCategory`) VALUES
(1, 'C', 'Customer'),
(2, 'VC', 'Airline Customer'),
(3, 'EC', 'Employee'),
(4, 'X', 'Discontinued'),
(5, 'XC', 'Bad Debds'),
(6, 'VS', 'Supplier'),
(7, 'BC', 'Old Bad Debts');

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `TaxID` int NOT NULL,
  `TaxPer` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Section` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`TaxID`, `TaxPer`, `Description`, `Section`) VALUES
(1, '0', '[0%] Tax ', 'Invoice'),
(2, '5', '[4.76%] Tax', 'Invoice'),
(3, '0', '[0%] Tax ', 'Estimate'),
(4, '4.76', '[5%] Tax', 'Estimate');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Inclusive', 17, 1, '2021-09-02 19:15:07', '2021-09-02 19:15:07'),
(2, 'Exclusive', 17, 1, '2021-09-02 19:15:34', '2021-09-02 19:15:34');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `UnitID` int NOT NULL,
  `UnitName` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`UnitID`, `UnitName`) VALUES
(1, 'box'),
(2, 'cm'),
(3, 'dz'),
(4, 'ft'),
(5, 'g'),
(6, 'in'),
(7, 'kg'),
(8, 'km'),
(9, 'lb'),
(10, 'mg'),
(11, 'm'),
(12, 'pcs');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `base_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `base_unit`, `child_unit`, `unit_value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'KG', 'Gram', '1000', '1', '2023-02-27 10:48:22', '2023-02-27 10:48:22'),
(2, 'Darzon', 'Quter', '3', '1', '2023-02-28 09:46:46', '2023-02-28 09:46:46'),
(3, 'Doz', 'Item', '12', '1', '2023-03-20 06:55:20', '2023-03-20 06:55:20'),
(4, 'PCs', 'PCs', '1', '1', '2023-04-18 12:25:53', '2023-04-18 12:25:53');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int NOT NULL,
  `FullName` varchar(55) DEFAULT NULL,
  `Email` varchar(55) DEFAULT NULL,
  `Password` varchar(75) DEFAULT NULL,
  `UserType` varchar(25) DEFAULT NULL,
  `Address` text,
  `Mobile` varchar(255) DEFAULT NULL,
  `WarehouseID` int DEFAULT NULL,
  `eDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Active` varchar(5) DEFAULT 'N',
  `isSuperAdmin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `FullName`, `Email`, `Password`, `UserType`, `Address`, `Mobile`, `WarehouseID`, `eDate`, `Active`, `isSuperAdmin`) VALUES
(1, 'Extensive Accounting', 'demo@extbooks.com', '123456', 'Admin', 'adress', '44564545645', 1, '2023-05-12 11:41:46', 'Yes', 0),
(14, 'Biller Staff', 'biller1@gmail.com', '123456', 'Biller', NULL, NULL, NULL, '2023-05-06 11:52:46', 'Yes', 0),
(15, 'Farhan Ahmad', 'admin', 'Eis@2021', 'Admin', NULL, NULL, NULL, '2023-05-05 10:59:04', 'Yes', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `address` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `RoleId` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `Table` varchar(55) DEFAULT NULL,
  `Action` varchar(55) DEFAULT NULL,
  `Allow` varchar(10) DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`RoleId`, `UserID`, `Table`, `Action`, `Allow`) VALUES
(4471, 1, 'Invoice', 'List', 'Y'),
(4472, 1, 'Invoice', 'Create', 'Y'),
(4473, 1, 'Invoice', 'Update', 'Y'),
(4474, 1, 'Invoice', 'Delete', 'Y'),
(4475, 1, 'Invoice', 'View', 'Y'),
(4476, 1, 'Invoice', 'PDF', 'Y'),
(4477, 1, 'Voucher', 'List', 'Y'),
(4478, 1, 'Voucher', 'Create', 'Y'),
(4479, 1, 'Voucher', 'Update', 'Y'),
(4480, 1, 'Voucher', 'Delete', 'Y'),
(4481, 1, 'Voucher', 'View', 'Y'),
(4482, 1, 'Petty Cash', 'List', 'Y'),
(4483, 1, 'Petty Cash', 'Create', 'Y'),
(4484, 1, 'Petty Cash', 'Update', 'Y'),
(4485, 1, 'Petty Cash', 'Delete', 'Y'),
(4486, 1, 'Petty Cash', 'View', 'Y'),
(4487, 1, 'Adjustment Balance', 'Create', 'Y'),
(4488, 1, 'Chart of Account', 'List / Create', 'Y'),
(4489, 1, 'Chart of Account', 'Update', 'Y'),
(4490, 1, 'Chart of Account', 'Delete', 'Y'),
(4491, 1, 'Item/Inventory', 'List / Create', 'Y'),
(4492, 1, 'Item/Inventory', 'Update', 'Y'),
(4493, 1, 'Item/Inventory', 'Delete', 'Y'),
(4494, 1, 'Party / Customers', 'List / Create', 'Y'),
(4495, 1, 'Party / Customers', 'Update', 'Y'),
(4496, 1, 'Party / Customers', 'Delete', 'Y'),
(4497, 1, 'Supplier', 'List / Create', 'Y'),
(4498, 1, 'Supplier', 'Update', 'Y'),
(4499, 1, 'Supplier', 'Delete', 'Y'),
(4500, 1, 'User', 'List / Create', 'Y'),
(4501, 1, 'User', 'Update', 'Y'),
(4502, 1, 'User', 'Delete', 'Y'),
(4503, 1, 'User Rights', 'Assign', 'Y'),
(4504, 1, 'Party Ledger', 'View', 'Y'),
(4505, 1, 'Party Ledger', 'PDF', 'Y'),
(4506, 1, 'Party Balance', 'View', 'Y'),
(4507, 1, 'Party Balance', 'PDF', 'Y'),
(4508, 1, 'Yearly Report', 'View', 'Y'),
(4509, 1, 'Yearly Report', 'PDF', 'Y'),
(4510, 1, 'Ageing Report', 'View', 'Y'),
(4511, 1, 'Ageing Report', 'PDF', 'Y'),
(4512, 1, 'Party Analysis', 'View', 'Y'),
(4513, 1, 'Party Analysis', 'PDF', 'Y'),
(4514, 1, 'Party List', 'View', 'Y'),
(4515, 1, 'Party List', 'PDF', 'Y'),
(4516, 1, 'Outstanding Invoices', 'View', 'Y'),
(4517, 1, 'Outstanding Invoices', 'PDF', 'Y'),
(4518, 1, 'Supplier Ledger', 'View', 'Y'),
(4519, 1, 'Supplier Ledger', 'PDF', 'Y'),
(4520, 1, 'Supplier Balance', 'View', 'Y'),
(4521, 1, 'Supplier Balance', 'PDF', 'Y'),
(4522, 1, 'Sale Invoice', 'View', 'Y'),
(4523, 1, 'Sale Invoice', 'PDF', 'Y'),
(4524, 1, 'Ticket Register', 'View', 'Y'),
(4525, 1, 'Ticket Register', 'PDF', 'Y'),
(4526, 1, 'Airline Summary', 'View', 'Y'),
(4527, 1, 'Airline Summary', 'PDF', 'Y'),
(4528, 1, 'Sale Man Report', 'View', 'Y'),
(4529, 1, 'Sale Man Report', 'PDF', 'Y'),
(4530, 1, 'Tax Report', 'View', 'Y'),
(4531, 1, 'Tax Report', 'PDF', 'Y'),
(4532, 1, 'Sales Report', 'View', 'Y'),
(4533, 1, 'Sales Report', 'PDF', 'Y'),
(4534, 1, 'Voucher Report', 'View', 'Y'),
(4535, 1, 'Voucher Report', 'PDF', 'Y'),
(4536, 1, 'Cash Book', 'View', 'Y'),
(4537, 1, 'Cash Book', 'PDF', 'Y'),
(4538, 1, 'Day Book', 'View', 'Y'),
(4539, 1, 'Day Book', 'PDF', 'Y'),
(4540, 1, 'General Ledger', 'View', 'Y'),
(4541, 1, 'General Ledger', 'PDF', 'Y'),
(4542, 1, 'Trial Balance', 'View', 'Y'),
(4543, 1, 'Trial Balance', 'PDF', 'Y'),
(4544, 1, 'Trial with Activity', 'View', 'Y'),
(4545, 1, 'Trial with Activity', 'PDF', 'Y'),
(4546, 1, 'Yearly Summary', 'View', 'Y'),
(4547, 1, 'Yearly Summary', 'PDF', 'Y'),
(4548, 1, 'Profit & Loss', 'View', 'Y'),
(4549, 1, 'Profit & Loss', 'PDF', 'Y'),
(4550, 1, 'Balance Sheet', 'View', 'Y'),
(4551, 1, 'Balance Sheet', 'PDF', 'Y'),
(4552, 1, 'Invoice Summary', 'View', 'Y'),
(4553, 1, 'Invoice Summary', 'PDF', 'Y'),
(4554, 1, 'Party Wise Sale', 'View', 'Y'),
(4555, 1, 'Party Wise Sale', 'PDF', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_detail`
--

CREATE TABLE `voucher_detail` (
  `VoucherDetID` int NOT NULL,
  `VoucherMstID` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Voucher` varchar(15) DEFAULT NULL,
  `ChOfAcc` int DEFAULT NULL,
  `PartyID` int DEFAULT NULL,
  `SupplierID` int DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `InvoiceNo` varchar(75) DEFAULT NULL,
  `RefNo` varchar(75) DEFAULT NULL,
  `Debit` double(10,2) DEFAULT NULL,
  `Credit` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `voucher_detail`
--
DELIMITER $$
CREATE TRIGGER `beforeinsert` AFTER INSERT ON `voucher_detail` FOR EACH ROW begin
 
INSERT INTO journal (VHNO,JournalType,ChartOfAccountID,SupplierID,VoucherMstID,Narration,Date,Dr,Cr,PartyID) 
values (new.Voucher,SUBSTRING(new.Voucher,1,2),new.ChOfAcc,new.SupplierID,new.VoucherMstID,new.Narration,new.Date,new.Debit,new.Credit,new.PartyID);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_master`
--

CREATE TABLE `voucher_master` (
  `VoucherMstID` int NOT NULL,
  `VoucherCodeID` int DEFAULT NULL,
  `Voucher` varchar(15) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_type`
--

CREATE TABLE `voucher_type` (
  `VoucherTypeID` int NOT NULL,
  `VoucherCode` varchar(35) DEFAULT NULL,
  `VoucherTypeName` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_type`
--

INSERT INTO `voucher_type` (`VoucherTypeID`, `VoucherCode`, `VoucherTypeName`) VALUES
(1, 'BP', 'BANK PAYMENT'),
(2, 'BR', 'BANK RECEIPT'),
(3, 'CN', 'CREDIT NOTE'),
(4, 'CP', 'CASH PAYMENT'),
(5, 'CR', 'CASH RECEIPT'),
(6, 'DN', 'DEBIT NOTES'),
(7, 'JV', 'JOURNAL VOUCHER'),
(8, 'CC', 'CREDIT CARD');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_cashflow`
-- (See below for the actual view)
--
CREATE TABLE `v_cashflow` (
`Balance` double(22,2)
,`Cr` double(19,2)
,`Dr` double(19,2)
,`MonthName` varchar(37)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_challan_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_challan_detail` (
`ChallanDate` date
,`ChallanDetailID` int
,`ChallanMasterID` int
,`ChallanNo` varchar(10)
,`Description` varchar(255)
,`Discount` double(8,2)
,`ItemCode` varchar(255)
,`ItemID` int
,`ItemName` varchar(55)
,`ItemType` varchar(55)
,`Qty` int
,`Rate` double(8,2)
,`TaxAmount` double(8,2)
,`TaxPer` double(8,2)
,`Total` double(8,2)
,`UnitName` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_challan_master`
-- (See below for the actual view)
--
CREATE TABLE `v_challan_master` (
`Active` varchar(3)
,`Address` varchar(75)
,`ChallanDate` varchar(10)
,`ChallanMasterID` int
,`ChallanNo` varchar(10)
,`ChallanType` varchar(25)
,`CustomerNotes` varchar(255)
,`DescriptionNotes` varchar(255)
,`DiscountAmount` double(8,2)
,`DiscountPer` double(8,2)
,`eDate` timestamp
,`Email` varchar(25)
,`File` varchar(75)
,`GrandTotal` double(8,2)
,`InvoiceDueDays` int
,`Mobile` varchar(150)
,`PartyID` int
,`PartyName` text
,`Phone` varchar(25)
,`PlaceOfSupply` varchar(25)
,`ReferenceNo` varchar(25)
,`Shipping` double(8,2)
,`Subject` varchar(255)
,`SubTotal` double(8,2)
,`Tax` double(8,2)
,`TaxPer` double(8,2)
,`TermAndCondition` varchar(255)
,`Total` double(8,2)
,`TRN` varchar(150)
,`WalkinCustomerName` varchar(75)
,`Website` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_chartofaccount`
-- (See below for the actual view)
--
CREATE TABLE `v_chartofaccount` (
`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`CODE` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_chartofaccount_mini`
-- (See below for the actual view)
--
CREATE TABLE `v_chartofaccount_mini` (
`Category` varchar(55)
,`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`CODE` varchar(15)
,`L1` int
,`L2` int
,`L3` int
,`OpenCredit` int
,`OpenDebit` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_delivery_challan`
-- (See below for the actual view)
--
CREATE TABLE `v_delivery_challan` (
`Active` varchar(3)
,`Address` varchar(75)
,`Balance` double(8,2)
,`ChallanDate` date
,`ChallanMasterID` int
,`ChallanNo` varchar(10)
,`ChallanType` varchar(25)
,`CustomerNotes` varchar(255)
,`DescriptionNotes` varchar(255)
,`DiscountAmount` double(8,2)
,`DiscountPer` double(8,2)
,`eDate` timestamp
,`Email` varchar(25)
,`File` varchar(75)
,`GrandTotal` double(8,2)
,`InvoiceDueDays` int
,`Mobile` varchar(150)
,`Paid` double(8,2)
,`PartyID` int
,`PartyName` text
,`Phone` varchar(25)
,`PlaceOfSupply` varchar(25)
,`ReferenceNo` varchar(25)
,`Shipping` double(8,2)
,`Subject` varchar(255)
,`SubTotal` double(8,2)
,`Tax` double(8,2)
,`TaxPer` double(8,2)
,`TermAndCondition` varchar(255)
,`Total` double(8,2)
,`TRN` varchar(150)
,`UserID` int
,`WalkinCustomerName` varchar(75)
,`Website` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_estimate_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_estimate_detail` (
`Description` varchar(255)
,`EstimateDate` date
,`EstimateDetailID` int
,`EstimateMasterID` int
,`EstimateNo` varchar(10)
,`ItemID` int
,`ItemName` varchar(55)
,`Qty` int
,`Rate` double(8,2)
,`Tax` double(8,2)
,`TaxPer` double(8,2)
,`Total` double(8,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_estimate_master`
-- (See below for the actual view)
--
CREATE TABLE `v_estimate_master` (
`Active` varchar(3)
,`Address` varchar(75)
,`CustomerNotes` varchar(255)
,`Date` date
,`DescriptionNotes` varchar(255)
,`Discount` double(8,2)
,`DiscountPer` double(8,2)
,`eDate` timestamp
,`Email` varchar(25)
,`EstimateDate` date
,`EstimateMasterID` int
,`EstimateNo` varchar(10)
,`ExpiryDate` date
,`File` varchar(75)
,`GrandTotal` double(8,2)
,`InvoiceDueDays` int
,`Mobile` varchar(150)
,`PartyID` int
,`PartyName` text
,`Phone` varchar(25)
,`PlaceOfSupply` varchar(25)
,`ReferenceNo` varchar(25)
,`Shipping` double(8,2)
,`Subject` varchar(255)
,`SubTotal` double(8,2)
,`Tax` double(8,2)
,`TaxPer` double(8,2)
,`TermAndCondition` varchar(255)
,`Total` double(8,2)
,`TRN` varchar(150)
,`UserID` int
,`WalkinCustomerName` varchar(55)
,`Website` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_expense`
-- (See below for the actual view)
--
CREATE TABLE `v_expense` (
`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`Date` date
,`Date1` varchar(10)
,`ExpenseMasterID` int
,`ExpenseNo` varchar(55)
,`GrantTotal` double(8,2)
,`ReferenceNo` varchar(55)
,`SupplierID` int
,`SupplierName` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_expense_chart`
-- (See below for the actual view)
--
CREATE TABLE `v_expense_chart` (
`Balance` double(22,2)
,`ChartOfAccountName` varchar(75)
,`MonthName` varchar(69)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_expense_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_expense_detail` (
`Amount` double(8,2)
,`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`Date` date
,`ExpenseDetailID` int
,`ExpenseMasterID` int
,`ExpenseNo` varchar(55)
,`Notes` varchar(255)
,`Tax` double(8,2)
,`TaxPer` double(8,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_expense_master`
-- (See below for the actual view)
--
CREATE TABLE `v_expense_master` (
`ChartOfAccountName` varchar(75)
,`Date` date
,`ExpenseNo` varchar(55)
,`GrantTotal` double(8,2)
,`ReferenceNo` varchar(55)
,`SupplierName` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_income_exp_chart`
-- (See below for the actual view)
--
CREATE TABLE `v_income_exp_chart` (
`Balance` double(22,2)
,`Cr` double(19,2)
,`Dr` double(19,2)
,`MonthName` varchar(37)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_inentory_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_inentory_detail` (
`Date` date
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`ItemID` int
,`ItemName` varchar(55)
,`QtyIn` bigint
,`QtyOut` bigint
,`SaleReturn` bigint
,`UnitName` varchar(10)
,`WarehouseID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_inventory`
-- (See below for the actual view)
--
CREATE TABLE `v_inventory` (
`Balance` decimal(34,0)
,`ItemID` int
,`ItemName` varchar(55)
,`POSOut` decimal(32,0)
,`QtyIn` decimal(32,0)
,`QtyOut` decimal(32,0)
,`SaleReturn` decimal(32,0)
,`UnitName` varchar(10)
,`WarehouseID` int
,`WarehouseName` varchar(191)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_inventory_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_inventory_detail` (
`Date` date
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`ItemID` int
,`ItemName` varchar(55)
,`QtyIn` bigint
,`QtyOut` bigint
,`SaleReturn` bigint
,`UnitName` varchar(10)
,`WarehouseID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_bal`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_bal` (
`due` double(22,2)
,`INVOICE` double(19,2)
,`InvoiceMasterID` int
,`PAID` double(19,2)
,`PartyID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_balance` (
`BALANCE` double(19,2)
,`Date` date
,`DueDate` date
,`INVOICE` double(19,2)
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`PAID` double(19,2)
,`PartyID` int
,`ReferenceNo` varchar(35)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_both`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_both` (
`Active` varchar(3)
,`Address` varchar(75)
,`Balance` double(22,2)
,`CustomerNotes` varchar(255)
,`Date` date
,`DescriptionNotes` varchar(255)
,`DiscountAmount` double(10,2)
,`DiscountPer` double(10,2)
,`DueDate` date
,`eDate` timestamp
,`Email` varchar(25)
,`FullName` varchar(55)
,`GrandTotal` double(10,2)
,`InvoiceDueDays` int
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`InvoiceType` varchar(30)
,`Mobile` varchar(150)
,`Paid` double(10,2)
,`PartyID` int
,`PartyName` text
,`PaymentDetails` varchar(255)
,`PaymentMode` varchar(25)
,`Phone` varchar(25)
,`ReferenceNo` varchar(35)
,`Shipping` double(10,2)
,`Subject` varchar(255)
,`SubTotal` double(10,2)
,`SupplierID` int
,`SupplierName` varchar(150)
,`Tax` double(10,2)
,`TaxPer` double(10,2)
,`Total` double(10,2)
,`TRN` varchar(150)
,`UserID` int
,`WalkinCustomerName` varchar(155)
,`Website` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_detail` (
`Date` date
,`Description` varchar(255)
,`Discount` double(8,2)
,`DiscountAmountItem` double(10,2)
,`DiscountType` double(8,2)
,`Gross` double(8,2)
,`InvoiceDetailID` int
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`InvoiceType` varchar(30)
,`ItemCode` varchar(255)
,`ItemID` int
,`ItemName` varchar(55)
,`PartyID` int
,`PartyName` text
,`Qty` int
,`Rate` double(8,2)
,`SupplierID` int
,`Tax` double(8,2)
,`TaxPer` double(8,2)
,`Total` double(50,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_master`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_master` (
`Active` varchar(3)
,`Address` varchar(75)
,`Balance` double(22,2)
,`CustomerNotes` varchar(255)
,`Date` date
,`DescriptionNotes` varchar(255)
,`DiscountAmount` double(10,2)
,`DiscountPer` double(10,2)
,`DishTableID` int
,`DueDate` date
,`eDate` timestamp
,`Email` varchar(25)
,`FullName` varchar(55)
,`GrandTotal` double(10,2)
,`InvoiceDueDays` int
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`InvoiceType` varchar(30)
,`Mobile` varchar(150)
,`Paid` double(10,2)
,`PartyID` int
,`PartyName` text
,`PaymentDetails` varchar(255)
,`PaymentMode` varchar(25)
,`Phone` varchar(25)
,`ReferenceNo` varchar(35)
,`Shipping` double(10,2)
,`Subject` varchar(255)
,`SubTotal` double(10,2)
,`SupplierID` int
,`Tax` double(10,2)
,`TaxPer` double(10,2)
,`TaxType` varchar(55)
,`Total` double(10,2)
,`TRN` varchar(150)
,`UserID` int
,`WalkinCustomerName` varchar(155)
,`WarehouseID` int
,`WarehouseName` varchar(191)
,`Website` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_master_supplier`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_master_supplier` (
`Active` varchar(3)
,`Address` varchar(75)
,`Balance` double(10,2)
,`CustomerNotes` varchar(255)
,`Date` date
,`DescriptionNotes` varchar(255)
,`DiscountAmount` double(10,2)
,`DiscountPer` double(10,2)
,`DueDate` date
,`Email` varchar(150)
,`GrandTotal` double(10,2)
,`InvoiceDueDays` int
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`Paid` double(10,2)
,`PartyID` int
,`PaymentDetails` varchar(255)
,`PaymentMode` varchar(25)
,`Phone` varchar(150)
,`ReferenceNo` varchar(35)
,`Shipping` double(10,2)
,`Subject` varchar(255)
,`SubTotal` double(10,2)
,`SupplierID` int
,`SupplierName` varchar(150)
,`Tax` double(10,2)
,`TaxPer` double(10,2)
,`Total` double(10,2)
,`TRN` varchar(75)
,`UserID` int
,`WalkinCustomerName` varchar(155)
,`WarehouseID` int
,`WarehouseName` varchar(191)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_invoice_party_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_invoice_party_balance` (
`BALANCE` double(19,2)
,`PartyID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_inv_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_inv_balance` (
`Balance` double(19,2)
,`InvoiceMasterID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_inv_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_inv_detail` (
`Gross` double(8,2)
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`ItemID` int
,`ItemName` varchar(55)
,`Qty` int
,`Rate` double(8,2)
,`SupplierID` int
,`Total` double(50,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_items_in_warehouse`
-- (See below for the actual view)
--
CREATE TABLE `v_items_in_warehouse` (
`CostPrice` double(8,2)
,`IsActive` tinyint(1)
,`IsFeatured` tinyint
,`ItemCategoryID` int
,`ItemCode` varchar(255)
,`ItemID` int
,`ItemImage` varchar(255)
,`ItemName` varchar(55)
,`ItemType` varchar(55)
,`qty` double
,`SellingPrice` double(8,2)
,`warehouse_id` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_journal`
-- (See below for the actual view)
--
CREATE TABLE `v_journal` (
`BankReconcile` varchar(15)
,`Category` varchar(55)
,`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`CODE` varchar(15)
,`Cr` double(10,2)
,`Date` date
,`Dr` double(10,2)
,`ExpenseMasterID` int
,`InvoiceMasterID` int
,`JournalID` int
,`JournalType` varchar(10)
,`L1` int
,`L2` int
,`L3` int
,`Narration` varchar(255)
,`PartyID` int
,`PaymentMasterID` int
,`PettyMstID` int
,`PurchasePaymentMasterID` int
,`ReconcileDate` timestamp
,`SupplierID` int
,`Trace` decimal(10,0)
,`VHNO` varchar(15)
,`VoucherMstID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_journal_report`
-- (See below for the actual view)
--
CREATE TABLE `v_journal_report` (
`Date` date
,`INVOICE` varchar(7)
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_partywise_sale`
-- (See below for the actual view)
--
CREATE TABLE `v_partywise_sale` (
`Balance` double(10,2)
,`CustomerNotes` varchar(255)
,`Date` date
,`DescriptionNotes` varchar(255)
,`DiscountAmount` double(10,2)
,`DiscountPer` double(10,2)
,`DueDate` date
,`GrandTotal` double(10,2)
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`InvoiceType` varchar(30)
,`Paid` double(10,2)
,`PartyID` int
,`PartyName` text
,`PaymentDetails` varchar(255)
,`PaymentMode` varchar(25)
,`ReferenceNo` varchar(35)
,`Shipping` double(10,2)
,`Subject` varchar(255)
,`SubTotal` double(10,2)
,`SupplierID` int
,`Tax` double(10,2)
,`TaxPer` double(10,2)
,`Total` double(10,2)
,`UserID` int
,`WalkinCustomerName` varchar(155)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_party_aging`
-- (See below for the actual view)
--
CREATE TABLE `v_party_aging` (
`age15Days` double(19,2)
,`age30Days` double(19,2)
,`age60Days` double(19,2)
,`age7Days` double(19,2)
,`age90Days` double(19,2)
,`age90plusDays` double(19,2)
,`PartyID` int
,`PartyName` text
,`Total` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_party_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_party_balance` (
`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`Cr` double(10,2)
,`Date` date
,`Dr` double(10,2)
,`InvoiceMasterID` int
,`JournalType` varchar(10)
,`Narration` varchar(255)
,`PartyID` int
,`PartyName` text
,`PettyMstID` int
,`SupplierID` int
,`VHNO` varchar(15)
,`VoucherMstID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_party_montly_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_party_montly_balance` (
`Balance` double(22,2)
,`Cr` double(19,2)
,`Date` varchar(37)
,`Dr` double(19,2)
,`PartyID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_payment`
-- (See below for the actual view)
--
CREATE TABLE `v_payment` (
`Active` varchar(3)
,`Address` varchar(75)
,`ChartOfAccountID` int
,`eDate` timestamp
,`Email` varchar(25)
,`File` varchar(35)
,`InvoiceDueDays` int
,`Mobile` varchar(150)
,`Notes` longtext
,`PartyID` int
,`PartyName` text
,`PaymentAmount` double(8,2)
,`PaymentDate` date
,`PaymentMasterID` int
,`PaymentMode` varchar(25)
,`Phone` varchar(25)
,`ReferenceNo` varchar(35)
,`TRN` varchar(150)
,`Website` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_payment_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_payment_detail` (
`eDate` timestamp
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`Payment` double(8,2)
,`PaymentDate` date
,`PaymentDetailID` int
,`PaymentMasterID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_payment_summary`
-- (See below for the actual view)
--
CREATE TABLE `v_payment_summary` (
`InvoiceMasterID` int
,`Paid` double(19,2)
,`PaymentMasterID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pettycash_master`
-- (See below for the actual view)
--
CREATE TABLE `v_pettycash_master` (
`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`CODE` varchar(15)
,`Credit` double(10,2)
,`Date` date
,`Narration` varchar(255)
,`PettyMstID` int
,`PettyVoucher` varchar(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_purchase_order_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_purchase_order_detail` (
`Amount` double(8,2)
,`Date` date
,`Description` varchar(255)
,`Discount` double(8,2)
,`DiscountPer` double(8,2)
,`ItemID` int
,`ItemName` varchar(55)
,`PurchaseOrderDetailID` int
,`PurchaseOrderMasterID` int
,`Qty` varchar(10)
,`Rate` double(8,2)
,`Remarks` varchar(255)
,`Tax` double(8,2)
,`TaxPer` double(8,2)
,`Unit` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_purchase_order_master`
-- (See below for the actual view)
--
CREATE TABLE `v_purchase_order_master` (
`Active` varchar(3)
,`Address` varchar(75)
,`Date` date
,`DeliveryDate` date
,`DeliveryNotes` longtext
,`Discount` double(8,2)
,`DiscountPer` double(8,2)
,`eDate` timestamp
,`Email` varchar(150)
,`GrandTotal` double(8,2)
,`InvoiceDueDays` int
,`Mobile` varchar(150)
,`Phone` varchar(150)
,`PON` varchar(10)
,`PONotes` varchar(255)
,`PurchaseOrderMasterID` int
,`ReferenceNo` varchar(255)
,`Subject` varchar(255)
,`SubTotal` double(8,2)
,`SupplierID` int
,`SupplierName` varchar(150)
,`Tax` double(8,2)
,`TRN` varchar(75)
,`UserID` int
,`Website` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_purchase_payment`
-- (See below for the actual view)
--
CREATE TABLE `v_purchase_payment` (
`ChartOfAccountID` int
,`eDate` timestamp
,`File` varchar(35)
,`Notes` longtext
,`PaymentAmount` double(8,2)
,`PaymentDate` date
,`PaymentMode` varchar(25)
,`PurchasePaymentMasterID` int
,`ReferenceNo` varchar(35)
,`SupplierID` int
,`SupplierName` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_purchase_payment_master`
-- (See below for the actual view)
--
CREATE TABLE `v_purchase_payment_master` (
`Active` varchar(3)
,`Address` varchar(75)
,`ChartOfAccountID` int
,`eDate` timestamp
,`Email` varchar(150)
,`File` varchar(35)
,`Notes` longtext
,`PaymentAmount` double(8,2)
,`PaymentDate` date
,`PaymentMode` varchar(25)
,`Phone` varchar(150)
,`PurchasePaymentMasterID` int
,`ReferenceNo` varchar(35)
,`SupplierID` int
,`SupplierName` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_receivabledetail`
-- (See below for the actual view)
--
CREATE TABLE `v_receivabledetail` (
`Address` varchar(75)
,`Balance` double(10,2)
,`Date` date
,`InvoiceDetailID` int
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`ItemID` int
,`Paid` double(10,2)
,`PartyID` int
,`PartyName` text
,`Qty` int
,`ReferenceNo` varchar(35)
,`SubTotal` double(10,2)
,`Total` double(10,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rev_exp`
-- (See below for the actual view)
--
CREATE TABLE `v_rev_exp` (
`date_format(``v_journal``.``Date``,'%m-%Y')` varchar(7)
,`DATE_FORMAT(date,'%M-%Y')` varchar(69)
,`Exp` int
,`Rev` double(22,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rev_exp_chart`
-- (See below for the actual view)
--
CREATE TABLE `v_rev_exp_chart` (
`Exp` decimal(33,0)
,`MonthName` varchar(69)
,`Rev` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_sticker`
-- (See below for the actual view)
--
CREATE TABLE `v_sticker` (
`code` int
,`name` varchar(55)
,`price` double(8,2)
,`qty` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_supplier`
-- (See below for the actual view)
--
CREATE TABLE `v_supplier` (
`Active` varchar(3)
,`Address` varchar(75)
,`eDate` timestamp
,`Email` varchar(150)
,`InvoiceDueDays` int
,`Mobile` varchar(150)
,`Phone` varchar(150)
,`SupplierID` int
,`SupplierName` varchar(150)
,`TRN` varchar(75)
,`Website` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_supplier_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_supplier_balance` (
`Balance` double(19,2)
,`Cr` double(19,2)
,`Date` varchar(37)
,`Dr` double(19,2)
,`SupplierID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_supplier_outstanding`
-- (See below for the actual view)
--
CREATE TABLE `v_supplier_outstanding` (
`BALANCE` double(22,2)
,`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`Date` date
,`DueDate` date
,`GrandTotal` double(10,2)
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`PAID` double(19,2)
,`PartyID` int
,`SupplierID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_supplier_over_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_supplier_over_balance` (
`BALANCE` double(19,2)
,`SupplierID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_test`
-- (See below for the actual view)
--
CREATE TABLE `v_test` (
`InvoiceMasterID` int
,`ItemID` int
,`ItemName` varchar(55)
,`T1` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_trial`
-- (See below for the actual view)
--
CREATE TABLE `v_trial` (
`Balance` double(22,2)
,`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`Cr` double(19,2)
,`Dr` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_trialreport`
-- (See below for the actual view)
--
CREATE TABLE `v_trialreport` (
`Balance` double(22,2)
,`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`Cr` double(19,2)
,`Dr` double(19,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_trial_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_trial_balance` (
`ChartOfAccountID` int
,`ChartOfAccountName` varchar(75)
,`Cr` double(22,2)
,`Dr` double(22,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_voucher`
-- (See below for the actual view)
--
CREATE TABLE `v_voucher` (
`Date` date
,`Narration` varchar(255)
,`Voucher` varchar(15)
,`VoucherCode` varchar(35)
,`VoucherMstID` int
,`VoucherTypeName` varchar(35)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_voucher_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_voucher_detail` (
`ChartOfAccountName` varchar(75)
,`ChOfAcc` int
,`Credit` double(10,2)
,`Date` date
,`Debit` double(10,2)
,`InvoiceNo` varchar(75)
,`Narration` varchar(255)
,`NarrationMaster` varchar(255)
,`PartyID` int
,`PartyName` text
,`RefNo` varchar(75)
,`SupplierID` int
,`SupplierName` varchar(150)
,`Voucher` varchar(15)
,`VoucherCodeID` int
,`VoucherMstID` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_voucher_master`
-- (See below for the actual view)
--
CREATE TABLE `v_voucher_master` (
`Credit` double(10,2)
,`Date` date
,`Debit` double(10,2)
,`Narration` varchar(255)
,`PartyID` int
,`PartyName` text
,`Voucher` varchar(15)
,`VoucherCode` varchar(35)
,`VoucherCodeID` int
,`VoucherMstID` int
,`VoucherTypeID` int
,`VoucherTypeName` varchar(35)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_warehouse_stock_transfer`
-- (See below for the actual view)
--
CREATE TABLE `v_warehouse_stock_transfer` (
`CustomerNotes` varchar(255)
,`Date` date
,`DescriptionNotes` varchar(255)
,`InvoiceMasterID` int
,`InvoiceNo` varchar(10)
,`otherWareHouse` varchar(191)
,`PaymentMode` varchar(25)
,`Subject` varchar(255)
,`TotalQty` double
,`UserID` int
,`WalkinCustomerName` varchar(155)
,`WarehouseID` int
,`WarehouseName` varchar(191)
);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `WarehouseID` int NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`WarehouseID`, `name`) VALUES
(1, 'WareHouse 1'),
(2, 'WareHouse 2'),
(3, 'WareHouse 3');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `phone`, `email`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Ali Electronic Store', '0544235265', 'warehouse1@example.com', 'Main Bazar Dina', 1, '2021-08-28 23:02:47', '2021-09-12 22:06:00'),
(2, 'ShahCorporation', '0544-272224', 'sales@shahcorporationltd.com', 'Shah Corporation Building Kala Gujran Phatak GTRoad Jhelum', 1, '2021-09-12 22:15:24', '2022-03-02 12:03:59'),
(3, 'Consiment 2', '0544272225', 'shahcorporation@gmail.com', 'Plot No. 85-B Estate Small Industrial Area Rathiyan Jhelum', 1, '2022-06-14 09:29:06', '2023-05-02 10:50:07'),
(4, 'Container 3', '0544272225', 'shahcorporation@gmail.com', 'Plot No. 85-B Estate Small Industrial Area Rathiyan Jhelum', 1, '2022-06-14 09:35:49', '2022-06-15 09:05:20'),
(5, 'Container 4', '0544272225', 'shahcorporation@gmail.com', 'Plot No. 85-B Estate Small Industrial Area Rathiyan Jhelum', 1, '2022-06-14 09:36:23', '2022-06-15 09:05:33'),
(6, 'test abc', '033234235', 'test@testabc.com', 'abc address test', 1, '2023-01-18 02:47:30', '2023-01-18 05:08:56'),
(7, 'Branch 2', '03339322880', 'mr.elahi.ehsan@gmail.com', 'Address Line 1\r\nAddress Line 2', 1, '2023-05-12 01:51:50', '2023-05-12 01:51:50');

-- --------------------------------------------------------

--
-- Structure for view `v_cashflow`
--
DROP TABLE IF EXISTS `v_cashflow`;

CREATE OR REPLACE VIEW `v_cashflow`  AS SELECT sum(ifnull(`journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`journal`.`Dr`,0)) - sum(ifnull(`journal`.`Cr`,0))) AS `Balance`, date_format(`journal`.`Date`,'%b-%Y') AS `MonthName` FROM `journal` WHERE (`journal`.`ChartOfAccountID` in (110201,110250,110101,110200)) GROUP BY date_format(`journal`.`Date`,'%b-%Y') ORDER BY date_format(`journal`.`Date`,'%b-%Y') ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_challan_detail`
--
DROP TABLE IF EXISTS `v_challan_detail`;

CREATE OR REPLACE VIEW `v_challan_detail`  AS SELECT `challan_detail`.`ChallanDetailID` AS `ChallanDetailID`, `challan_detail`.`ChallanMasterID` AS `ChallanMasterID`, `challan_detail`.`ChallanNo` AS `ChallanNo`, `challan_detail`.`ChallanDate` AS `ChallanDate`, `challan_detail`.`ItemID` AS `ItemID`, `challan_detail`.`Qty` AS `Qty`, `challan_detail`.`Rate` AS `Rate`, `challan_detail`.`TaxAmount` AS `TaxAmount`, `challan_detail`.`TaxPer` AS `TaxPer`, `challan_detail`.`Discount` AS `Discount`, `challan_detail`.`Total` AS `Total`, `item`.`ItemType` AS `ItemType`, `item`.`ItemCode` AS `ItemCode`, `item`.`ItemName` AS `ItemName`, `item`.`UnitName` AS `UnitName`, `challan_detail`.`Description` AS `Description` FROM (`challan_detail` join `item` on((`challan_detail`.`ItemID` = `item`.`ItemID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_challan_master`
--
DROP TABLE IF EXISTS `v_challan_master`;

CREATE OR REPLACE VIEW `v_challan_master`  AS SELECT `challan_master`.`ChallanMasterID` AS `ChallanMasterID`, `challan_master`.`ChallanNo` AS `ChallanNo`, `challan_master`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `challan_master`.`PlaceOfSupply` AS `PlaceOfSupply`, `challan_master`.`ReferenceNo` AS `ReferenceNo`, date_format(`challan_master`.`ChallanDate`,'%d/%m/%Y') AS `ChallanDate`, `challan_master`.`ChallanType` AS `ChallanType`, `challan_master`.`Total` AS `Total`, `challan_master`.`CustomerNotes` AS `CustomerNotes`, `challan_master`.`TermAndCondition` AS `TermAndCondition`, `challan_master`.`File` AS `File`, `party`.`TRN` AS `TRN`, `party`.`Address` AS `Address`, `party`.`Mobile` AS `Mobile`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`eDate` AS `eDate`, `challan_master`.`Subject` AS `Subject`, `challan_master`.`DescriptionNotes` AS `DescriptionNotes`, `challan_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `challan_master`.`DiscountPer` AS `DiscountPer`, `challan_master`.`SubTotal` AS `SubTotal`, `challan_master`.`DiscountAmount` AS `DiscountAmount`, `challan_master`.`TaxPer` AS `TaxPer`, `challan_master`.`Tax` AS `Tax`, `challan_master`.`Shipping` AS `Shipping`, `challan_master`.`GrandTotal` AS `GrandTotal` FROM (`challan_master` join `party` on((`challan_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_chartofaccount`
--
DROP TABLE IF EXISTS `v_chartofaccount`;

CREATE OR REPLACE VIEW `v_chartofaccount`  AS SELECT `chartofaccount`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `chartofaccount`.`CODE` AS `CODE` FROM `chartofaccount` WHERE ((right(`chartofaccount`.`ChartOfAccountID`,5) = 0) AND (`chartofaccount`.`ChartOfAccountName` is not null))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_chartofaccount_mini`
--
DROP TABLE IF EXISTS `v_chartofaccount_mini`;

CREATE OR REPLACE VIEW `v_chartofaccount_mini`  AS SELECT `chartofaccount`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`CODE` AS `CODE`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `chartofaccount`.`OpenDebit` AS `OpenDebit`, `chartofaccount`.`OpenCredit` AS `OpenCredit`, `chartofaccount`.`L1` AS `L1`, `chartofaccount`.`L2` AS `L2`, `chartofaccount`.`L3` AS `L3`, `chartofaccount`.`Category` AS `Category` FROM `chartofaccount` WHERE (`chartofaccount`.`Category` in ('CASH','CARD','BANK','AR'))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_delivery_challan`
--
DROP TABLE IF EXISTS `v_delivery_challan`;

CREATE OR REPLACE VIEW `v_delivery_challan`  AS SELECT `challan_master`.`ChallanMasterID` AS `ChallanMasterID`, `challan_master`.`ChallanNo` AS `ChallanNo`, `challan_master`.`PartyID` AS `PartyID`, `challan_master`.`PlaceOfSupply` AS `PlaceOfSupply`, `challan_master`.`ReferenceNo` AS `ReferenceNo`, `challan_master`.`ChallanDate` AS `ChallanDate`, `challan_master`.`ChallanType` AS `ChallanType`, `challan_master`.`Total` AS `Total`, `challan_master`.`CustomerNotes` AS `CustomerNotes`, `challan_master`.`TermAndCondition` AS `TermAndCondition`, `challan_master`.`File` AS `File`, `challan_master`.`UserID` AS `UserID`, `party`.`PartyName` AS `PartyName`, `party`.`Address` AS `Address`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`TRN` AS `TRN`, `party`.`Mobile` AS `Mobile`, `party`.`Website` AS `Website`, `party`.`eDate` AS `eDate`, `challan_master`.`Subject` AS `Subject`, `challan_master`.`DescriptionNotes` AS `DescriptionNotes`, `challan_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `challan_master`.`SubTotal` AS `SubTotal`, `challan_master`.`DiscountPer` AS `DiscountPer`, `challan_master`.`DiscountAmount` AS `DiscountAmount`, `challan_master`.`TaxPer` AS `TaxPer`, `challan_master`.`Tax` AS `Tax`, `challan_master`.`Shipping` AS `Shipping`, `challan_master`.`GrandTotal` AS `GrandTotal`, `challan_master`.`Paid` AS `Paid`, `challan_master`.`Balance` AS `Balance` FROM (`challan_master` join `party` on((`challan_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_estimate_detail`
--
DROP TABLE IF EXISTS `v_estimate_detail`;

CREATE OR REPLACE VIEW `v_estimate_detail`  AS SELECT `estimate_detail`.`EstimateDetailID` AS `EstimateDetailID`, `estimate_detail`.`EstimateMasterID` AS `EstimateMasterID`, `estimate_detail`.`EstimateNo` AS `EstimateNo`, `estimate_detail`.`EstimateDate` AS `EstimateDate`, `estimate_detail`.`ItemID` AS `ItemID`, `item`.`ItemName` AS `ItemName`, `estimate_detail`.`Qty` AS `Qty`, `estimate_detail`.`Rate` AS `Rate`, `estimate_detail`.`Total` AS `Total`, `estimate_detail`.`Description` AS `Description`, `estimate_detail`.`TaxPer` AS `TaxPer`, `estimate_detail`.`Tax` AS `Tax` FROM (`estimate_detail` join `item` on((`estimate_detail`.`ItemID` = `item`.`ItemID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_estimate_master`
--
DROP TABLE IF EXISTS `v_estimate_master`;

CREATE OR REPLACE VIEW `v_estimate_master`  AS SELECT `estimate_master`.`EstimateMasterID` AS `EstimateMasterID`, `estimate_master`.`EstimateNo` AS `EstimateNo`, `estimate_master`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `estimate_master`.`PlaceOfSupply` AS `PlaceOfSupply`, `estimate_master`.`ReferenceNo` AS `ReferenceNo`, `estimate_master`.`EstimateDate` AS `EstimateDate`, `estimate_master`.`Total` AS `Total`, `estimate_master`.`CustomerNotes` AS `CustomerNotes`, `estimate_master`.`TermAndCondition` AS `TermAndCondition`, `estimate_master`.`File` AS `File`, `estimate_master`.`UserID` AS `UserID`, `estimate_master`.`Subject` AS `Subject`, `party`.`Address` AS `Address`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `estimate_master`.`Date` AS `Date`, `estimate_master`.`SubTotal` AS `SubTotal`, `estimate_master`.`TaxPer` AS `TaxPer`, `estimate_master`.`Tax` AS `Tax`, `estimate_master`.`DiscountPer` AS `DiscountPer`, `estimate_master`.`Discount` AS `Discount`, `estimate_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `estimate_master`.`Shipping` AS `Shipping`, `estimate_master`.`DescriptionNotes` AS `DescriptionNotes`, `estimate_master`.`ExpiryDate` AS `ExpiryDate`, `estimate_master`.`GrandTotal` AS `GrandTotal`, `party`.`TRN` AS `TRN`, `party`.`Mobile` AS `Mobile`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`eDate` AS `eDate` FROM (`estimate_master` join `party` on((`estimate_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_expense`
--
DROP TABLE IF EXISTS `v_expense`;

CREATE OR REPLACE VIEW `v_expense`  AS SELECT `expense_master`.`ExpenseMasterID` AS `ExpenseMasterID`, `expense_master`.`Date` AS `Date`, date_format(`expense_master`.`Date`,'%d-%m-%Y') AS `Date1`, `expense_master`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `expense_master`.`SupplierID` AS `SupplierID`, `supplier`.`SupplierName` AS `SupplierName`, `expense_master`.`ReferenceNo` AS `ReferenceNo`, `expense_master`.`ExpenseNo` AS `ExpenseNo`, `expense_master`.`GrantTotal` AS `GrantTotal` FROM ((`expense_master` join `chartofaccount` on((`expense_master`.`ChartOfAccountID` = `chartofaccount`.`ChartOfAccountID`))) join `supplier` on((`expense_master`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_expense_chart`
--
DROP TABLE IF EXISTS `v_expense_chart`;

CREATE OR REPLACE VIEW `v_expense_chart`  AS SELECT date_format(`v_journal`.`Date`,'%M-%Y') AS `MonthName`, (sum(if((`v_journal`.`Dr` is null),0,`v_journal`.`Dr`)) - sum(if((`v_journal`.`Cr` is null),0,`v_journal`.`Cr`))) AS `Balance`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName` FROM `v_journal` WHERE (`v_journal`.`CODE` = 'E') GROUP BY date_format(`v_journal`.`Date`,'%M-%Y'), `v_journal`.`ChartOfAccountName`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_expense_detail`
--
DROP TABLE IF EXISTS `v_expense_detail`;

CREATE OR REPLACE VIEW `v_expense_detail`  AS SELECT `expense_master`.`ExpenseNo` AS `ExpenseNo`, `expense_master`.`Date` AS `Date`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `expense_detail`.`ExpenseDetailID` AS `ExpenseDetailID`, `expense_detail`.`ExpenseMasterID` AS `ExpenseMasterID`, `expense_detail`.`ChartOfAccountID` AS `ChartOfAccountID`, `expense_detail`.`Notes` AS `Notes`, `expense_detail`.`TaxPer` AS `TaxPer`, `expense_detail`.`Tax` AS `Tax`, `expense_detail`.`Amount` AS `Amount` FROM ((`expense_detail` join `expense_master` on((`expense_master`.`ExpenseMasterID` = `expense_detail`.`ExpenseMasterID`))) join `chartofaccount` on((`expense_detail`.`ChartOfAccountID` = `chartofaccount`.`ChartOfAccountID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_expense_master`
--
DROP TABLE IF EXISTS `v_expense_master`;

CREATE OR REPLACE VIEW `v_expense_master`  AS SELECT `expense_master`.`Date` AS `Date`, `expense_master`.`ExpenseNo` AS `ExpenseNo`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `expense_master`.`ReferenceNo` AS `ReferenceNo`, `supplier`.`SupplierName` AS `SupplierName`, `expense_master`.`GrantTotal` AS `GrantTotal` FROM ((`expense_master` join `chartofaccount` on((`expense_master`.`ChartOfAccountID` = `chartofaccount`.`ChartOfAccountID`))) join `supplier` on((`expense_master`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_income_exp_chart`
--
DROP TABLE IF EXISTS `v_income_exp_chart`;

CREATE OR REPLACE VIEW `v_income_exp_chart`  AS SELECT sum(ifnull(`journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`journal`.`Dr`,0)) - sum(ifnull(`journal`.`Cr`,0))) AS `Balance`, date_format(`journal`.`Date`,'%b-%Y') AS `MonthName` FROM `journal` WHERE (`journal`.`ChartOfAccountID` in (110201,110250,110101,110200)) GROUP BY date_format(`journal`.`Date`,'%b-%Y')  ;

-- --------------------------------------------------------

--
-- Structure for view `v_inentory_detail`
--
DROP TABLE IF EXISTS `v_inentory_detail`;

CREATE OR REPLACE VIEW `v_inentory_detail`  AS SELECT `invoice_detail`.`ItemID` AS `ItemID`, `item`.`ItemName` AS `ItemName`, `item`.`UnitName` AS `UnitName`, if((left(`invoice_detail`.`InvoiceNo`,2) = 'CN'),`invoice_detail`.`Qty`,0) AS `SaleReturn`, if(((left(`invoice_detail`.`InvoiceNo`,3) = 'BIL') or (left(`invoice_detail`.`InvoiceNo`,3) = 'Win')),`invoice_detail`.`Qty`,0) AS `QtyIn`, if(((left(`invoice_detail`.`InvoiceNo`,3) = 'TAX') or (left(`invoice_detail`.`InvoiceNo`,3) = 'INV') or (left(`invoice_detail`.`InvoiceNo`,4) = 'Wout')),`invoice_detail`.`Qty`,0) AS `QtyOut`, `invoice_master`.`WarehouseID` AS `WarehouseID`, `invoice_master`.`Date` AS `Date`, `invoice_detail`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID` FROM ((`invoice_detail` join `item` on((`invoice_detail`.`ItemID` = `item`.`ItemID`))) join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `invoice_detail`.`InvoiceMasterID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_inventory`
--
DROP TABLE IF EXISTS `v_inventory`;

CREATE OR REPLACE VIEW `v_inventory`  AS SELECT `invoice_master`.`WarehouseID` AS `WarehouseID`, `warehouses`.`name` AS `WarehouseName`, `invoice_detail`.`ItemID` AS `ItemID`, `item`.`ItemName` AS `ItemName`, `item`.`UnitName` AS `UnitName`, sum(if((left(`invoice_detail`.`InvoiceNo`,2) = 'CN'),`invoice_detail`.`Qty`,0)) AS `SaleReturn`, sum(if((left(`invoice_detail`.`InvoiceNo`,3) = 'BIL'),`invoice_detail`.`Qty`,0)) AS `QtyIn`, sum(if((left(`invoice_detail`.`InvoiceNo`,3) = 'TAX'),`invoice_detail`.`Qty`,0)) AS `QtyOut`, sum(if((left(`invoice_detail`.`InvoiceNo`,3) = 'POS'),`invoice_detail`.`Qty`,0)) AS `POSOut`, (sum((if((left(`invoice_detail`.`InvoiceNo`,3) = 'BIL'),`invoice_detail`.`Qty`,0) + if((left(`invoice_detail`.`InvoiceNo`,2) = 'CN'),`invoice_detail`.`Qty`,0))) - (sum(if((left(`invoice_detail`.`InvoiceNo`,3) = 'TAX'),`invoice_detail`.`Qty`,0)) + sum(if((left(`invoice_detail`.`InvoiceNo`,3) = 'POS'),`invoice_detail`.`Qty`,0)))) AS `Balance` FROM (((`invoice_detail` join `item` on((`invoice_detail`.`ItemID` = `item`.`ItemID`))) join `invoice_master` on((`invoice_detail`.`InvoiceMasterID` = `invoice_master`.`InvoiceMasterID`))) join `warehouses` on((`warehouses`.`id` = `invoice_master`.`WarehouseID`))) GROUP BY `invoice_detail`.`ItemID`, `item`.`ItemName`, `item`.`UnitName`, `invoice_master`.`WarehouseID`, `warehouses`.`name`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_inventory_detail`
--
DROP TABLE IF EXISTS `v_inventory_detail`;

CREATE OR REPLACE VIEW `v_inventory_detail`  AS SELECT `invoice_detail`.`ItemID` AS `ItemID`, `item`.`ItemName` AS `ItemName`, `item`.`UnitName` AS `UnitName`, if((left(`invoice_detail`.`InvoiceNo`,2) = 'CN'),`invoice_detail`.`Qty`,0) AS `SaleReturn`, if(((left(`invoice_detail`.`InvoiceNo`,3) = 'BIL') or (left(`invoice_detail`.`InvoiceNo`,3) = 'Win')),`invoice_detail`.`Qty`,0) AS `QtyIn`, if(((left(`invoice_detail`.`InvoiceNo`,3) = 'TAX') or (left(`invoice_detail`.`InvoiceNo`,3) = 'INV') or (left(`invoice_detail`.`InvoiceNo`,4) = 'Wout')),`invoice_detail`.`Qty`,0) AS `QtyOut`, `invoice_master`.`WarehouseID` AS `WarehouseID`, `invoice_master`.`Date` AS `Date`, `invoice_detail`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID` FROM ((`invoice_detail` join `item` on((`invoice_detail`.`ItemID` = `item`.`ItemID`))) join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `invoice_detail`.`InvoiceMasterID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_bal`
--
DROP TABLE IF EXISTS `v_invoice_bal`;

CREATE OR REPLACE VIEW `v_invoice_bal`  AS SELECT `journal`.`PartyID` AS `PartyID`, `journal`.`InvoiceMasterID` AS `InvoiceMasterID`, sum(ifnull(`journal`.`Dr`,0)) AS `INVOICE`, sum(ifnull(`journal`.`Cr`,0)) AS `PAID`, (sum(ifnull(`journal`.`Dr`,0)) - sum(ifnull(`journal`.`Cr`,0))) AS `due` FROM `journal` WHERE (`journal`.`ChartOfAccountID` = 110400) GROUP BY `journal`.`PartyID`, `journal`.`InvoiceMasterID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_balance`
--
DROP TABLE IF EXISTS `v_invoice_balance`;

CREATE OR REPLACE VIEW `v_invoice_balance`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `v_invoice_bal`.`PartyID` AS `PartyID`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `v_invoice_bal`.`INVOICE` AS `INVOICE`, `v_invoice_bal`.`PAID` AS `PAID`, `v_invoice_bal`.`due` AS `BALANCE`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`DueDate` AS `DueDate`, `invoice_master`.`ReferenceNo` AS `ReferenceNo` FROM (`invoice_master` join `v_invoice_bal` on((`invoice_master`.`InvoiceMasterID` = `v_invoice_bal`.`InvoiceMasterID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_both`
--
DROP TABLE IF EXISTS `v_invoice_both`;

CREATE OR REPLACE VIEW `v_invoice_both`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`Paid` AS `Paid`, (`invoice_master`.`GrandTotal` - `invoice_master`.`Paid`) AS `Balance`, `invoice_master`.`DueDate` AS `DueDate`, `party`.`PartyName` AS `PartyName`, `party`.`Address` AS `Address`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_master`.`SupplierID` AS `SupplierID`, `invoice_master`.`PartyID` AS `PartyID`, `invoice_master`.`SubTotal` AS `SubTotal`, `invoice_master`.`DiscountPer` AS `DiscountPer`, `invoice_master`.`DiscountAmount` AS `DiscountAmount`, `invoice_master`.`InvoiceType` AS `InvoiceType`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes`, `invoice_master`.`TaxPer` AS `TaxPer`, `invoice_master`.`Tax` AS `Tax`, `invoice_master`.`Shipping` AS `Shipping`, `invoice_master`.`GrandTotal` AS `GrandTotal`, `party`.`Mobile` AS `Mobile`, `party`.`TRN` AS `TRN`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`eDate` AS `eDate`, `invoice_master`.`PaymentDetails` AS `PaymentDetails`, `user`.`FullName` AS `FullName`, `supplier`.`SupplierName` AS `SupplierName` FROM (((`invoice_master` left join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`))) left join `user` on((`invoice_master`.`UserID` = `user`.`UserID`))) left join `supplier` on((`invoice_master`.`SupplierID` = `supplier`.`SupplierID`))) ORDER BY `invoice_master`.`InvoiceMasterID` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_detail`
--
DROP TABLE IF EXISTS `v_invoice_detail`;

CREATE OR REPLACE VIEW `v_invoice_detail`  AS SELECT `invoice_detail`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`Date` AS `Date`, `invoice_detail`.`InvoiceDetailID` AS `InvoiceDetailID`, `invoice_detail`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_detail`.`ItemID` AS `ItemID`, `invoice_detail`.`SupplierID` AS `SupplierID`, `invoice_detail`.`PartyID` AS `PartyID`, `invoice_detail`.`Qty` AS `Qty`, `invoice_detail`.`Rate` AS `Rate`, `invoice_detail`.`Total` AS `Total`, `item`.`ItemCode` AS `ItemCode`, `item`.`ItemName` AS `ItemName`, `invoice_detail`.`Description` AS `Description`, `invoice_detail`.`TaxPer` AS `TaxPer`, `invoice_detail`.`Tax` AS `Tax`, `invoice_master`.`InvoiceType` AS `InvoiceType`, `invoice_detail`.`Discount` AS `Discount`, `invoice_detail`.`DiscountType` AS `DiscountType`, `invoice_detail`.`DiscountAmountItem` AS `DiscountAmountItem`, `invoice_detail`.`Gross` AS `Gross`, `party`.`PartyName` AS `PartyName` FROM (((`invoice_detail` join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `invoice_detail`.`InvoiceMasterID`))) join `item` on((`invoice_detail`.`ItemID` = `item`.`ItemID`))) left join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_master`
--
DROP TABLE IF EXISTS `v_invoice_master`;

CREATE OR REPLACE VIEW `v_invoice_master`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`WarehouseID` AS `WarehouseID`, `warehouses`.`name` AS `WarehouseName`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`Paid` AS `Paid`, (`invoice_master`.`GrandTotal` - `invoice_master`.`Paid`) AS `Balance`, `invoice_master`.`DueDate` AS `DueDate`, `party`.`PartyName` AS `PartyName`, `party`.`Address` AS `Address`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_master`.`SupplierID` AS `SupplierID`, `invoice_master`.`PartyID` AS `PartyID`, `invoice_master`.`SubTotal` AS `SubTotal`, `invoice_master`.`DiscountPer` AS `DiscountPer`, `invoice_master`.`DiscountAmount` AS `DiscountAmount`, `invoice_master`.`InvoiceType` AS `InvoiceType`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes`, `invoice_master`.`TaxPer` AS `TaxPer`, `invoice_master`.`Tax` AS `Tax`, `invoice_master`.`Shipping` AS `Shipping`, `invoice_master`.`GrandTotal` AS `GrandTotal`, `party`.`Mobile` AS `Mobile`, `party`.`TRN` AS `TRN`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays`, `party`.`eDate` AS `eDate`, `invoice_master`.`PaymentDetails` AS `PaymentDetails`, `user`.`FullName` AS `FullName`, `invoice_master`.`TaxType` AS `TaxType`, `invoice_master`.`DishTableID` AS `DishTableID` FROM (((`invoice_master` join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`))) left join `user` on((`invoice_master`.`UserID` = `user`.`UserID`))) join `warehouses` on((`warehouses`.`id` = `invoice_master`.`WarehouseID`))) ORDER BY `invoice_master`.`InvoiceMasterID` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_master_supplier`
--
DROP TABLE IF EXISTS `v_invoice_master_supplier`;

CREATE OR REPLACE VIEW `v_invoice_master_supplier`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`WarehouseID` AS `WarehouseID`, `warehouses`.`name` AS `WarehouseName`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`Paid` AS `Paid`, `invoice_master`.`Balance` AS `Balance`, `invoice_master`.`DueDate` AS `DueDate`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_master`.`SupplierID` AS `SupplierID`, `invoice_master`.`PartyID` AS `PartyID`, `invoice_master`.`SubTotal` AS `SubTotal`, `invoice_master`.`DiscountPer` AS `DiscountPer`, `invoice_master`.`DiscountAmount` AS `DiscountAmount`, `supplier`.`SupplierName` AS `SupplierName`, `supplier`.`Address` AS `Address`, `supplier`.`Phone` AS `Phone`, `supplier`.`Email` AS `Email`, `supplier`.`Active` AS `Active`, `supplier`.`InvoiceDueDays` AS `InvoiceDueDays`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`PaymentDetails` AS `PaymentDetails`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes`, `invoice_master`.`GrandTotal` AS `GrandTotal`, `invoice_master`.`Shipping` AS `Shipping`, `invoice_master`.`Tax` AS `Tax`, `invoice_master`.`TaxPer` AS `TaxPer`, `supplier`.`TRN` AS `TRN` FROM ((`invoice_master` join `supplier` on((`invoice_master`.`SupplierID` = `supplier`.`SupplierID`))) join `warehouses` on((`warehouses`.`id` = `invoice_master`.`WarehouseID`))) ORDER BY `invoice_master`.`InvoiceMasterID` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_invoice_party_balance`
--
DROP TABLE IF EXISTS `v_invoice_party_balance`;

CREATE OR REPLACE VIEW `v_invoice_party_balance`  AS SELECT `v_invoice_balance`.`PartyID` AS `PartyID`, sum(`v_invoice_balance`.`BALANCE`) AS `BALANCE` FROM `v_invoice_balance` GROUP BY `v_invoice_balance`.`PartyID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_inv_balance`
--
DROP TABLE IF EXISTS `v_inv_balance`;

CREATE OR REPLACE VIEW `v_inv_balance`  AS SELECT `journal`.`InvoiceMasterID` AS `InvoiceMasterID`, sum(`journal`.`Dr`) AS `Balance` FROM `journal` WHERE (left(`journal`.`VHNO`,3) = 'PAY') GROUP BY `journal`.`InvoiceMasterID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_inv_detail`
--
DROP TABLE IF EXISTS `v_inv_detail`;

CREATE OR REPLACE VIEW `v_inv_detail`  AS SELECT `invoice_detail`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_detail`.`InvoiceNo` AS `InvoiceNo`, `invoice_detail`.`ItemID` AS `ItemID`, `invoice_detail`.`SupplierID` AS `SupplierID`, `invoice_detail`.`Qty` AS `Qty`, `invoice_detail`.`Rate` AS `Rate`, `item`.`ItemName` AS `ItemName`, `invoice_detail`.`Gross` AS `Gross`, `invoice_detail`.`Total` AS `Total` FROM (`invoice_detail` join `item` on((`invoice_detail`.`ItemID` = `item`.`ItemID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_items_in_warehouse`
--
DROP TABLE IF EXISTS `v_items_in_warehouse`;

CREATE OR REPLACE VIEW `v_items_in_warehouse`  AS SELECT `i`.`ItemID` AS `ItemID`, `i`.`ItemName` AS `ItemName`, `i`.`ItemCode` AS `ItemCode`, `i`.`CostPrice` AS `CostPrice`, `i`.`SellingPrice` AS `SellingPrice`, `pw`.`warehouse_id` AS `warehouse_id`, `pw`.`qty` AS `qty`, `i`.`ItemImage` AS `ItemImage`, `i`.`ItemCategoryID` AS `ItemCategoryID`, `i`.`ItemType` AS `ItemType`, `i`.`IsActive` AS `IsActive`, `i`.`IsFeatured` AS `IsFeatured` FROM (`item` `i` join `product_warehouse` `pw` on((`i`.`ItemID` = `pw`.`product_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_journal`
--
DROP TABLE IF EXISTS `v_journal`;

CREATE OR REPLACE VIEW `v_journal`  AS SELECT `journal`.`VHNO` AS `VHNO`, `journal`.`JournalType` AS `JournalType`, `journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `journal`.`SupplierID` AS `SupplierID`, `journal`.`VoucherMstID` AS `VoucherMstID`, `journal`.`PettyMstID` AS `PettyMstID`, `journal`.`InvoiceMasterID` AS `InvoiceMasterID`, `journal`.`Date` AS `Date`, `journal`.`Dr` AS `Dr`, `journal`.`Cr` AS `Cr`, `journal`.`PartyID` AS `PartyID`, `journal`.`Narration` AS `Narration`, `chartofaccount`.`L1` AS `L1`, `chartofaccount`.`L2` AS `L2`, `chartofaccount`.`L3` AS `L3`, `chartofaccount`.`CODE` AS `CODE`, `journal`.`Trace` AS `Trace`, `journal`.`BankReconcile` AS `BankReconcile`, `journal`.`ReconcileDate` AS `ReconcileDate`, `journal`.`JournalID` AS `JournalID`, `chartofaccount`.`Category` AS `Category`, `journal`.`ExpenseMasterID` AS `ExpenseMasterID`, `journal`.`PaymentMasterID` AS `PaymentMasterID`, `journal`.`PurchasePaymentMasterID` AS `PurchasePaymentMasterID` FROM (`chartofaccount` join `journal` on((`chartofaccount`.`ChartOfAccountID` = `journal`.`ChartOfAccountID`))) ORDER BY `journal`.`JournalID` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_journal_report`
--
DROP TABLE IF EXISTS `v_journal_report`;

CREATE OR REPLACE VIEW `v_journal_report`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`Date` AS `Date`, 'INVOICE' AS `INVOICE` FROM `invoice_master`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_partywise_sale`
--
DROP TABLE IF EXISTS `v_partywise_sale`;

CREATE OR REPLACE VIEW `v_partywise_sale`  AS SELECT `invoice_master`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`InvoiceType` AS `InvoiceType`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`DueDate` AS `DueDate`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`SupplierID` AS `SupplierID`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`PaymentDetails` AS `PaymentDetails`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`SubTotal` AS `SubTotal`, `invoice_master`.`DiscountPer` AS `DiscountPer`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`DiscountAmount` AS `DiscountAmount`, `invoice_master`.`TaxPer` AS `TaxPer`, `invoice_master`.`Tax` AS `Tax`, `invoice_master`.`Shipping` AS `Shipping`, `invoice_master`.`GrandTotal` AS `GrandTotal`, `invoice_master`.`Paid` AS `Paid`, `invoice_master`.`Balance` AS `Balance` FROM (`invoice_master` join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_party_aging`
--
DROP TABLE IF EXISTS `v_party_aging`;

CREATE OR REPLACE VIEW `v_party_aging`  AS SELECT `invoice_master`.`PartyID` AS `PartyID`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 1 and 7),`invoice_master`.`GrandTotal`,0)) AS `age7Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 8 and 16),`invoice_master`.`GrandTotal`,0)) AS `age15Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 17 and 30),`invoice_master`.`GrandTotal`,0)) AS `age30Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 31 and 60),`invoice_master`.`GrandTotal`,0)) AS `age60Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) between 61 and 90),`invoice_master`.`GrandTotal`,0)) AS `age90Days`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) > 90),`invoice_master`.`GrandTotal`,0)) AS `age90plusDays`, sum(if(((to_days(curdate()) - to_days(`invoice_master`.`Date`)) > 0),`invoice_master`.`GrandTotal`,0)) AS `Total`, `party`.`PartyName` AS `PartyName` FROM (`invoice_master` join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`))) WHERE (`invoice_master`.`Paid` = 0) GROUP BY `invoice_master`.`PartyID`, `party`.`PartyName`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_party_balance`
--
DROP TABLE IF EXISTS `v_party_balance`;

CREATE OR REPLACE VIEW `v_party_balance`  AS SELECT `v_journal`.`VHNO` AS `VHNO`, `v_journal`.`JournalType` AS `JournalType`, `v_journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName`, `v_journal`.`SupplierID` AS `SupplierID`, `v_journal`.`VoucherMstID` AS `VoucherMstID`, `v_journal`.`PettyMstID` AS `PettyMstID`, `v_journal`.`InvoiceMasterID` AS `InvoiceMasterID`, `v_journal`.`Date` AS `Date`, `v_journal`.`Dr` AS `Dr`, `v_journal`.`Cr` AS `Cr`, `v_journal`.`PartyID` AS `PartyID`, `v_journal`.`Narration` AS `Narration`, `party`.`PartyName` AS `PartyName` FROM (`v_journal` join `party` on((`v_journal`.`PartyID` = `party`.`PartyID`))) WHERE (`v_journal`.`ChartOfAccountID` = 110400)  ;

-- --------------------------------------------------------

--
-- Structure for view `v_party_montly_balance`
--
DROP TABLE IF EXISTS `v_party_montly_balance`;

CREATE OR REPLACE VIEW `v_party_montly_balance`  AS SELECT date_format(`journal`.`Date`,'%b-%Y') AS `Date`, sum(ifnull(`journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`journal`.`Dr`,0)) - sum(ifnull(`journal`.`Cr`,0))) AS `Balance`, `journal`.`PartyID` AS `PartyID` FROM `journal` WHERE ((`journal`.`ChartOfAccountID` = 110400) AND (`journal`.`PartyID` is not null)) GROUP BY `journal`.`PartyID`, date_format(`journal`.`Date`,'%b-%Y')  ;

-- --------------------------------------------------------

--
-- Structure for view `v_payment`
--
DROP TABLE IF EXISTS `v_payment`;

CREATE OR REPLACE VIEW `v_payment`  AS SELECT `payment_master`.`PaymentMasterID` AS `PaymentMasterID`, `payment_master`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `payment_master`.`PaymentDate` AS `PaymentDate`, `payment_master`.`PaymentAmount` AS `PaymentAmount`, `payment_master`.`PaymentMode` AS `PaymentMode`, `payment_master`.`ChartOfAccountID` AS `ChartOfAccountID`, `payment_master`.`ReferenceNo` AS `ReferenceNo`, `payment_master`.`File` AS `File`, `payment_master`.`Notes` AS `Notes`, `payment_master`.`eDate` AS `eDate`, `party`.`TRN` AS `TRN`, `party`.`Address` AS `Address`, `party`.`Mobile` AS `Mobile`, `party`.`Phone` AS `Phone`, `party`.`Email` AS `Email`, `party`.`Website` AS `Website`, `party`.`Active` AS `Active`, `party`.`InvoiceDueDays` AS `InvoiceDueDays` FROM (`payment_master` join `party` on((`payment_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_payment_detail`
--
DROP TABLE IF EXISTS `v_payment_detail`;

CREATE OR REPLACE VIEW `v_payment_detail`  AS SELECT `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `payment_detail`.`PaymentDetailID` AS `PaymentDetailID`, `payment_detail`.`PaymentMasterID` AS `PaymentMasterID`, `payment_detail`.`PaymentDate` AS `PaymentDate`, `payment_detail`.`InvoiceMasterID` AS `InvoiceMasterID`, `payment_detail`.`Payment` AS `Payment`, `payment_detail`.`eDate` AS `eDate` FROM (`payment_detail` join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `payment_detail`.`InvoiceMasterID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_payment_summary`
--
DROP TABLE IF EXISTS `v_payment_summary`;

CREATE OR REPLACE VIEW `v_payment_summary`  AS SELECT `payment_detail`.`InvoiceMasterID` AS `InvoiceMasterID`, sum(`payment_detail`.`Payment`) AS `Paid`, `payment_detail`.`PaymentMasterID` AS `PaymentMasterID` FROM `payment_detail` GROUP BY `payment_detail`.`InvoiceMasterID`, `payment_detail`.`PaymentMasterID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_pettycash_master`
--
DROP TABLE IF EXISTS `v_pettycash_master`;

CREATE OR REPLACE VIEW `v_pettycash_master`  AS SELECT `pettycash_master`.`PettyMstID` AS `PettyMstID`, `pettycash_master`.`PettyVoucher` AS `PettyVoucher`, `chartofaccount`.`ChartOfAccountID` AS `ChartOfAccountID`, `chartofaccount`.`CODE` AS `CODE`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `pettycash_master`.`Date` AS `Date`, `pettycash_master`.`Narration` AS `Narration`, `pettycash_master`.`Credit` AS `Credit` FROM (`chartofaccount` join `pettycash_master` on((`chartofaccount`.`ChartOfAccountID` = `pettycash_master`.`ChOfAcc`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase_order_detail`
--
DROP TABLE IF EXISTS `v_purchase_order_detail`;

CREATE OR REPLACE VIEW `v_purchase_order_detail`  AS SELECT `purchase_order_detail`.`PurchaseOrderDetailID` AS `PurchaseOrderDetailID`, `purchase_order_detail`.`PurchaseOrderMasterID` AS `PurchaseOrderMasterID`, `purchase_order_detail`.`Date` AS `Date`, `purchase_order_detail`.`ItemID` AS `ItemID`, `purchase_order_detail`.`Description` AS `Description`, `purchase_order_detail`.`Rate` AS `Rate`, `purchase_order_detail`.`Qty` AS `Qty`, `purchase_order_detail`.`Unit` AS `Unit`, `purchase_order_detail`.`DiscountPer` AS `DiscountPer`, `purchase_order_detail`.`Discount` AS `Discount`, `purchase_order_detail`.`Tax` AS `Tax`, `purchase_order_detail`.`TaxPer` AS `TaxPer`, `purchase_order_detail`.`Amount` AS `Amount`, `purchase_order_detail`.`Remarks` AS `Remarks`, `item`.`ItemName` AS `ItemName` FROM (`purchase_order_detail` join `item` on((`purchase_order_detail`.`ItemID` = `item`.`ItemID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase_order_master`
--
DROP TABLE IF EXISTS `v_purchase_order_master`;

CREATE OR REPLACE VIEW `v_purchase_order_master`  AS SELECT `purchase_order_master`.`PurchaseOrderMasterID` AS `PurchaseOrderMasterID`, `purchase_order_master`.`PON` AS `PON`, `purchase_order_master`.`SupplierID` AS `SupplierID`, `purchase_order_master`.`Date` AS `Date`, `purchase_order_master`.`PONotes` AS `PONotes`, `purchase_order_master`.`UserID` AS `UserID`, `purchase_order_master`.`Subject` AS `Subject`, `supplier`.`SupplierName` AS `SupplierName`, `supplier`.`TRN` AS `TRN`, `supplier`.`Address` AS `Address`, `supplier`.`Mobile` AS `Mobile`, `supplier`.`Phone` AS `Phone`, `supplier`.`Email` AS `Email`, `supplier`.`Website` AS `Website`, `supplier`.`Active` AS `Active`, `supplier`.`InvoiceDueDays` AS `InvoiceDueDays`, `purchase_order_master`.`ReferenceNo` AS `ReferenceNo`, `purchase_order_master`.`Tax` AS `Tax`, `purchase_order_master`.`GrandTotal` AS `GrandTotal`, `purchase_order_master`.`eDate` AS `eDate`, `purchase_order_master`.`DeliveryDate` AS `DeliveryDate`, `purchase_order_master`.`DeliveryNotes` AS `DeliveryNotes`, `purchase_order_master`.`SubTotal` AS `SubTotal`, `purchase_order_master`.`Discount` AS `Discount`, `purchase_order_master`.`DiscountPer` AS `DiscountPer` FROM (`purchase_order_master` join `supplier` on((`purchase_order_master`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase_payment`
--
DROP TABLE IF EXISTS `v_purchase_payment`;

CREATE OR REPLACE VIEW `v_purchase_payment`  AS SELECT `purchasepayment_master`.`PurchasePaymentMasterID` AS `PurchasePaymentMasterID`, `purchasepayment_master`.`SupplierID` AS `SupplierID`, `purchasepayment_master`.`PaymentDate` AS `PaymentDate`, `purchasepayment_master`.`PaymentAmount` AS `PaymentAmount`, `purchasepayment_master`.`PaymentMode` AS `PaymentMode`, `purchasepayment_master`.`ChartOfAccountID` AS `ChartOfAccountID`, `purchasepayment_master`.`ReferenceNo` AS `ReferenceNo`, `purchasepayment_master`.`File` AS `File`, `purchasepayment_master`.`Notes` AS `Notes`, `purchasepayment_master`.`eDate` AS `eDate`, `supplier`.`SupplierName` AS `SupplierName` FROM (`purchasepayment_master` join `supplier` on((`purchasepayment_master`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_purchase_payment_master`
--
DROP TABLE IF EXISTS `v_purchase_payment_master`;

CREATE OR REPLACE VIEW `v_purchase_payment_master`  AS SELECT `purchasepayment_master`.`PurchasePaymentMasterID` AS `PurchasePaymentMasterID`, `purchasepayment_master`.`SupplierID` AS `SupplierID`, `purchasepayment_master`.`PaymentDate` AS `PaymentDate`, `purchasepayment_master`.`PaymentAmount` AS `PaymentAmount`, `purchasepayment_master`.`PaymentMode` AS `PaymentMode`, `purchasepayment_master`.`ChartOfAccountID` AS `ChartOfAccountID`, `purchasepayment_master`.`ReferenceNo` AS `ReferenceNo`, `purchasepayment_master`.`File` AS `File`, `purchasepayment_master`.`Notes` AS `Notes`, `purchasepayment_master`.`eDate` AS `eDate`, `supplier`.`SupplierName` AS `SupplierName`, `supplier`.`Address` AS `Address`, `supplier`.`Phone` AS `Phone`, `supplier`.`Email` AS `Email`, `supplier`.`Active` AS `Active` FROM (`purchasepayment_master` join `supplier` on((`purchasepayment_master`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_receivabledetail`
--
DROP TABLE IF EXISTS `v_receivabledetail`;

CREATE OR REPLACE VIEW `v_receivabledetail`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`ReferenceNo` AS `ReferenceNo`, `invoice_detail`.`InvoiceDetailID` AS `InvoiceDetailID`, `invoice_detail`.`ItemID` AS `ItemID`, `invoice_detail`.`Qty` AS `Qty`, `invoice_master`.`Total` AS `Total`, `invoice_master`.`Paid` AS `Paid`, `invoice_master`.`Balance` AS `Balance`, `party`.`PartyName` AS `PartyName`, `party`.`Address` AS `Address`, `party`.`PartyID` AS `PartyID`, `invoice_master`.`SubTotal` AS `SubTotal` FROM ((`invoice_master` join `invoice_detail` on((`invoice_master`.`InvoiceMasterID` = `invoice_detail`.`InvoiceMasterID`))) join `party` on((`invoice_master`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_rev_exp`
--
DROP TABLE IF EXISTS `v_rev_exp`;

CREATE OR REPLACE VIEW `v_rev_exp`  AS SELECT (sum(if((`v_journal`.`Cr` is null),0,`v_journal`.`Cr`)) - sum(if((`v_journal`.`Dr` is null),0,`v_journal`.`Dr`))) AS `Rev`, 0 AS `Exp`, date_format(`v_journal`.`Date`,'%M-%Y') AS `DATE_FORMAT(date,'%M-%Y')`, date_format(`v_journal`.`Date`,'%m-%Y') AS `date_format(``v_journal``.``Date``,'%m-%Y')` FROM `v_journal` WHERE (`v_journal`.`CODE` = 'r') GROUP BY date_format(`v_journal`.`Date`,'%M-%Y'), date_format(`v_journal`.`Date`,'%m-%Y'), `v_journal`.`CODE`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_rev_exp_chart`
--
DROP TABLE IF EXISTS `v_rev_exp_chart`;

CREATE OR REPLACE VIEW `v_rev_exp_chart`  AS SELECT abs(round(sum(`v_rev_exp`.`Rev`),0)) AS `Rev`, abs(round(sum(`v_rev_exp`.`Exp`),0)) AS `Exp`, `v_rev_exp`.`DATE_FORMAT(date,'%M-%Y')` AS `MonthName` FROM `v_rev_exp` GROUP BY `v_rev_exp`.`DATE_FORMAT(date,'%M-%Y')` ORDER BY `v_rev_exp`.`DATE_FORMAT(date,'%M-%Y')` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_sticker`
--
DROP TABLE IF EXISTS `v_sticker`;

CREATE OR REPLACE VIEW `v_sticker`  AS SELECT sum(`sticker`.`qty`) AS `qty`, `item`.`ItemName` AS `name`, `item`.`SellingPrice` AS `price`, `item`.`ItemID` AS `code` FROM (`sticker` join `item` on((`sticker`.`itemid` = `item`.`ItemID`))) GROUP BY `sticker`.`itemid`, `item`.`ItemName`, `item`.`SellingPrice`, `item`.`ItemID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_supplier`
--
DROP TABLE IF EXISTS `v_supplier`;

CREATE OR REPLACE VIEW `v_supplier`  AS SELECT `supplier`.`SupplierID` AS `SupplierID`, `supplier`.`SupplierName` AS `SupplierName`, `supplier`.`TRN` AS `TRN`, `supplier`.`Address` AS `Address`, `supplier`.`Mobile` AS `Mobile`, `supplier`.`Phone` AS `Phone`, `supplier`.`Email` AS `Email`, `supplier`.`Website` AS `Website`, `supplier`.`Active` AS `Active`, `supplier`.`InvoiceDueDays` AS `InvoiceDueDays`, `supplier`.`eDate` AS `eDate` FROM `supplier`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_supplier_balance`
--
DROP TABLE IF EXISTS `v_supplier_balance`;

CREATE OR REPLACE VIEW `v_supplier_balance`  AS SELECT `journal`.`SupplierID` AS `SupplierID`, date_format(`journal`.`Date`,'%b-%Y') AS `Date`, sum(if((`journal`.`Dr` is null),0,`journal`.`Dr`)) AS `Dr`, sum(if((`journal`.`Cr` is null),0,`journal`.`Cr`)) AS `Cr`, sum((if((`journal`.`Dr` is null),0,`journal`.`Dr`) - if((`journal`.`Cr` is null),0,`journal`.`Cr`))) AS `Balance` FROM `journal` WHERE (`journal`.`ChartOfAccountID` = 210100) GROUP BY `journal`.`SupplierID`, date_format(`journal`.`Date`,'%b-%Y')  ;

-- --------------------------------------------------------

--
-- Structure for view `v_supplier_outstanding`
--
DROP TABLE IF EXISTS `v_supplier_outstanding`;

CREATE OR REPLACE VIEW `v_supplier_outstanding`  AS SELECT `v_journal`.`InvoiceMasterID` AS `InvoiceMasterID`, `v_journal`.`PartyID` AS `PartyID`, `v_journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`DueDate` AS `DueDate`, sum(ifnull(`v_journal`.`Dr`,0)) AS `PAID`, abs((sum(ifnull(`v_journal`.`Dr`,0)) - sum(ifnull(`v_journal`.`Cr`,0)))) AS `BALANCE`, `v_journal`.`SupplierID` AS `SupplierID`, `invoice_master`.`GrandTotal` AS `GrandTotal` FROM (`v_journal` join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `v_journal`.`InvoiceMasterID`))) WHERE (((`v_journal`.`VHNO` like 'BILL%') OR (`v_journal`.`VHNO` like 'BILLPAY%')) AND (`v_journal`.`ChartOfAccountID` = 210100)) GROUP BY `v_journal`.`InvoiceMasterID`, `v_journal`.`PartyID`, `v_journal`.`ChartOfAccountID`, `v_journal`.`ChartOfAccountName`, `invoice_master`.`InvoiceNo`, `invoice_master`.`Date`, `invoice_master`.`DueDate`, `invoice_master`.`GrandTotal`, `v_journal`.`SupplierID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_supplier_over_balance`
--
DROP TABLE IF EXISTS `v_supplier_over_balance`;

CREATE OR REPLACE VIEW `v_supplier_over_balance`  AS SELECT `v_supplier_outstanding`.`SupplierID` AS `SupplierID`, sum(`v_supplier_outstanding`.`BALANCE`) AS `BALANCE` FROM `v_supplier_outstanding` GROUP BY `v_supplier_outstanding`.`SupplierID`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_test`
--
DROP TABLE IF EXISTS `v_test`;

CREATE OR REPLACE VIEW `v_test`  AS SELECT `item`.`ItemID` AS `ItemID`, `item`.`ItemName` AS `ItemName`, `invoice_detail`.`ItemID` AS `T1`, `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID` FROM ((`item` join `invoice_detail` on((`item`.`ItemID` = `invoice_detail`.`ItemID`))) join `invoice_master` on((`invoice_master`.`InvoiceMasterID` = `invoice_detail`.`InvoiceMasterID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_trial`
--
DROP TABLE IF EXISTS `v_trial`;

CREATE OR REPLACE VIEW `v_trial`  AS SELECT `v_journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName`, sum(ifnull(`v_journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`v_journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`v_journal`.`Dr`,0)) - sum(ifnull(`v_journal`.`Cr`,0))) AS `Balance` FROM `v_journal` GROUP BY `v_journal`.`ChartOfAccountID`, `v_journal`.`ChartOfAccountName` ORDER BY `v_journal`.`ChartOfAccountName` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_trialreport`
--
DROP TABLE IF EXISTS `v_trialreport`;

CREATE OR REPLACE VIEW `v_trialreport`  AS SELECT `v_journal`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_journal`.`ChartOfAccountName` AS `ChartOfAccountName`, sum(ifnull(`v_journal`.`Dr`,0)) AS `Dr`, sum(ifnull(`v_journal`.`Cr`,0)) AS `Cr`, (sum(ifnull(`v_journal`.`Dr`,0)) - sum(ifnull(`v_journal`.`Cr`,0))) AS `Balance` FROM `v_journal` GROUP BY `v_journal`.`ChartOfAccountID`, `v_journal`.`ChartOfAccountName` ORDER BY `v_journal`.`ChartOfAccountName` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_trial_balance`
--
DROP TABLE IF EXISTS `v_trial_balance`;

CREATE OR REPLACE VIEW `v_trial_balance`  AS SELECT `v_trial`.`ChartOfAccountID` AS `ChartOfAccountID`, `v_trial`.`ChartOfAccountName` AS `ChartOfAccountName`, if((`v_trial`.`Balance` >= 0),`v_trial`.`Balance`,0) AS `Dr`, if((`v_trial`.`Balance` < 0),abs(`v_trial`.`Balance`),0) AS `Cr` FROM `v_trial`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_voucher`
--
DROP TABLE IF EXISTS `v_voucher`;

CREATE OR REPLACE VIEW `v_voucher`  AS SELECT `voucher_master`.`VoucherMstID` AS `VoucherMstID`, `voucher_type`.`VoucherCode` AS `VoucherCode`, `voucher_type`.`VoucherTypeName` AS `VoucherTypeName`, `voucher_master`.`Voucher` AS `Voucher`, `voucher_master`.`Date` AS `Date`, `voucher_master`.`Narration` AS `Narration` FROM (`voucher_master` join `voucher_type` on((`voucher_master`.`VoucherCodeID` = `voucher_type`.`VoucherTypeID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_voucher_detail`
--
DROP TABLE IF EXISTS `v_voucher_detail`;

CREATE OR REPLACE VIEW `v_voucher_detail`  AS SELECT `voucher_master`.`VoucherMstID` AS `VoucherMstID`, `voucher_master`.`VoucherCodeID` AS `VoucherCodeID`, `voucher_master`.`Voucher` AS `Voucher`, `voucher_master`.`Narration` AS `NarrationMaster`, `voucher_detail`.`Date` AS `Date`, `voucher_detail`.`ChOfAcc` AS `ChOfAcc`, `chartofaccount`.`ChartOfAccountName` AS `ChartOfAccountName`, `voucher_detail`.`Debit` AS `Debit`, `voucher_detail`.`Credit` AS `Credit`, `voucher_detail`.`InvoiceNo` AS `InvoiceNo`, `voucher_detail`.`Narration` AS `Narration`, `voucher_detail`.`SupplierID` AS `SupplierID`, `voucher_detail`.`PartyID` AS `PartyID`, `voucher_detail`.`RefNo` AS `RefNo`, `party`.`PartyName` AS `PartyName`, `supplier`.`SupplierName` AS `SupplierName` FROM ((((`voucher_detail` join `voucher_master` on((`voucher_master`.`VoucherMstID` = `voucher_detail`.`VoucherMstID`))) join `chartofaccount` on((`chartofaccount`.`ChartOfAccountID` = `voucher_detail`.`ChOfAcc`))) left join `party` on((`voucher_detail`.`PartyID` = `party`.`PartyID`))) left join `supplier` on((`voucher_detail`.`SupplierID` = `supplier`.`SupplierID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_voucher_master`
--
DROP TABLE IF EXISTS `v_voucher_master`;

CREATE OR REPLACE VIEW `v_voucher_master`  AS SELECT `voucher_master`.`VoucherMstID` AS `VoucherMstID`, `voucher_master`.`VoucherCodeID` AS `VoucherCodeID`, `voucher_master`.`Voucher` AS `Voucher`, `voucher_master`.`Date` AS `Date`, `voucher_master`.`Narration` AS `Narration`, `voucher_type`.`VoucherTypeID` AS `VoucherTypeID`, `voucher_type`.`VoucherCode` AS `VoucherCode`, `voucher_type`.`VoucherTypeName` AS `VoucherTypeName`, `voucher_detail`.`PartyID` AS `PartyID`, `party`.`PartyName` AS `PartyName`, `voucher_detail`.`Debit` AS `Debit`, `voucher_detail`.`Credit` AS `Credit` FROM (((`voucher_master` join `voucher_type` on((`voucher_master`.`VoucherCodeID` = `voucher_type`.`VoucherTypeID`))) join `voucher_detail` on((`voucher_master`.`VoucherMstID` = `voucher_detail`.`VoucherMstID`))) join `party` on((`voucher_detail`.`PartyID` = `party`.`PartyID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_warehouse_stock_transfer`
--
DROP TABLE IF EXISTS `v_warehouse_stock_transfer`;

CREATE OR REPLACE VIEW `v_warehouse_stock_transfer`  AS SELECT `invoice_master`.`InvoiceMasterID` AS `InvoiceMasterID`, `invoice_master`.`WarehouseID` AS `WarehouseID`, `warehouses`.`name` AS `WarehouseName`, `w`.`name` AS `otherWareHouse`, `invoice_master`.`Date` AS `Date`, `invoice_master`.`UserID` AS `UserID`, `invoice_master`.`PaymentMode` AS `PaymentMode`, `invoice_master`.`InvoiceNo` AS `InvoiceNo`, `invoice_master`.`TotalQty` AS `TotalQty`, `invoice_master`.`CustomerNotes` AS `CustomerNotes`, `invoice_master`.`Subject` AS `Subject`, `invoice_master`.`WalkinCustomerName` AS `WalkinCustomerName`, `invoice_master`.`DescriptionNotes` AS `DescriptionNotes` FROM ((`invoice_master` join `warehouses` on((`warehouses`.`id` = `invoice_master`.`WarehouseID`))) join `warehouses` `w` on((`w`.`id` = `invoice_master`.`otherWareHouseID`))) WHERE ((`invoice_master`.`InvoiceNo` like 'WIN%') OR (`invoice_master`.`InvoiceNo` like 'WOUT%')) ORDER BY `invoice_master`.`InvoiceMasterID` ASC  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`AirLineID`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_fk_360714` (`client_id`),
  ADD KEY `employee_fk_360715` (`employee_id`);

--
-- Indexes for table `appointment_service`
--
ALTER TABLE `appointment_service`
  ADD KEY `appointment_id_fk_360720` (`appointment_id`),
  ADD KEY `service_id_fk_360720` (`service_id`);

--
-- Indexes for table `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`AttachmentID`);

--
-- Indexes for table `billers`
--
ALTER TABLE `billers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`InvoiceDetailID`);

--
-- Indexes for table `bill_master`
--
ALTER TABLE `bill_master`
  ADD PRIMARY KEY (`InvoiceMasterID`),
  ADD KEY `InvoiceTypeID` (`InvoiceNo`),
  ADD KEY `invoice_master_ibfk_2` (`PartyID`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`BranchID`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `challan_detail`
--
ALTER TABLE `challan_detail`
  ADD PRIMARY KEY (`ChallanDetailID`);

--
-- Indexes for table `challan_master`
--
ALTER TABLE `challan_master`
  ADD PRIMARY KEY (`ChallanMasterID`);

--
-- Indexes for table `challan_type`
--
ALTER TABLE `challan_type`
  ADD PRIMARY KEY (`ChallanTypeID`);

--
-- Indexes for table `chartofaccount`
--
ALTER TABLE `chartofaccount`
  ADD PRIMARY KEY (`ChartOfAccountID`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`CompanyID`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_images`
--
ALTER TABLE `dish_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_recipes`
--
ALTER TABLE `dish_recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_tables`
--
ALTER TABLE `dish_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_types`
--
ALTER TABLE `dish_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estimate_detail`
--
ALTER TABLE `estimate_detail`
  ADD PRIMARY KEY (`EstimateDetailID`);

--
-- Indexes for table `estimate_master`
--
ALTER TABLE `estimate_master`
  ADD PRIMARY KEY (`EstimateMasterID`);

--
-- Indexes for table `expense_detail`
--
ALTER TABLE `expense_detail`
  ADD PRIMARY KEY (`ExpenseDetailID`);

--
-- Indexes for table `expense_master`
--
ALTER TABLE `expense_master`
  ADD PRIMARY KEY (`ExpenseMasterID`);

--
-- Indexes for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`InvoiceDetailID`);

--
-- Indexes for table `invoice_dish_details`
--
ALTER TABLE `invoice_dish_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_master`
--
ALTER TABLE `invoice_master`
  ADD PRIMARY KEY (`InvoiceMasterID`),
  ADD KEY `InvoiceTypeID` (`InvoiceNo`),
  ADD KEY `invoice_master_ibfk_2` (`PartyID`);

--
-- Indexes for table `invoice_type`
--
ALTER TABLE `invoice_type`
  ADD PRIMARY KEY (`InvoiceTypeID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`ItemCategoryID`);

--
-- Indexes for table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`JournalID`),
  ADD KEY `VoucherMstID` (`VoucherMstID`),
  ADD KEY `PettyMstID` (`PettyMstID`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `party`
--
ALTER TABLE `party`
  ADD PRIMARY KEY (`PartyID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`paymentID`);

--
-- Indexes for table `payment_detail`
--
ALTER TABLE `payment_detail`
  ADD PRIMARY KEY (`PaymentDetailID`);

--
-- Indexes for table `payment_master`
--
ALTER TABLE `payment_master`
  ADD PRIMARY KEY (`PaymentMasterID`);

--
-- Indexes for table `payment_mode`
--
ALTER TABLE `payment_mode`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `payment_with_credit_cards`
--
ALTER TABLE `payment_with_credit_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pettycash_detail`
--
ALTER TABLE `pettycash_detail`
  ADD PRIMARY KEY (`PettyDetID`),
  ADD KEY `PettyMstID` (`PettyMstID`);

--
-- Indexes for table `pettycash_master`
--
ALTER TABLE `pettycash_master`
  ADD PRIMARY KEY (`PettyMstID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchasepayment_detail`
--
ALTER TABLE `purchasepayment_detail`
  ADD PRIMARY KEY (`PurchasePaymentDetailID`);

--
-- Indexes for table `purchasepayment_master`
--
ALTER TABLE `purchasepayment_master`
  ADD PRIMARY KEY (`PurchasePaymentMasterID`);

--
-- Indexes for table `purchase_order_detail`
--
ALTER TABLE `purchase_order_detail`
  ADD PRIMARY KEY (`PurchaseOrderDetailID`);

--
-- Indexes for table `purchase_order_master`
--
ALTER TABLE `purchase_order_master`
  ADD PRIMARY KEY (`PurchaseOrderMasterID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RoleID`);

--
-- Indexes for table `runtotaltestdata`
--
ALTER TABLE `runtotaltestdata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sticker`
--
ALTER TABLE `sticker`
  ADD PRIMARY KEY (`stickerid`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`);

--
-- Indexes for table `supplier_category`
--
ALTER TABLE `supplier_category`
  ADD PRIMARY KEY (`SupplierCatID`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`TaxID`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`UnitID`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`RoleId`);

--
-- Indexes for table `voucher_detail`
--
ALTER TABLE `voucher_detail`
  ADD PRIMARY KEY (`VoucherDetID`),
  ADD KEY `VoucherMstID` (`VoucherMstID`);

--
-- Indexes for table `voucher_master`
--
ALTER TABLE `voucher_master`
  ADD PRIMARY KEY (`VoucherMstID`);

--
-- Indexes for table `voucher_type`
--
ALTER TABLE `voucher_type`
  ADD PRIMARY KEY (`VoucherTypeID`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airline`
--
ALTER TABLE `airline`
  MODIFY `AirLineID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachment`
--
ALTER TABLE `attachment`
  MODIFY `AttachmentID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `InvoiceDetailID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_master`
--
ALTER TABLE `bill_master`
  MODIFY `InvoiceMasterID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `BranchID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `challan_detail`
--
ALTER TABLE `challan_detail`
  MODIFY `ChallanDetailID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `challan_master`
--
ALTER TABLE `challan_master`
  MODIFY `ChallanMasterID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=399;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dish_images`
--
ALTER TABLE `dish_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dish_recipes`
--
ALTER TABLE `dish_recipes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dish_tables`
--
ALTER TABLE `dish_tables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dish_types`
--
ALTER TABLE `dish_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `estimate_detail`
--
ALTER TABLE `estimate_detail`
  MODIFY `EstimateDetailID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimate_master`
--
ALTER TABLE `estimate_master`
  MODIFY `EstimateMasterID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  MODIFY `InvoiceDetailID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice_dish_details`
--
ALTER TABLE `invoice_dish_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_master`
--
ALTER TABLE `invoice_master`
  MODIFY `InvoiceMasterID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice_type`
--
ALTER TABLE `invoice_type`
  MODIFY `InvoiceTypeID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `ItemID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `ItemCategoryID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `journal`
--
ALTER TABLE `journal`
  MODIFY `JournalID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `party`
--
ALTER TABLE `party`
  MODIFY `PartyID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2219;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `paymentID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_detail`
--
ALTER TABLE `payment_detail`
  MODIFY `PaymentDetailID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_master`
--
ALTER TABLE `payment_master`
  MODIFY `PaymentMasterID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_mode`
--
ALTER TABLE `payment_mode`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_with_credit_cards`
--
ALTER TABLE `payment_with_credit_cards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pettycash_detail`
--
ALTER TABLE `pettycash_detail`
  MODIFY `PettyDetID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pettycash_master`
--
ALTER TABLE `pettycash_master`
  MODIFY `PettyMstID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchasepayment_detail`
--
ALTER TABLE `purchasepayment_detail`
  MODIFY `PurchasePaymentDetailID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchasepayment_master`
--
ALTER TABLE `purchasepayment_master`
  MODIFY `PurchasePaymentMasterID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_order_detail`
--
ALTER TABLE `purchase_order_detail`
  MODIFY `PurchaseOrderDetailID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_master`
--
ALTER TABLE `purchase_order_master`
  MODIFY `PurchaseOrderMasterID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `RoleID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `runtotaltestdata`
--
ALTER TABLE `runtotaltestdata`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sticker`
--
ALTER TABLE `sticker`
  MODIFY `stickerid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `SupplierID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2219;

--
-- AUTO_INCREMENT for table `supplier_category`
--
ALTER TABLE `supplier_category`
  MODIFY `SupplierCatID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `TaxID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `UnitID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `RoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4556;

--
-- AUTO_INCREMENT for table `voucher_detail`
--
ALTER TABLE `voucher_detail`
  MODIFY `VoucherDetID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voucher_master`
--
ALTER TABLE `voucher_master`
  MODIFY `VoucherMstID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voucher_type`
--
ALTER TABLE `voucher_type`
  MODIFY `VoucherTypeID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `journal`
--
ALTER TABLE `journal`
  ADD CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`VoucherMstID`) REFERENCES `voucher_master` (`VoucherMstID`) ON DELETE CASCADE,
  ADD CONSTRAINT `journal_ibfk_2` FOREIGN KEY (`PettyMstID`) REFERENCES `pettycash_master` (`PettyMstID`) ON DELETE CASCADE;

--
-- Constraints for table `pettycash_detail`
--
ALTER TABLE `pettycash_detail`
  ADD CONSTRAINT `pettycash_detail_ibfk_1` FOREIGN KEY (`PettyMstID`) REFERENCES `pettycash_master` (`PettyMstID`) ON DELETE CASCADE;

--
-- Constraints for table `voucher_detail`
--
ALTER TABLE `voucher_detail`
  ADD CONSTRAINT `voucher_detail_ibfk_1` FOREIGN KEY (`VoucherMstID`) REFERENCES `voucher_master` (`VoucherMstID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
