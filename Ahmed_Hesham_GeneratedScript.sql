USE [master]
GO
/****** Object:  Database [ChemiCleanDB]    Script Date: 10/22/2019 3:21:16 AM ******/
CREATE DATABASE [ChemiCleanDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChemiCleanDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ChemiCleanDB.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ChemiCleanDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ChemiCleanDB_log.ldf' , SIZE = 39296KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ChemiCleanDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChemiCleanDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChemiCleanDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChemiCleanDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChemiCleanDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChemiCleanDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChemiCleanDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ChemiCleanDB] SET  MULTI_USER 
GO
ALTER DATABASE [ChemiCleanDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChemiCleanDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChemiCleanDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChemiCleanDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ChemiCleanDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ChemiCleanDB', N'ON'
GO
USE [ChemiCleanDB]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 10/22/2019 3:21:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](250) NOT NULL,
	[SupplierName] [nvarchar](250) NULL,
	[Url] [nvarchar](300) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[DocumentAvailable] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProductDocument]    Script Date: 10/22/2019 3:21:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProductDocument](
	[DocumentContent] [varbinary](max) NULL,
	[LastModifiedDate] [datetime] NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_tblProductDocument] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (1, N'Ahmed', N'Yxhult/Svesten AB', N'http://www.orimi.com/pdf-test.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (2, N'Addinol Semi Synth Mv 1047', N'Addinol Lube Oil GmbH', N'http://www.addinol.de/oilfinder/show_msds.php?id=38163', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (3, N'Addinol Super Ligth Mv 0546', N'Addinol Lube Oil GmbH', N'http://www.addinol.de/oilfinder/show_msds.php?id=43475', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (4, N'Anderol 6150', N'Anderol BV', N'http://www.anderol-europe.com/images/anderol/msds/SV__ANDEROL%206150_6150_SDS_20111020__ANDEROL_.PDF', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (5, N'Anderol FGH 32', N'Anderol BV', N'http://www.anderol-europe.com/images/anderol/msds/SV__ANDEROL%20FGH%2032_FGH%2032_SDS_20111129__ANDEROL_.PDF', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (6, N'Anti-static fluid', N'Xerox', N'http://www.xerox.com/download/ehs/msds/4-0071.da.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (7, N'Bell®', N'Hedegaard A/S', N'http://datablade.dlaagro.com/Bell_-_150911.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (8, N'Beskyttelsescreme', N'Care Repair', N'http://www.care-repair.dk/pdf_out/120.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (9, N'Biopower', N'Hedegaard A/S', N'http://www.middeldatabasen.dk/pdf/msds/Biopower_MSDS_20080901.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (10, N'Bison Plastlim', N'Nilfisk-Frithiof', N'http://www.nilfisk-frithiof.dk/files/pdf/produktdatablad_pvc_lim.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (11, N'Blasocut® Bc 35 Kombi', N'Duroc Machine Tools A/S', N'http://www.duroc.com/media/782154/sikkerhedsdatablad_-_blasocut_bc_35_kombi.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (12, N'Bore-Skære-Olie (Sprayprodukt)', N'Care Repair', N'http://www.care-repair.dk/pdf_out/570.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (13, N'Briotril 400 EC', N'Hedegaard A/S', N'http://www.makhteshim-agan.nl/beheer/plaat/15207031DK%20Briotril%20400EC%20%28DK%29.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (14, N'Buffer 4.0', N'Reagecon Diagnostics Limited', N'http://www.certs.reagecon.com/msds/da_/JR_2822_15da_.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (15, N'Buffer Rlt', N'Qiagen Danmark, Filial Af Qiagen AB, Sverige', N'http://www.qiagen.com/data/Support/MSDS/DK/Buffer_RLT_DK7.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (16, N'Buffer RLT plus', N'Qiagen Danmark, Filial Af Qiagen AB, Sverige', N'http://www.qiagen.com/data/Support/MSDS/DK/Buffer_RLT_plus_DK5.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (17, N'Buffer RW1', N'Qiagen Danmark, Filial Af Qiagen AB, Sverige', N'http://www.qiagen.com/data/Support/MSDS/DK/Buffer_RW1_DK7.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (18, N'C5-A Copper Anti-Seize Stick', N'Henkel Norden AB', N'http://mymsds.henkel.com/mymsds/0006.466863.7200.sv.MSDS_UT_SE.SE.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (19, N'Cæsium format opløsning', N'Cabot Specialty Fluids', N'http://www.formatebrines.com/Portals/2/Datasheets/CESFORMSOL-EUR-DA.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (20, N'Callisto', N'Hedegaard A/S', N'http://www.syngenta.com/country/dk/da/plantebeskyttelse/produkter/ukrudtsmidler/Documents/Callisto-SDS.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (21, N'Citronsyramonohydrat Pulver Ph.eur.', N'VWR International AB', N'https://se.vwr.com/app/asset?type=hi_res&id=7670430&name=sds_VWRC85514&filename=7670430.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (22, N'Cool Down', N'Care Repair', N'http://www.care-repair.dk/pdf_out/479.pdf', N'87456709', N'chemicontrol', 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (23, N'Creatine Monohydrate Biochemica', N'AppliChem GmbH', N'http://www.applichem.com/fileadmin/datenblaetter/A3132_da_DK.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (24, N'Daglig Rengøring', N'Stonetreatment ApS', N'http://www.stonetreatment.dk/media/784/lba-daglig_rengoring.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (25, N'Daglig Rengøring', N'Stonetreatment ApS', N'http://www.stonetreatment.dk/media/784/lba-daglig_rengoring.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (26, N'Delaval Mastitis Test Cmt', N'DELAVAL A/S', N'http://www.delaval.dk/ImageVaultFiles/id_6409/cf_5/DeLavalMastitisTestCMT.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (27, N'Diammoniumperoxodisulfat', N'AppliChem GmbH', N'http://www.applichem.com/fileadmin/datenblaetter/A0834_da_DK.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (28, N'DynoRex', N'Orica Denmark A/S', N'http://www.oricaminingservices.com/download/file_id_11666/', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (29, N'Eclipse Hard Floor Sealer', N'PETER LUDVIGSEN A/S', N'http://www.peter-ludvigsen.dk/pdf/pioneer/Hard_Floor_Sealer.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (30, N'Eclipse Neutral Cleaner', N'PETER LUDVIGSEN A/S', N'http://www.peter-ludvigsen.dk/pdf/pioneer/Neutral_Cleaner.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (31, N'Edta Calibration Sample', N'Leco Corporation  Svenska AB', N'http://arkiv.lecoswe.se/pdf/MSDS/DK/502-092(DK).pdf', N'lecocust', N'pdffiles', 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (32, N'Eletronic-Spray 200ml Art.: 2832', N'Auto-G Holstebro A/S', N'http://www.chemical-check.de/clientversion/pdf1/566/2832_0008_03-11-2009_DA.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (33, N'Ferodo Dot 4 Esp', N'Aktieselskabet Carl Christensen', N'http://www.msystem.dk/consumer/sikkerhedsdatablad.aspx?kid=6801', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (34, N'Flamol B', N'A B PLANTESERVICE', N'http://www.flamol.dk/Flamol%20B.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (35, N'Flamol K', N'A B PLANTESERVICE', N'http://www.flamol.dk/Flamol%20K.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (36, N'Foodmax Bore- & Monteringspasta', N'Care Repair', N'http://www.care-repair.dk/pdf_out/H590.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (37, N'Furnace Reagent', N'Leco Corporation  Svenska AB', N'http://arkiv.lecoswe.se/pdf/MSDS/DK/501-609-HAZ(DK).pdf', N'lecocust', N'pdffiles', 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (38, N'Glyphomax* Herbicide (naf-595)', N'Hedegaard A/S', N'http://www.middeldatabasen.dk/pdf/MSDS/Glyphomax_MSDS_20101029.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (39, N'Graco Pump Armor', N'GRACO N.V.', N'http://gww.graco.com/docs/MSDS/Danish/MSD029A.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (40, N'Grease Spray', N'Care Repair', N'http://www.care-repair.dk/pdf_out/H588.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (41, N'Grundrens', N'Care Repair', N'http://www.care-repair.dk/pdf_out/360.pdf', N'87456709', N'chemicontrol', 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (42, N'Hakupur 19-283', N'Jens Linde A/S', N'http://jenslinde.dk/userfiles/image/PDF/HAKUPUR_19-283.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (43, N'Hydrochloric Acid 1.128 % (w/v) P. A.', N'AppliChem GmbH', N'http://www.applichem.com/fileadmin/datenblaetter/A2768_da_DK.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (44, N'Hylomar Universal Blue', N'Ermax A/S', N'http://www.ermax.dk/Files/Filer/nyErmax/Servicevejledninger/hylomar_universal_blue.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (45, N'Hylomar Universal Blue', N'Ermax A/S', N'http://www.ermax.dk/Files/Filer/nyErmax/Servicevejledninger/hylomar_universal_blue.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (46, N'Kalkfjerner Super', N'Care Repair', N'http://www.care-repair.dk/pdf_out/208.pdf', N'87456709', N'chemicontrol', 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (47, N'Kerb 500 Sc Herbicide', N'Hedegaard A/S', N'http://planteapp.dlbr.dk/Middeldatabasen/pdf/msds/Kerb%20500SC_MSDS_20060607.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (48, N'Kt Flyvrustfjerner', N'KlarTek Danmark ApS', N'http://www.klartek.dk/datablade/1319020820__-_KT-Flugrostentferner_PKW_(DK.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (49, N'Kt Lawine Blau Vollwaschpulver', N'KlarTek Danmark ApS', N'http://www.klartek.dk/datablade/1320329081__-_KT_Lawine_Blau_Vollwaschpulver_(DK.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (50, N'Kvartssand', N'Dansk Kvarts Industri A/S', N'http://www.kvarts.dk/files/manager/kvartssand.pdf?viewer=true', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (51, N'LM 40 Multi-Funktions-Spray 400ml Art.:2816', N'Auto-G Holstebro A/S', N'http://www.chemical-check.de/clientversion/pdf1/566/2816_0009_24-02-2010_DA.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (52, N'Loctite 561', N'Henkel Norden AB', N'http://mymsds.henkel.com/mymsds/0006.540917.7200.sv.MSDS_UT_SE.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (53, N'Loctite 668', N'Henkel Norden AB', N'http://mymsds.henkel.com/mymsds/0006.705002.7200.sv.MSDS_UT_SE.SE.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (54, N'Maintenancespray White 250ml Art.:2872', N'Auto-G Holstebro A/S', N'http://www.chemical-check.de/clientversion/pdf1/566/2872_0011_06-07-2009_DA.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (55, N'Mangansulfat Monohydrat', N'Hedegaard A/S', N'http://planteapp.dlbr.dk/middeldatabasen/pdf/MSDS/Mangansulfat_32_MSDS_20091208.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (56, N'Montage-Lim', N'Care Repair', N'http://www.care-repair.dk/pdf_out/432.pdf', N'87456709', N'chemicontrol', 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (57, N'Myremiddel Til Udvanding', N'TANACO DANMARK A/S ', N'http://www.tanaco.dk/cms/modules/ContentExpress/img_repository/Myremiddel%20til%20udvanding.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (58, N'Nicanor 20 Sg', N'Hedegaard A/S', N'http://www.makhteshim-agan.nl/beheer/plaat/Nicanor%2020SG%20%28H%29%20%28DK%29.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (59, N'Nitric Acid - Standard Volumetric Acid (0.5 M)', N'AppliChem GmbH', N'http://www.applichem.com/fileadmin/datenblaetter/A2690_da_DK.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (60, N'Nitric Acid 20 % Technical Grade', N'AppliChem GmbH', N'http://www.applichem.com/fileadmin/datenblaetter/A0940_da_DK.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (61, N'Nobelcord, F-cord 10, E-cord', N'Orica Denmark A/S', N'http://www.oricaminingservices.com/download/file_id_11755/', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (62, N'Nobelit EP', N'Orica Denmark A/S', N'http://www.orimi.com/pdf-test.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (63, N'Notrac Museblok', N'Mortalin Produktion ApS', N'http://www.mortalin.dk/files/pdf/Notrac_Museblok_28_g_vers_2_7-3-20011.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (64, N'Notrac Museblok 28 g', N'Mortalin Produktion ApS', N'http://www.mortalin.dk/files/pdf/Notrac_Rotteblok_28_g_-_bromadiolon_-_MSDS_-vers_2_7-3-20011.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (65, N'Notrac Rotteblok 28 g', N'Mortalin Produktion ApS', N'http://www.mortalin.dk/files/pdf/Notrac_Rotteblok_28_g_-_bromadiolon_-_MSDS_-vers_2_7-3-20011.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (66, N'Opticid', N'DELAVAL A/S', N'http://www.delaval.dk/ImageVaultFiles/id_13546/cf_5/OptiCid_dk.PDF', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (67, N'Pirimor G', N'Hedegaard A/S', N'http://www.syngenta.com/country/dk/SiteCollectionDocuments/Pirimor-SDS-DK.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (68, N'Potassium Dichromate - Standard Volumetric Solution (0.033 M) For Cod-determination', N'AppliChem GmbH', N'http://www.applichem.com/fileadmin/datenblaetter/A3319_da_DK.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (69, N'Potassium Ferrocyanide Trihydrate P. A.', N'AppliChem GmbH', N'http://www.applichem.com/fileadmin/datenblaetter/A1867_da_DK.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (70, N'Pyrethrum Mod Fluer', N'TANACO DANMARK A/S ', N'http://www.tanaco.dk/cms/modules/ContentExpress/img_repository/Pyrethrum.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (71, N'R10 Lugtfjerner', N'Trade Nordic', N'http://shop.mediqdanmark.dk/web_filer/72/72-90-R10%20sikkerhedsdatablad%20DK.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (72, N'Rebound Cleaner/Enhancer', N'PETER LUDVIGSEN A/S', N'http://www.peter-ludvigsen.dk/pdf/pioneer/Rebound_Cleaner.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (73, N'RTU Xtra, bag in can', N'TANACO DANMARK A/S ', N'http://www.tanaco.dk/cms/modules/ContentExpress/img_repository/RTU%20Xtra,%20bic.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (74, N'Schnellreiniger 5l', N'Auto-G Holstebro A/S', N'http://www.autog.dk/Admin/Public/DWSDownload.aspx?File=Files%2fFiler%2fDatablade%2f2824.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (75, N'Silicone Spray', N'Care Repair', N'http://www.care-repair.dk/pdf_out/H580.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (76, N'Siliconspray 300ml Art.: 2899', N'Auto-G Holstebro A/S', N'http://www.chemical-check.de/clientversion/pdf1/566/2899_0009_29-06-2009_DA.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (77, N'Silvernitrat 0,1 Mol/l (0,1 N) Vattenlösning Avs Titrinorm® Volumetrisk  Lösning', N'VWR International AB', N'https://se.vwr.com/app/asset?type=hi_res&id=7901949&name=sds_VWRC30472&filename=7901949.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (78, N'Sol Lotion Faktor 30', N'Care Repair', N'http://www.care-repair.dk/pdf_out/132.pdf', N'87456709', N'chemicontrol', 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (79, N'Stald Chok D', N'TANACO DANMARK A/S ', N'http://www.tanaco.dk/cms/modules/ContentExpress/img_repository/Stald%20Chok.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (80, N'Stonetreatment Daglig Rengøring', N'Stonetreatment ApS', N'http://www.stonetreatment.dk/media/784/lba-daglig_rengoring.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (81, N'Stonetreatment Grundrengøring', N'Stonetreatment ApS', N'http://www.stonetreatment.dk/media/719/lba-grundrengoring.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (82, N'Stonetreatment Grundrengøring', N'Stonetreatment ApS', N'http://www.stonetreatment.dk/media/719/lba-grundrengoring.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (83, N'Super', N'DELAVAL A/S', N'http://www.delaval.dk/ImageVaultFiles/id_13553/cf_5/Super.PDF', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (84, N'Svovlsyre 50 %', N'AppliChem GmbH', N'http://www.applichem.com/fileadmin/datenblaetter/A2102_da_DK.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (85, N'SWEPCO 101 Moly Grease', N'Lubco Danmark', N'http://swepcousa.com/lubesite/lubemsds/101%20Danish.pdf', N'MSDSlube', N'$Rep1933', 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (86, N'Swepco 121 Tri-Plex Universal Grease', N'Lubco Danmark', N'http://swepcousa.com/lubesite/lubemsds/121%20Danish.pdf', N'MSDSlube', N'$Rep1933', 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (87, N'Swepco 815 Food Machinery Grease (Aerosol)', N'Lubco Danmark', N'http://swepcousa.com/lubesite/lubemsds/815%20Danish%20UN1950.pdf', N'MSDSlube', N'$Rep1933', 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (88, N'Tacky Lube Spray 400ml Art.:2842', N'Auto-G Holstebro A/S', N'http://www.chemical-check.de/clientversion/pdf1/566/2842_0010_07-09-2010_DA.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (89, N'Toner (sort, cyan, Magenta, gul)', N'Xerox', N'http://www.xerox.com/download/ehs/msds/3-1176.da.pdf//download/ehs/msds/3-1176.da.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (90, N'Tork Premium Flydende Sæbe - Mild', N'SCA Hygiene Products A/S', N'http://img.sca-tork.com/medias/sys_master/8833033535518.pdf?mime=application%2Fpdf&realname=420501%2C+420502%2C+400505+Mild.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (91, N'Tp 100 Forte', N'KlarTek Danmark ApS', N'http://www.klartek.dk/datablade/1319017701__-_TP_100_Spezial_(DK.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (92, N'TP 400 Chassis S', N'KlarTek Danmark ApS', N'http://www.klartek.dk/datablade/1319017701__-_TP_400_Chassis_S_(DK.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (93, N'TRAFFIC AMPERE P Farve blå og grå', N'Backner ApS', N'http://www.backner.dk/contents/da/DK_Traffic_blaa_graa.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (94, N'TRAFFIC AMPERE P Farve gul og hvid', N'Backner ApS', N'http://www.backner.dk/contents/da/DK_Traffic_gul_og_hvid.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (95, N'Traffic Ampere P Farve Rød Og Grøn / Traffic Ampere P Extra Hvid', N'Backner ApS', N'http://www.backner.dk/contents/da/DK_Traffic_rod_gron_Traffic_Extra_hvid.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (96, N'Tris-(hydroxymethyl) Aminomethan (tris) Analar Normapur® Analyse Reagens', N'AppliChem GmbH', N'https://dk.vwr.com/app/asset?type=hi_res&id=7667805&name=sds_BDHA10315&filename=sds_BDHA10315.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (97, N'Tsl-væske Til Halspakning', N'GRACO N.V.', N'http://www.graco.com/content/dam/graco/tech_documents/msds/da/MSD122W.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (98, N'Vask & Voks', N'KlarTek Danmark ApS', N'http://www.klartek.dk/datablade/1319017701__-_Wash_&_Wax_(DK.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (99, N'Ventil Sauber 150ml Art.: 2809', N'Auto-G Holstebro A/S', N'http://www.chemical-check.de/clientversion/pdf1/566/2809_0012_27-04-2010_DA.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (100, N'Zinc Acetate Dihydrate P. A.', N'AppliChem GmbH', N'http://www.applichem.com/fileadmin/datenblaetter/A4324_da_DK.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (101, N'New Product Name Edit', N'New Product Supplier ', N'http://www.orimi.com/pdf-test.pdf', N'Ahmed', NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (102, N'test Url', N'test Url', N'http://www.orimi.com/pdf-test.pdf', N'test Url', NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (103, N'Bison Plastlim', N'Nilfisk-Frithiof', N'http://www.ori', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (104, N'Bison Plastlim', N'Nilfisk-Frithiof', N'https://www.applichem.com/fileadmin/datenblaetter/A3132_da_DK.pdf', NULL, NULL, 0)
GO
INSERT [dbo].[tblProduct] ([Id], [ProductName], [SupplierName], [Url], [UserName], [Password], [DocumentAvailable]) VALUES (105, N'Bison Plastlim', N'Nilfisk-Frithiof', N'http://www.orimi.com/pdf-test.pdf', NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
GO
/****** Object:  Index [UQ__tblProdu__B40CC6CC6C26CFB8]    Script Date: 10/22/2019 3:21:16 AM ******/
ALTER TABLE [dbo].[tblProductDocument] ADD UNIQUE NONCLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblProductDocument] ADD  DEFAULT (NULL) FOR [DocumentContent]
GO
ALTER TABLE [dbo].[tblProductDocument]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[tblProduct] ([Id])
GO
USE [master]
GO
ALTER DATABASE [ChemiCleanDB] SET  READ_WRITE 
GO
