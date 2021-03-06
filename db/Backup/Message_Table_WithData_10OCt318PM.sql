USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 10/10/2015 15:17:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Message] ON
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (1, N'Country Already Exsits')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (2, N'Country Saved Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (3, N'Country Updated Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (4, N'Please Enter State Name')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (5, N'Please Select Country')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (6, N'Same Name State is Available in Country')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (7, N'State Saved Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (8, N'State Updated Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (9, N'Please Enter City Name')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (10, N'City Saved Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (11, N'City Updated Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (12, N'Please Insert Shop Name')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (13, N'Please Insert Owner Name')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (14, N'Medical Shop Saved Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (15, N'Medical Shop Updated Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (16, N'Error To Save Medical Shop.')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (17, N'Error To Update Medical Shop.')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (18, N'Please Insert Doctor Name')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (19, N'Please Insert Spcialization')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (20, N'Error To Update Doctor Details')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (21, N'Doctor Details Updated  Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (22, N'Error To Save Doctor Details.')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (23, N'Doctor Details Saved Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (24, N'Please Insert Company Name')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (25, N'Please Insert Contact Person')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (26, N'Error To Update Supplier Details')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (27, N'Supplier Details Updated  Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (28, N'Error To Save Supplier Details.')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (29, N'Supplier Details Saved Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (30, N'Please Insert Product Name Name')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (31, N'Please Insert Purchase Price')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (32, N'Error To Update Product Details')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (33, N'Product Details Updated  Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (34, N'Error To Save Product Details.')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (35, N'Product Details Saved Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (36, N'DMPLinking Created Sucessfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (37, N'Error To Create DMPLinking.')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (38, N'DMPLinking Updated Sucessfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (39, N'Error To Update DMPLinking.')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (40, N'Error To Update DMPLinking.')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (41, N'Record Already Exists!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (42, N'Purchase Transaction Saved Sucessfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (43, N'Purchase Transaction Not Saved Sucessfully.')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (44, N'Sales Transaction Sucessfully....!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (45, N'Sales Transaction Not saved Sucessfully.')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (46, N'Supplier Payment Save Sucessfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (47, N'Error To Save Supplier Payment.')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (48, N'Medical Payment Save Sucessfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (49, N'Medical Payment not Saved.')
SET IDENTITY_INSERT [dbo].[Message] OFF
