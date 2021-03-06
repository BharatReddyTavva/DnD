USE [DND]
GO
SET IDENTITY_INSERT [dbo].[StoreOutlet] ON 

INSERT [dbo].[StoreOutlet] ([StoreOutletId], [StoreId], [OutletName], [OutletDefaultSalesTaxId], [OutletOrderNumberPrefix], [OutletOrderNumber], [SupplierReturnPrefix], [SupplierReturnNumber], [IsNegativeInventory], [PhysicalAddressStreet1], [PhysicalAddressStreet2], [Suburb], [City], [Postcode], [State], [CountryId], [TimezoneId], [Email], [Phone], [TwitterHandle], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, 1, N'Main Outlet', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2017-09-19 05:52:39.343' AS DateTime), 1, CAST(N'2017-09-19 05:52:39.343' AS DateTime))
INSERT [dbo].[StoreOutlet] ([StoreOutletId], [StoreId], [OutletName], [OutletDefaultSalesTaxId], [OutletOrderNumberPrefix], [OutletOrderNumber], [SupplierReturnPrefix], [SupplierReturnNumber], [IsNegativeInventory], [PhysicalAddressStreet1], [PhysicalAddressStreet2], [Suburb], [City], [Postcode], [State], [CountryId], [TimezoneId], [Email], [Phone], [TwitterHandle], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, 1, N'Madhapur Outlet', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2017-09-19 05:52:39.350' AS DateTime), 1, CAST(N'2017-09-19 05:52:39.350' AS DateTime))
INSERT [dbo].[StoreOutlet] ([StoreOutletId], [StoreId], [OutletName], [OutletDefaultSalesTaxId], [OutletOrderNumberPrefix], [OutletOrderNumber], [SupplierReturnPrefix], [SupplierReturnNumber], [IsNegativeInventory], [PhysicalAddressStreet1], [PhysicalAddressStreet2], [Suburb], [City], [Postcode], [State], [CountryId], [TimezoneId], [Email], [Phone], [TwitterHandle], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, 1, N'Kukatpally Outlet', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2017-09-19 05:52:39.350' AS DateTime), 1, CAST(N'2017-09-19 05:52:39.350' AS DateTime))
SET IDENTITY_INSERT [dbo].[StoreOutlet] OFF
SET IDENTITY_INSERT [dbo].[PricingTier] ON 

INSERT [dbo].[PricingTier] ([PricingTierId], [Name], [MarkupPercentage], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Retail', NULL, 1, 1, CAST(N'2017-09-24 04:19:54.247' AS DateTime), 1, CAST(N'2017-09-24 04:19:54.247' AS DateTime))
INSERT [dbo].[PricingTier] ([PricingTierId], [Name], [MarkupPercentage], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Wholesale', NULL, 1, 1, CAST(N'2017-09-24 04:20:21.100' AS DateTime), 1, CAST(N'2017-09-24 04:20:21.100' AS DateTime))
INSERT [dbo].[PricingTier] ([PricingTierId], [Name], [MarkupPercentage], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'Distribution', NULL, 1, 1, CAST(N'2017-09-24 04:20:21.100' AS DateTime), 1, CAST(N'2017-09-24 04:20:21.100' AS DateTime))
SET IDENTITY_INSERT [dbo].[PricingTier] OFF
SET IDENTITY_INSERT [dbo].[Store] ON 

INSERT [dbo].[Store] ([StoreId], [StoreName], [StoreURL], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'DnD Store', N'www.dnd.pos.com', 1, 1, CAST(N'2017-09-23 20:21:11.487' AS DateTime), 1, CAST(N'2017-09-23 20:21:11.487' AS DateTime))
SET IDENTITY_INSERT [dbo].[Store] OFF
