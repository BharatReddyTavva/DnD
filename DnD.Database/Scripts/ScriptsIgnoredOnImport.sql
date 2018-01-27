
USE [master]
GO

/****** Object:  Database [DND]    Script Date: 11/19/2017 6:02:54 AM ******/
CREATE DATABASE [DND]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DND', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.BTHAVVA\MSSQL\DATA\DND.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DND_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.BTHAVVA\MSSQL\DATA\DND_log.ldf' , SIZE = 1792KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [DND] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DND].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [DND] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [DND] SET ANSI_NULLS OFF
GO

ALTER DATABASE [DND] SET ANSI_PADDING OFF
GO

ALTER DATABASE [DND] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [DND] SET ARITHABORT OFF
GO

ALTER DATABASE [DND] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [DND] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [DND] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [DND] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [DND] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [DND] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [DND] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [DND] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [DND] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [DND] SET  DISABLE_BROKER
GO

ALTER DATABASE [DND] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO

ALTER DATABASE [DND] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [DND] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [DND] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [DND] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [DND] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [DND] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [DND] SET RECOVERY FULL
GO

ALTER DATABASE [DND] SET  MULTI_USER
GO

ALTER DATABASE [DND] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [DND] SET DB_CHAINING OFF
GO

ALTER DATABASE [DND] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO

ALTER DATABASE [DND] SET TARGET_RECOVERY_TIME = 0 SECONDS
GO

--ALTER DATABASE [DND] SET DELAYED_DURABILITY = DISABLED
--GO

USE [DND]
GO

/****** Object:  Table [dbo].[Country]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Currency]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[CustomerGroup]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[CustomerGroupMaster]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[DealnDonePlan]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[DiscountOffer]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[DiscountOfferCustomer]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[DiscountOfferStoreOutlet]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[DiscountOfferType]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[DiscountType]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[DiscountTypeData]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[DisplayPrice]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[DNDUser]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[LabelPrinterFormat]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[PricingTier]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Product]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ProductBrand]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ProductImage]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[ProductInventory]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ProductOutletPricing]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ProductPricing]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ProductSupplier]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ProductTag]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ProductTagMaster]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ProductType]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ProductVariant]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ProductVariantAttribute]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ProductVariantAttributeMaster]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[PurchaseStockOrder]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[RegisterOpenCloseStatusType]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ReturnStockOrder]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Role]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[RoleManagement]    Script Date: 11/19/2017 6:02:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SalesTax]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SellOpenCloseRegister]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SetupAccount]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SetupAccountClearOutData]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SetupContactInformation]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SetupGeneralStoreSettings]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SetupLoyaltyPointsId]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SetupPaymentType]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SetupRegistersAskForNote]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SetupRegistersCashManagement]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SetupRegistersReceiptTemplate]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SetupSalesTaxGroupId]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SetupSalesTaxGroupMaster]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SetupStoreAddress]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SKUGenerationType]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[StockOrderStatus]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[StockOrderType]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Store]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[StoreOutlet]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[StoreOutletRegister]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[StoreUser]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[TimeZone]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[TransferStockOrder]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[UserRole]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[UserSwitchingSecurityType]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DeleteBrand]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DeleteProductType]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DeleteSupplier]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DeleteTag]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_GetAllBrandsByStore]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_GetAllMasterDataForCreateOrEditDiscountOffer]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_GetAllMasterDataForCreateOrEditProduct]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_GetAllProductsByStore]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_GetAllProductsForSaleByStore]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_GetAllProductTypesByStore]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_GetAllSalesTaxList]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_GetAllSuppliersByStore]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_GetAllTagsByStore]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_GetInventoryBySearch]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_GetProductsBySearch]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_GetStoreOutlets]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InsertBrand]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InsertProduct]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InsertProductImage]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InsertProductInventory]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InsertProductOutletPricing]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InsertProductPricing]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InsertProductTag]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InsertProductType]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InsertProductVariant]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InsertProductVariantAttribute]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InsertSupplier]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InsertTag]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_UpdateBrand]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_UpdateProductType]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_UpdateSupplier]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_UpdateTag]    Script Date: 11/19/2017 6:02:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [master]
GO

ALTER DATABASE [DND] SET  READ_WRITE
GO
