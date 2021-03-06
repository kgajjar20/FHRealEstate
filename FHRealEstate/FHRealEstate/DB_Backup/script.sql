USE [db_a7b60f_realestatevidhya]
GO
/****** Object:  Table [dbo].[Amenities]    Script Date: 10-04-2022 13:12:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenities](
	[AmenityId] [uniqueidentifier] NOT NULL,
	[AmenityName] [varchar](2100) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_amenities] PRIMARY KEY CLUSTERED 
(
	[AmenityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConstructionStatus]    Script Date: 10-04-2022 13:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConstructionStatus](
	[ConstructionStatusId] [int] IDENTITY(1,1) NOT NULL,
	[ConstructionStatusName] [varchar](200) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_ConstructionStatus] PRIMARY KEY CLUSTERED 
(
	[ConstructionStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 10-04-2022 13:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Email] [nvarchar](500) NULL,
	[Phone] [varchar](20) NULL,
	[Subject] [varchar](200) NULL,
	[Message] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property]    Script Date: 10-04-2022 13:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[PropertyId] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](1000) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PropertyTypeId] [int] NOT NULL,
	[PropertyStatusId] [int] NOT NULL,
	[ConstructionStatusId] [int] NOT NULL,
	[MinPrice] [numeric](18, 2) NOT NULL,
	[MaxPrice] [numeric](18, 2) NOT NULL,
	[PropertySize] [float] NOT NULL,
	[PropertySizePrefix] [nvarchar](50) NULL,
	[GarageSize] [float] NULL,
	[GarageSizePrefix] [nvarchar](50) NULL,
	[TotalRooms] [int] NULL,
	[TotalGarages] [int] NULL,
	[TotalBathrooms] [int] NULL,
	[BuildYear] [int] NULL,
	[Address] [nvarchar](1000) NULL,
	[City] [nvarchar](1000) NULL,
	[State] [nvarchar](1000) NULL,
	[Zip] [nvarchar](1000) NULL,
	[Country] [nvarchar](1000) NULL,
	[VideoURL] [nvarchar](max) NULL,
	[VirtualTourURL] [nvarchar](max) NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED 
(
	[PropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyAmenity]    Script Date: 10-04-2022 13:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyAmenity](
	[PropertyAmenityId] [uniqueidentifier] NOT NULL,
	[PropertyId] [uniqueidentifier] NOT NULL,
	[AmenityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PropertyAmenity] PRIMARY KEY CLUSTERED 
(
	[PropertyAmenityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyFloorPlan]    Script Date: 10-04-2022 13:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyFloorPlan](
	[PropertyFloorPlanId] [uniqueidentifier] NOT NULL,
	[PropertyId] [uniqueidentifier] NOT NULL,
	[PlanName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[RoomSize] [int] NULL,
	[BathroomSize] [int] NULL,
	[Price] [decimal](10, 2) NULL,
	[FloorSize] [int] NULL,
	[PlanOrder] [int] NOT NULL,
 CONSTRAINT [PK_PropertyFloorPlan] PRIMARY KEY CLUSTERED 
(
	[PropertyFloorPlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyImage]    Script Date: 10-04-2022 13:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyImage](
	[PropertyImageId] [uniqueidentifier] NOT NULL,
	[PropertyId] [uniqueidentifier] NOT NULL,
	[ImageName] [nvarchar](max) NOT NULL,
	[ImageType] [int] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_PropertyImage] PRIMARY KEY CLUSTERED 
(
	[PropertyImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyStatus]    Script Date: 10-04-2022 13:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyStatus](
	[PropertyStatusId] [int] IDENTITY(1,1) NOT NULL,
	[PropertyStatusName] [nvarchar](200) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_PropertyStatus] PRIMARY KEY CLUSTERED 
(
	[PropertyStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyType]    Script Date: 10-04-2022 13:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyType](
	[PropertyTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PropertyTypeName] [varchar](1000) NOT NULL,
	[IsCommarcial] [bit] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_PropertyType] PRIMARY KEY CLUSTERED 
(
	[PropertyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 10-04-2022 13:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
 CONSTRAINT [PK_test] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10-04-2022 13:12:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [uniqueidentifier] NOT NULL,
	[email] [varchar](500) NOT NULL,
	[passwordhash] [nvarchar](max) NOT NULL,
	[passwordsalt] [nvarchar](max) NOT NULL,
	[emailverificationlink] [nvarchar](max) NULL,
	[emailverified] [bit] NOT NULL,
	[emailverifieddate] [datetime] NULL,
	[firstname] [varchar](200) NOT NULL,
	[middlename] [varchar](200) NULL,
	[lastname] [varchar](200) NOT NULL,
	[profilephoto] [nvarchar](2000) NULL,
	[gender] [int] NULL,
	[birthdate] [datetime] NULL,
	[displayofficialbadge] [bit] NOT NULL,
	[status] [int] NOT NULL,
	[createdby] [uniqueidentifier] NULL,
	[createddate] [datetime] NULL,
	[modifiedby] [uniqueidentifier] NULL,
	[modifieddate] [datetime] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'102c117a-fdcf-4cde-a2ac-009a99896952', N'Rain Water Harvesting', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'8d74332e-2927-413a-91a6-0188729e32ce', N'Cafeteria', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'3bfd15f2-6dd0-4806-b7e4-075e49507df9', N'Power Backup', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'dc9ea1c3-61df-4da8-a7ee-0d3f9d07c545', N'Skating Rink', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'10be71f9-e316-4be9-9823-103ac5fdf8c4', N'Community_Hall', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'867b67dc-039c-48c6-b74a-10da7aa493da', N'Multipurpose Hall', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'f2f2224e-ca3c-482a-b2ae-13e6929300a8', N'Air Conditioned', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'7db019d0-60c2-4b3b-9881-1871cefccff0', N'Volleyball Court', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'6ee8c500-bdd8-446e-9d6c-1e7feb0d1749', N'CCTV', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'a3186a0d-72f7-4c72-a583-2252f0797d62', N'Visitor Parking', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'fcbeb8ce-b515-499d-a10b-22e36aaba0c6', N'Shopping Mall', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'29fb2e4f-d66c-44b9-ba7d-2afa2355366b', N'Children''s play area
', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'e2552fd7-878e-4dfa-a71f-2b4c36cc1db9', N'Sun Deck', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'92e5c20f-a34d-4eb1-afb2-2be7a912b54b', N'Medical Store/Pharmacy', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'9e1bb115-c9a7-45d4-93e5-36b35a3050d1', N'Badminton Court', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'2ebb9293-af47-49e5-a593-372abab7f299', N'Tennis Court', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'17939a92-50ef-4c39-9de5-457c67e6ca16', N'Service Lift', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'26350420-b968-4d4c-b06d-4ab14dea005b', N'Paved Compound', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'ac7bf522-88a3-42fd-a20e-4e0d9e812aca', N'Landscaped Gardens
', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'beffe19e-eea7-43f7-bc81-514050be483e', N'Jogging Track', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'94603926-580a-4f1c-9598-56be23eb2c2d', N'Cricket Pitch', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'e12c4b0f-0912-4cbe-b758-573aac862a2d', N'Infinity Pool', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'81434857-6007-4794-a278-5b325885066d', N'Kid''s Pool', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'71765d4c-5c9a-4564-9607-5c7e949cdf05', N'Flower Garden', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'6ae184b6-a1c7-43a7-8567-5d9fa60e04a3', N'Fire Fighting System', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'54567cd8-4682-4411-af17-5e68713f5861', N'Salon', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'f52f632c-9620-4c51-9328-5f5b3dd6147b', N'Entrance Lobby', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'cb784f60-f151-4582-8333-61ac4728bd8a', N'Air Conditioning
', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'9df733a7-7816-4ab8-b2a7-62a40599f9d6', N'Landscaped Gardens', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'559c029a-97d9-4e7b-90b8-62c69524c911', N'Maintenance Staff', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'abaafd8b-d9ed-49e9-a4e9-62df9df41625', N'Refrigerator', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'e48469b3-1368-4d7b-962d-64410cfd698f', N'Aerobics Room', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'29e692c4-fb03-4d82-b611-670c37d746e1', N'Internet/Wi-Fi', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'dfe41067-203b-4ad0-9056-6f5240d639ca', N'Squash Court', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'50bd3e2f-6177-4f6c-9bce-73aad5edc991', N'Car Parking
', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'ac247eed-0f38-4016-be64-753285b5dfc3', N'24 X 7 Water Supply', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'f8565d84-01e5-4c95-9013-7ddc95d8536b', N'TV Cable
', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'8a040fd5-89bb-4bc1-a6b7-855a70c0bf0e', N'Mini Theatre', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'ca09051e-3817-4341-9482-866f6f6b2901', N'Fountains', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'962001b4-62c2-427a-91fa-8728626e1832', N'Swimming Pool
', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'eba4f878-33a7-4516-b95f-8cfa430c9ead', N'Fire Sprinklers', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'921e27ed-b53e-40a0-b7a0-91012c47b4c0', N'Banquet Hall', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'0471564e-d1a1-4055-b392-957ab3aef06c', N'Basketball Court', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'134bf0a3-c4eb-4a52-bafd-96a6630b869d', N'Jogging Track
', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'c5a0d07a-1d45-471a-acb7-977e37894a3d', N'Visitor Parking', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'970ddadb-8b98-4648-bf7a-9bdd218e61be', N'Party Hall', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'febf1199-f618-4e3e-b1f7-9e403e80bf80', N'Amphitheater', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'bba8381f-078e-4aad-aade-9f3f1e0d0276', N'Day Care Center', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'422a2df9-97d0-47f0-88f3-ad47bd9d18b0', N'24 X 7 Security
', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'0311974e-fa33-4046-940b-b22fb04d86e7', N'Gated Community', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'23fdc8b8-ea89-4ac4-9ec7-b5b48fa76859', N'Indoor Games
', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'c2e03eed-89d5-4d15-948d-b66a3661d579', N'Lift Available', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'391853fe-fe57-4bd8-bad3-b740f93ec275', N'WiFi', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'70955be1-398f-4c67-9d40-b9f643a91b9d', N'Intercom', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'c3ec2606-daa8-4cd4-9d74-bfa55bda83f3', N'Multipurpose Room', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'a1e99614-24b3-431e-bef3-c3c55776dde5', N'Dryer', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'695aca49-37b8-4c69-ac2a-c78e660bc527', N'Waiting Lounge', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'b1ca4638-b008-45c5-965b-cdd0464593ef', N'Library', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'a2fe4b36-1fcd-4203-ad4d-d7090da768a6', N'Club House
', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'bc733344-5d99-4eb1-9484-d9ca500069a3', N'Security Cabin', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'1464f7ed-0675-4013-a0b0-dbf5b012533d', N'Tree Planting', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'054ae6cf-ee5e-4c84-a737-dc9dd356e8af', N'Senior Citizen Siteout', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'afc6ed5b-c15c-4938-8a1e-dccb00e73104', N'Aggregate area of recreational Open Space', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'c6008a45-01d1-4621-b47f-dd2865ab3d09', N'High-tech Alarm System', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'202f747d-a1fc-4054-ac58-e2a8f861296a', N'Car Wash Area', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'be41d524-a635-4407-a797-e4d5dea0ac4c', N'Lawn', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'ee9feafd-c4c5-414c-99e9-e5290622cbb1', N'RO Water System', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'ecf304f4-d1f3-4bcf-8088-e759463344b5', N'Medical Facilities', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'87f7dacf-7af4-42aa-a4a9-e876c69ff022', N'Multipurpose Room
', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'4ceb51df-abbd-4688-ac2f-e8ce1bd4a7ed', N'Utility Shops', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'4bd61bc5-919f-4af0-9bf3-ecfa44ccca92', N'Yoga/Meditation Area', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Amenities] ([AmenityId], [AmenityName], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'c93ea36f-8adf-40b9-b954-f80d60d20bfe', N'Spa/Sauna/Steam', 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ConstructionStatus] ON 

INSERT [dbo].[ConstructionStatus] ([ConstructionStatusId], [ConstructionStatusName], [Status]) VALUES (1, N'Ready to move', 1)
INSERT [dbo].[ConstructionStatus] ([ConstructionStatusId], [ConstructionStatusName], [Status]) VALUES (2, N'Under construction', 1)
SET IDENTITY_INSERT [dbo].[ConstructionStatus] OFF
GO
INSERT [dbo].[Property] ([PropertyId], [Title], [Description], [PropertyTypeId], [PropertyStatusId], [ConstructionStatusId], [MinPrice], [MaxPrice], [PropertySize], [PropertySizePrefix], [GarageSize], [GarageSizePrefix], [TotalRooms], [TotalGarages], [TotalBathrooms], [BuildYear], [Address], [City], [State], [Zip], [Country], [VideoURL], [VirtualTourURL], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'Shivalik Sharda HarmonyShivalik Sharda Harmony in Ambawadi, Ahmedabad West by Shivalik Group is a residential cum commercial project.  Shivalik Sharda Harmony offers facilities such as Lift.It also offers Car parking.  This is a RERA registered project with registration number PR/GJ/AHMEDABAD/AHMEDABAD CITY/AUDA/CAA07151/A1M/240321 .  It is an under construction project with possession offered in September, 2024.  The project is spread over a total area of 2.01 acres of land. Shivalik Sharda Harmony has a total of 3 towers. The construction is of 14 floors. An accommodation of 235 units has been provided.  You can find Shivalik Sharda Harmony price list on 99acres.com. Shivalik Sharda Harmony brochure is also available for easy reference.  Work From Home Space Available in Every Apartment  About City:  The real estate market of Ahmedabad West is on a positive trajectory. This beautiful city appeals to homebuyerâ€™s interest and hence witnesses demands. To meet these, the developers in ', N'<div id="projectContent" class="AboutProjectDetail__tabContent" style="border-radius: 0px; margin: 0px; padding: 0px 0px 20px; font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; -webkit-tap-highlight-color: transparent; border: 0px; font-size: medium; outline: 0px; vertical-align: baseline; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; line-height: normal; overflow: auto; height: calc(100vh - 160px); color: rgb(0, 0, 0);"><div class="AboutProjectDetail__show" style="border-radius: 0px; margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;; -webkit-tap-highlight-color: transparent; border: 0px; font-size: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; background: 0px 0px; line-height: normal;"><div class="AboutProjectDetail__abtProj pageComponent" data-label="ABOUT_PROJECT_TAB" style="border-radius: 0px; margin: 0px; padding: 20px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; background: 0px 0px; line-height: normal; white-space: pre-wrap;"><div class="body_med" style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: 14px; outline: 0px; vertical-align: middle; background: 0px 0px; line-height: 20px; color: rgb(9, 30, 66);"><span style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; background: 0px 0px; line-height: normal;">Shivalik Sharda Harmony in Ambawadi, Ahmedabad West by Shivalik Group is a residential cum commercial project.

Shivalik Sharda Harmony offers facilities such as Lift.It also offers Car parking.

This is a RERA registered project with registration number PR/GJ/AHMEDABAD/AHMEDABAD CITY/AUDA/CAA07151/A1M/240321 .

It is an under construction project with possession offered in September, 2024.

The project is spread over a total area of 2.01 acres of land. Shivalik Sharda Harmony has a total of 3 towers. The construction is of 14 floors. An accommodation of 235 units has been provided.

You can find Shivalik Sharda Harmony price list on 99acres.com.
Shivalik Sharda Harmony brochure is also available for easy reference.

Work From Home Space Available in Every Apartment

About City:

The real estate market of Ahmedabad West is on a positive trajectory. This beautiful city appeals to homebuyerâ€™s interest and hence witnesses demands. To meet these, the developers in the city are coming up with new developments. Proximity from commercial hubs and easy connectivity are two major factors that add to the positivity of the realty market. Presence of excellent healthcare facilities and good educational institutions also add to this positivity.


Location Advantage
Airport  25 min | 13 km
➢ Ahmedabad Railway Station  20 min | 7.5 km
➢ BRTS Accessibility
➢ Education Institutions (IIM , AMA , Gujarat Uni., Ahmedabad Uni. etc)
➢ Entertainment &amp; Food Zones (Ahmedabad ONE Mall, C.G. square) 
➢ Hospital  (Fusion , Kaizen, Vijay Shalby)
➢ Temples  
➢ Business Connectivity (C.G. Rd 2 km, Ashram Road 5 km, S.G. Highway 4 km)</span><span style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; background: 0px 0px; line-height: normal;"></span></div></div><div class="spacer10" style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; background: 0px 0px; line-height: normal; height: 10px; width: 409px;"></div><div class="spacer50" style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; background: 0px 0px; line-height: normal;"></div></div></div><div class="AboutProjectDetail__stickyButton" style="border-radius: 0px; margin: 0px; padding: 64px 20px 20px; font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; -webkit-tap-highlight-color: transparent; border: 0px; font-size: medium; outline: 0px; vertical-align: baseline; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; line-height: normal; color: rgb(0, 0, 0);"><button variant="primaryRegular" font-style="sami" extraclass="trackGAClick pageComponent" data-label="INTERESTED" data-galabel="ABOUT_BUILDER" class="pageComponent
                buttons__primaryRegular
                undefined
                
                trackGAClick pageComponent
                
                undefined" style="border-radius: 4px; margin: auto; padding: 8px 16px; font-family: &quot;Open Sans&quot;; -webkit-tap-highlight-color: transparent; min-height: auto; box-shadow: rgba(0, 106, 194, 0.2) 0px 1px 4px 0px; background: rgb(0, 106, 194); outline: none; border-width: 0px; border-style: initial; border-color: initial; font-size: 14px; line-height: 20px; font-weight: 700; color: rgb(255, 255, 255); vertical-align: middle; position: fixed; bottom: 16px; left: 0px; width: 382.5px; right: 0px;"><span style="border-radius: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; background: 0px 0px; line-height: normal; margin: 0px !important;">I''m interested in this pr</span></button></div>', 1, 2, 2, CAST(12400000.00 AS Numeric(18, 2)), CAST(12800000.00 AS Numeric(18, 2)), 2025, N'20525Sq Ft', NULL, N'Sq Ft', 3, NULL, 3, 2020, N'Ambawadi, Ahmedabad West', N'Ahmadabad', N'GJ', N'380009', N'India', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Property] ([PropertyId], [Title], [Description], [PropertyTypeId], [PropertyStatusId], [ConstructionStatusId], [MinPrice], [MaxPrice], [PropertySize], [PropertySizePrefix], [GarageSize], [GarageSizePrefix], [TotalRooms], [TotalGarages], [TotalBathrooms], [BuildYear], [Address], [City], [State], [Zip], [Country], [VideoURL], [VirtualTourURL], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N' Shivalik Sharda Parkview 2 ', N'<p><span style="color: rgb(0, 0, 0); font-family: SourceSansPro-Light; font-size: 32px;">Shivalik Sharda Parkview 2 is a chance to reside in the future of Ahmedabad. It’s situated in Shela, a developing suburb with mixed development of commercial &amp; residential to make sure all needs of residents are met without any hassles.</span><br style="color: rgb(0, 0, 0); font-family: SourceSansPro-Light; font-size: 32px;"><br style="color: rgb(0, 0, 0); font-family: SourceSansPro-Light; font-size: 32px;"><span style="color: rgb(0, 0, 0); font-family: SourceSansPro-Light; font-size: 32px;">The Shivalik Sharda Parkview 2 is strategically located on 150 ft Ghuma sanand road, giving prime importance to roadways for this area to commute within the city in ease. From schools &amp; hospitals to restaurants, all the basic amenities are nearby.</span><br style="color: rgb(0, 0, 0); font-family: SourceSansPro-Light; font-size: 32px;"><br style="color: rgb(0, 0, 0); font-family: SourceSansPro-Light; font-size: 32px;"><span style="color: rgb(0, 0, 0); font-family: SourceSansPro-Light; font-size: 32px;">Parkview 2 brings luxury lifestyle and comfortable living close to nature in a single residential project.</span><br></p>', 1, 2, 2, CAST(5500000.00 AS Numeric(18, 2)), CAST(6000000.00 AS Numeric(18, 2)), 1505, N'Sq Ft', NULL, N'Sq Ft', 3, NULL, 3, 2019, N'New 45 Mtr. Ghuma Sanand Road, Nr. Club O7, Shela', N'Ahmadabad', N'GJ', N'380058', N'IN', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Property] ([PropertyId], [Title], [Description], [PropertyTypeId], [PropertyStatusId], [ConstructionStatusId], [MinPrice], [MaxPrice], [PropertySize], [PropertySizePrefix], [GarageSize], [GarageSizePrefix], [TotalRooms], [TotalGarages], [TotalBathrooms], [BuildYear], [Address], [City], [State], [Zip], [Country], [VideoURL], [VirtualTourURL], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'Shilp Revanta', N'<p>Welcome to the dawn of a lifestyle of true extravagance. Shilp Revanta is setting new standards in simplicity, functionality and luxury. Residents of Shilp Revanta’s exclusive community will enjoy every luxury and pleasure of an limitless lifestyle with more than 75 world class amenities.</p><p><br></p><p>The project offers Apartment with perfect combination of contemporary architecture and features to provide comfortable living.</p><p>The size of the Apartment ranges in between 1500.0 Sq. Ft and 1510.0 Sq. Ft.</p><p>This is a RERA registered project with registration number PR/GJ/AHMEDABAD/SANAND/AUDA/MAA07874/050121.</p><p>It is an under construction project with possession offered in Dec, 2024.</p><p>The project is spread over a total area of 3.79 acres of land. Shilp Revanta has a total of 5 towers. The construction is of 14 floors. An accommodation of 280 units has been provided.</p><p><br></p><p><br></p><p>About City:</p><p>The real estate market of Ahmedabad West is on a positive trajectory. This beautiful city appeals to homebuyers interest and hence witnesses demands. To meet these, the developers in the city are coming up with new developments. Proximity from commercial hubs and easy connectivity are two major factors that add to the positivity of the realty market. Presence of excellent healthcare facilities and good educational institutions also add to this positivity.</p><p><br></p><p>Shilp Revanta brochure is also available for easy reference.</p><div><br></div>', 1, 2, 2, CAST(5000000.00 AS Numeric(18, 2)), CAST(6000000.00 AS Numeric(18, 2)), 1510, N'Sq Ft', NULL, N'Sq Ft', 3, NULL, 4, 2020, N'SHILP REVANTA, opp. CLUB O7, Khadiya, Shela', N'Ahmedabad', N'GJ', N'382424', N'IN', N'https://www.youtube.com/watch?v=43_oZW0v8dY', N'https://shilp.co.in/tour/', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Property] ([PropertyId], [Title], [Description], [PropertyTypeId], [PropertyStatusId], [ConstructionStatusId], [MinPrice], [MaxPrice], [PropertySize], [PropertySizePrefix], [GarageSize], [GarageSizePrefix], [TotalRooms], [TotalGarages], [TotalBathrooms], [BuildYear], [Address], [City], [State], [Zip], [Country], [VideoURL], [VirtualTourURL], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'Shivalik Avenue', N'<p><span style="color: rgb(9, 30, 66); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; white-space: pre-wrap;">Shivalik Avenue in Bodakdev, Ahmedabad West by Shivalik Group is a residential project.
The project offers Apartment with perfect combination of contemporary architecture and features to provide comfortable living.

The Apartment are of the following configurations: 4BHK.

The size of the Apartment ranges in between 174.75 Sq. mt and 176.89 Sq. mt

Shivalik Avenue price starts from 2.35cr Onwards.</span></p><p><span style="color: rgb(9, 30, 66); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; white-space: pre-wrap;"><br></span></p><div class="SectionTabs__tabCont" style="border-radius: 0px; margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; -webkit-tap-highlight-color: transparent; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(244, 245, 247); border-left-color: initial; border-image: initial; font-size: medium; outline: 0px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; line-height: normal; position: relative; z-index: 2; width: 409px; white-space: nowrap; overflow: auto; color: rgb(0, 0, 0);"><div class="pageComponent SectionTabs__tabsChild list_header_semiBold" id="moreAbtTab_1" data-label="SPECIFICATIONS_TAB" style="border-radius: 0px; margin: 0px 0px 0px 12px; padding: 8px; font-family: &quot;Open Sans&quot;; -webkit-tap-highlight-color: transparent; border: 0px; font-size: 14px; font-weight: 600; outline: 0px; vertical-align: middle; background: 0px 0px; line-height: 20px; color: rgb(9, 30, 66); cursor: pointer;">Specifications</div></div><div class="AboutProjectDetail__bar" style="border-radius: 0px; margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; -webkit-tap-highlight-color: transparent; border: 0px; font-size: medium; outline: 0px; vertical-align: baseline; background: rgb(0, 106, 194); line-height: normal; height: 3px; position: absolute; z-index: 9; left: 129px; transition: left 0.3s ease-in-out 0s; color: rgb(0, 0, 0); width: 105px;"></div><div id="projectContent" class="AboutProjectDetail__tabContent" style="border-radius: 0px; margin: 0px; padding: 0px 0px 20px; font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; -webkit-tap-highlight-color: transparent; border: 0px; font-size: medium; outline: 0px; vertical-align: baseline; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; line-height: normal; overflow: auto; height: calc(100vh - 160px); color: rgb(0, 0, 0);"><div class="AboutProjectDetail__show" style="border-radius: 0px; margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;; -webkit-tap-highlight-color: transparent; border: 0px; font-size: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; background: 0px 0px; line-height: normal;"><div class="AboutProjectDetail__projSpecs pageComponent" data-label="SPECIFICATIONS_TAB" style="border-radius: 0px; margin: 0px; padding: 20px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; background: 0px 0px; line-height: normal; white-space: pre-wrap;"><div class="list_header_bold AboutProjectDetail__spacer8" style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: 14px; font-weight: 700; outline: 0px; vertical-align: middle; background: 0px 0px; line-height: 20px; color: rgb(9, 30, 66);">Overview</div><div class="AboutProjectDetail__specTable caption_strong_medium " style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: 12px; outline: 0px; vertical-align: middle; background: 0px 0px; line-height: 16px; color: rgb(66, 82, 110);"><table class="AboutProjectDetail__specificTable" style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; border: 0px grey; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-size: inherit; line-height: normal; outline: 0px; vertical-align: baseline; font-weight: inherit; width: 369px;"><tbody><tr style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; background: transparent; border-width: 0px; border-style: initial; border-image: initial; font-size: inherit; line-height: normal; outline: 0px; font-weight: inherit;"><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="border-radius: 0px; margin: 0px; padding-top: 8px; padding-bottom: 8px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">Towers</td><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="border-radius: 0px; margin: 0px; padding-top: 8px; padding-bottom: 8px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">3</td></tr><tr style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; background: rgb(244, 245, 247); border-width: 0px; border-style: initial; border-image: initial; font-size: inherit; line-height: normal; outline: 0px; font-weight: inherit;"><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="border-radius: 0px; margin: 0px; padding-top: 8px; padding-bottom: 8px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">Floors</td><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="border-radius: 0px; margin: 0px; padding-top: 8px; padding-bottom: 8px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">7</td></tr><tr style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; background: transparent; border-width: 0px; border-style: initial; border-image: initial; font-size: inherit; line-height: normal; outline: 0px; font-weight: inherit;"><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="border-radius: 0px; margin: 0px; padding-top: 8px; padding-bottom: 8px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">Units</td><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="border-radius: 0px; margin: 0px; padding-top: 8px; padding-bottom: 8px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">63</td></tr><tr style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; background: rgb(244, 245, 247); border-width: 0px; border-style: initial; border-image: initial; font-size: inherit; line-height: normal; outline: 0px; font-weight: inherit;"><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="border-radius: 0px; margin: 0px; padding-top: 8px; padding-bottom: 8px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">Total Project Area</td><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="border-radius: 0px; margin: 0px; padding-top: 8px; padding-bottom: 8px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">1.26 acres (5.1K sq.m.)</td></tr><tr style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; background: transparent; border-width: 0px; border-style: initial; border-image: initial; font-size: inherit; line-height: normal; outline: 0px; font-weight: inherit;"><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="border-radius: 0px; margin: 0px; padding-top: 8px; padding-bottom: 8px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">Open Area</td><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="border-radius: 0px; margin: 0px; padding-top: 8px; padding-bottom: 8px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">53 %</td></tr></tbody></table></div><div class="AboutProjectDetail__spacer20" style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; background: 0px 0px; line-height: normal;"></div><div class="caption_strong_medium" style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: 12px; outline: 0px; vertical-align: middle; background: 0px 0px; line-height: 16px; color: rgb(66, 82, 110);">FLOORING
Drawing / Living / Dining
Vitrified Tiles

Bed Rooms
Vitrified Tiles
Wooden Flooring in One Master Bedroom

Kitchen
Vitrified Tiles
Granite Platform with S.S. Sink and
Tiles upto Lintel Level

Balcony
Natural Granite / Rustic Tiles

WINDOWS
Anodised / Powder Coated
Aluminium Windows

COLOUR
Internal: Putty Finish
External: 100% Acrylic Paint

TOILETS
Glazed / Ceramic Tiles upto Lintel Level
Counter Basin / Wall Hung Basin
Branded EWC Couple Closet
Branded CP Brass Fittings

ELECTRIFICATION
3 Phase Concealed ISI Copper Wiring with
Modular Switches
MCB Distribution Panel

DOORS
Main Door
Polish Natural Veneer with
Night Latch
Video Door Phone

Bedroom Door / Toilet Door
Both Side Paint with SS Hardware</div></div></div></div>', 1, 2, 1, CAST(235000000.00 AS Numeric(18, 2)), CAST(235000000.00 AS Numeric(18, 2)), 3272, N'3772Sq Ft', NULL, N'Sq Ft', 4, NULL, 4, 2018, N'Near Nirma Vidya Vihar School, Bodakdev, Ahmedabad, Gujarat 380054', N'Ahmadabad', N'GJ', N'380054', N'India', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Property] ([PropertyId], [Title], [Description], [PropertyTypeId], [PropertyStatusId], [ConstructionStatusId], [MinPrice], [MaxPrice], [PropertySize], [PropertySizePrefix], [GarageSize], [GarageSizePrefix], [TotalRooms], [TotalGarages], [TotalBathrooms], [BuildYear], [Address], [City], [State], [Zip], [Country], [VideoURL], [VirtualTourURL], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'Shilp Ananta', N'<p><span style="color: rgb(9, 30, 66); font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; white-space: pre-wrap;">Built in Shela, Ahmedabad Shlip Ananta is a residential cum commercial development by Shilp Group. The project is sufficed with all modern amenities and covers 2 BHK apartments/ shops. Being close to all necessities, it has good connectivity to the rest of the city.</span></p><div class="SectionTabs__tabCont" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; -webkit-tap-highlight-color: transparent; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(244, 245, 247); border-left-color: initial; border-image: initial; font-size: medium; outline: 0px; vertical-align: baseline; line-height: normal; position: relative; z-index: 2; width: 409px; white-space: nowrap; overflow: auto; color: rgb(0, 0, 0);"><div class="pageComponent SectionTabs__tabsChild list_header_semiBold" id="moreAbtTab_1" data-label="SPECIFICATIONS_TAB" style="border-radius: 0px; margin: 0px 0px 0px 12px; padding: 8px; font-family: &quot;Open Sans&quot;; -webkit-tap-highlight-color: transparent; border: 0px; font-size: 14px; font-weight: 600; outline: 0px; vertical-align: middle; background: 0px 0px; line-height: 20px; color: rgb(9, 30, 66); cursor: pointer;">Specifications</div></div><div class="AboutProjectDetail__bar" style="border-radius: 0px; margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; -webkit-tap-highlight-color: transparent; border: 0px; font-size: medium; outline: 0px; vertical-align: baseline; background: rgb(0, 106, 194); line-height: normal; height: 3px; position: absolute; z-index: 9; left: 129px; transition: left 0.3s ease-in-out 0s; color: rgb(0, 0, 0); width: 105px;"></div><div id="projectContent" class="AboutProjectDetail__tabContent" style="background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; margin: 0px; padding: 0px 0px 20px; font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; -webkit-tap-highlight-color: transparent; border: 0px; font-size: medium; outline: 0px; vertical-align: baseline; line-height: normal; overflow: auto; height: calc(100vh - 160px); color: rgb(0, 0, 0);"><div class="AboutProjectDetail__show" style="border-radius: 0px; margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;; -webkit-tap-highlight-color: transparent; border: 0px; font-size: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; background: 0px 0px; line-height: normal;"><div class="AboutProjectDetail__projSpecs pageComponent" data-label="SPECIFICATIONS_TAB" style="border-radius: 0px; margin: 0px; padding: 20px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; background: 0px 0px; line-height: normal; white-space: pre-wrap;"><div class="list_header_bold AboutProjectDetail__spacer8" style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: 14px; font-weight: 700; outline: 0px; vertical-align: middle; background: 0px 0px; line-height: 20px; color: rgb(9, 30, 66);">Overview</div><div class="AboutProjectDetail__specTable caption_strong_medium " style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: 12px; outline: 0px; vertical-align: middle; background: 0px 0px; line-height: 16px; color: rgb(66, 82, 110);"><table class="AboutProjectDetail__specificTable" style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; border: 0px grey; font-size: inherit; line-height: normal; outline: 0px; vertical-align: baseline; font-weight: inherit; width: 369px;"><tbody><tr style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; background: transparent; border-width: 0px; border-style: initial; border-image: initial; font-size: inherit; line-height: normal; outline: 0px; font-weight: inherit;"><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="padding-top: 8px; padding-bottom: 8px; border-radius: 0px; margin: 0px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">Towers</td><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="padding-top: 8px; padding-bottom: 8px; border-radius: 0px; margin: 0px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">10</td></tr><tr style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; background: rgb(244, 245, 247); border-width: 0px; border-style: initial; border-image: initial; font-size: inherit; line-height: normal; outline: 0px; font-weight: inherit;"><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="padding-top: 8px; padding-bottom: 8px; border-radius: 0px; margin: 0px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">Floors</td><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="padding-top: 8px; padding-bottom: 8px; border-radius: 0px; margin: 0px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">14</td></tr><tr style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; background: transparent; border-width: 0px; border-style: initial; border-image: initial; font-size: inherit; line-height: normal; outline: 0px; font-weight: inherit;"><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="padding-top: 8px; padding-bottom: 8px; border-radius: 0px; margin: 0px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">Units</td><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="padding-top: 8px; padding-bottom: 8px; border-radius: 0px; margin: 0px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">610</td></tr><tr style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; background: rgb(244, 245, 247); border-width: 0px; border-style: initial; border-image: initial; font-size: inherit; line-height: normal; outline: 0px; font-weight: inherit;"><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="padding-top: 8px; padding-bottom: 8px; border-radius: 0px; margin: 0px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">Total Project Area</td><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="padding-top: 8px; padding-bottom: 8px; border-radius: 0px; margin: 0px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">2.145122 acres (8.68K sq.m.)</td></tr><tr style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; background: transparent; border-width: 0px; border-style: initial; border-image: initial; font-size: inherit; line-height: normal; outline: 0px; font-weight: inherit;"><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="padding-top: 8px; padding-bottom: 8px; border-radius: 0px; margin: 0px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">Open Area</td><td class="caption_strong_medium AboutProjectDetail__specificTableRow" style="padding-top: 8px; padding-bottom: 8px; border-radius: 0px; margin: 0px; -webkit-tap-highlight-color: transparent; background: transparent; border: 0px; line-height: 16px; outline: 0px; vertical-align: middle; display: block; width: 184.5px;">56 %</td></tr></tbody></table></div><div class="AboutProjectDetail__spacer20" style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; background: 0px 0px; line-height: normal;"></div><div class="caption_strong_medium" style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: 12px; outline: 0px; vertical-align: middle; background: 0px 0px; line-height: 16px; color: rgb(66, 82, 110);">WALL FINISH:
Internal Smooth Finish Plaster With Double Coat Birla Putty. 
External Double Coat Sand Face Plaster Or Texture With Acrylic Paint. 

FLOORING:
Vitrified Tile Flooring In Entire Apartment. 

DOOR:</div><div class="caption_strong_medium" style="border-radius: 0px; margin: 0px; padding: 0px; -webkit-tap-highlight-color: transparent; border: 0px; font-size: 12px; outline: 0px; vertical-align: middle; background: 0px 0px; line-height: 16px; color: rgb(66, 82, 110);"><br></div></div></div></div><div class="AboutProjectDetail__projSpecs pageComponent" data-label="SPECIFICATIONS_TAB" style="background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-radius: 0px; margin: 0px; padding: 20px; font-family: &quot;Open Sans&quot;, Arial, Helvetica, sans-serif; -webkit-tap-highlight-color: transparent; border: 0px; font-size: medium; outline: 0px; vertical-align: baseline; line-height: normal; color: rgb(0, 0, 0); white-space: pre-wrap;"><div class="caption_strong_medium" style="border-radius: 0px; margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;; -webkit-tap-highlight-color: transparent; border: 0px; font-size: 12px; outline: 0px; vertical-align: middle; background: 0px 0px; line-height: 16px; color: rgb(66, 82, 110);">Main Door - Decorative Main Door With Wooden Frame. 
Internal Door - Flush Door With Enamel Paint. 

WINDOWS:
Sliding Aluminium Window Section With Anodized Or Powder Coated. 

KITCHEN:
Granite Platform With Stainless Steel Sink Along With Electrical Point For Water Purifier. 
Designer Glaze Tile Dedo Upto Lintel Level. 

TOILET:
Designer Ceramic Or Glaze Tile Upto Lintel Level. 
CP Fittings - Chrome Plated Branded Bathroom Fittings. 

ELECTRIFICATION:
ISI Modular Switches. 
ISI Wires. 
Distribution Board With MCB For Safety And Protection.</div><div><br></div></div>', 1, 2, 2, CAST(3800000.00 AS Numeric(18, 2)), CAST(4100000.00 AS Numeric(18, 2)), 1050, N'Sq Ft', NULL, N'Sq Ft', 2, NULL, 2, 2020, N'SHILP ANANTA, opp. CLUB 07, Shela', N'Ahmadabad ', N'GJ', N'380058', N'IN', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Property] ([PropertyId], [Title], [Description], [PropertyTypeId], [PropertyStatusId], [ConstructionStatusId], [MinPrice], [MaxPrice], [PropertySize], [PropertySizePrefix], [GarageSize], [GarageSizePrefix], [TotalRooms], [TotalGarages], [TotalBathrooms], [BuildYear], [Address], [City], [State], [Zip], [Country], [VideoURL], [VirtualTourURL], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (N'7d17386f-ae6d-4d2a-aa36-edd066a74f29', N'Luxury Family Home 2', N'<p class="mb25" style="box-sizing: border-box; margin-top: 0px; margin-bottom: 25px !important; font-size: 14px; color: rgb(72, 72, 72); margin-right: 0px; margin-left: 0px;"><b>Evans Tower very high demand corner junior one bedroom plus a large balcony boasting full open NYC views. You need to see the views to believe them. Mint condition with new hardwood floors. Lots of closets plus washer and dryer.</b></p><div class="collapse show" id="collapseExample" style="box-sizing: border-box;"><div class="card card-body" style="box-sizing: border-box; position: relative; display: flex; flex-direction: column; min-width: 0px; overflow-wrap: break-word; background-color: rgb(255, 255, 255); background-clip: border-box; border: none; border-radius: 0.25rem; flex: 1 1 auto; padding: 0px;"><p class="mt10 mb10" style="box-sizing: border-box; margin: 10px 0px; font-size: 14px; color: rgb(72, 72, 72); font-family: Nunito, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><b>Fully furnished. Elegantly appointed condominium unit situated on premier location. PS6. The wide entry hall leads to a large living room with dining area. This expansive 2 bedroom and 2 renovated marble bathroom apartment has great windows. Despite the interior views, the apartments Southern and Eastern exposures allow for lovely natural light to fill every room. The master suite is surrounded by handcrafted milk work and features incredible walk-in closet and storage space.</b></p><b><br class="Apple-interchange-newline"><br></b></div></div>', 2, 3, 1, CAST(15000.00 AS Numeric(18, 2)), CAST(16000.00 AS Numeric(18, 2)), 1500, N'Sq Ft', NULL, N'Sq Ft', 4, 0, 2, 2012, N'1422 San Pedro St', N'Ahmedabad', N'GJ', N'380054', N'IN', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Property] ([PropertyId], [Title], [Description], [PropertyTypeId], [PropertyStatusId], [ConstructionStatusId], [MinPrice], [MaxPrice], [PropertySize], [PropertySizePrefix], [GarageSize], [GarageSizePrefix], [TotalRooms], [TotalGarages], [TotalBathrooms], [BuildYear], [Address], [City], [State], [Zip], [Country], [VideoURL], [VirtualTourURL], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (N'792bd5a1-ab64-479e-91c8-f6b018ba7fa2', N'Luxury Family Home 1', N'<p class="mb25" style="box-sizing: border-box; margin-top: 0px; margin-bottom: 25px !important; font-size: 14px; color: rgb(72, 72, 72); font-weight: 400; margin-right: 0px; margin-left: 0px; font-family: Nunito, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Evans Tower very high demand corner junior one bedroom plus a large balcony boasting full open NYC views. You need to see the views to believe them. Mint condition with new hardwood floors. Lots of closets plus washer and dryer.</p><div class="collapse show" id="collapseExample" style="box-sizing: border-box; color: rgb(119, 119, 119); font-family: Nunito, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><div class="card card-body" style="box-sizing: border-box; position: relative; display: flex; flex-direction: column; min-width: 0px; overflow-wrap: break-word; background-color: rgb(255, 255, 255); background-clip: border-box; border: none; border-radius: 0.25rem; flex: 1 1 auto; padding: 0px;"><p class="mt10 mb10" style="box-sizing: border-box; margin: 10px 0px; font-size: 14px; color: rgb(72, 72, 72); font-weight: 400;">Fully furnished. Elegantly appointed condominium unit situated on premier location. PS6. The wide entry hall leads to a large living room with dining area. This expansive 2 bedroom and 2 renovated marble bathroom apartment has great windows. Despite the interior views, the apartments Southern and Eastern exposures allow for lovely natural light to fill every room. The master suite is surrounded by handcrafted milkwork and features incredible walk-in closet and storage space.</p><p class="mt10 mb10" style="box-sizing: border-box; margin: 10px 0px; font-size: 14px; color: rgb(72, 72, 72); font-weight: 400;">Fully furnished. Elegantly appointed condominium unit situated on premier location. PS6. The wide entry hall leads to a large living room with dining area. This expansive 2 bedroom and 2 renovated marble bathroom apartment has great windows. Despite the interior views, the apartments Southern and Eastern exposures allow for lovely natural light to fill every room. The master suite is surrounded by handcrafted milkwork and features incredible walk-in closet and storage space.</p></div></div><br class="Apple-interchange-newline"><br>', 1, 3, 1, CAST(1000000.00 AS Numeric(18, 2)), CAST(11000000.00 AS Numeric(18, 2)), 1000, N'Sq Ft', NULL, N'Sq Ft', 5, 1, 2, 2020, N'1421 San Pedro St', N'Ahmedabad', N'GJ', N'380028', N'IN', NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'e7a5a9db-367a-4f22-b7d7-004be78e2318', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'ac7bf522-88a3-42fd-a20e-4e0d9e812aca')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'babb9a4b-0dbc-440f-99a7-0093be5657c2', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'c6008a45-01d1-4621-b47f-dd2865ab3d09')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'807f210b-34c5-4697-a660-00dc39a3cd32', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'81434857-6007-4794-a278-5b325885066d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'b1e5f58e-809e-4ab4-a8d6-037c408315d1', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'29fb2e4f-d66c-44b9-ba7d-2afa2355366b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'165b8295-7543-4cbe-ae21-03a4a001e1e0', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'be41d524-a635-4407-a797-e4d5dea0ac4c')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'111acf5a-ded0-43b5-b9b9-03d0ee99a70c', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'8d74332e-2927-413a-91a6-0188729e32ce')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'86ef848f-5911-4e6f-9e4f-0515aaae6245', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'a3186a0d-72f7-4c72-a583-2252f0797d62')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'ff28fb33-b158-4edc-85b6-05b2021ca265', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'29fb2e4f-d66c-44b9-ba7d-2afa2355366b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'3ba7b72d-6dbc-4af0-87a7-0641382dc1a3', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'7db019d0-60c2-4b3b-9881-1871cefccff0')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'74b9115a-4e4a-42cd-855d-066a9e916e80', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'29fb2e4f-d66c-44b9-ba7d-2afa2355366b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'1becbe0c-db40-4a63-9cd6-06f5b8d70603', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'3bfd15f2-6dd0-4806-b7e4-075e49507df9')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'0aa2b227-aaf4-4085-ab3d-083c6a11b88c', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'921e27ed-b53e-40a0-b7a0-91012c47b4c0')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'446de53b-b397-4d0a-918d-0aeecee937a4', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'81434857-6007-4794-a278-5b325885066d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'0dd282c0-c247-490f-a1bc-0bedf90b353d', N'792bd5a1-ab64-479e-91c8-f6b018ba7fa2', N'cb784f60-f151-4582-8333-61ac4728bd8a')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'ae2b8665-8df4-4442-9662-0d214ab7806d', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'81434857-6007-4794-a278-5b325885066d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'5b94d843-e68a-4a90-8883-0dfae1ac4af9', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'c3ec2606-daa8-4cd4-9d74-bfa55bda83f3')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'36ce6db6-7e6a-4be9-a6e5-0e0b308d0024', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'b1ca4638-b008-45c5-965b-cdd0464593ef')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'b3b0e994-fe66-4ebb-ab96-0ed8481bb8cb', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'b1ca4638-b008-45c5-965b-cdd0464593ef')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'e0837f22-22ab-4247-9ef9-0f1321b14156', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'c6008a45-01d1-4621-b47f-dd2865ab3d09')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'9a9aa752-6758-4e56-87e0-1057ed726497', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'e48469b3-1368-4d7b-962d-64410cfd698f')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'19b682cc-eced-4bd9-b502-10e4ff270509', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'87f7dacf-7af4-42aa-a4a9-e876c69ff022')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'e25ea35d-65d4-481f-b83e-12e6d2ce99c7', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'054ae6cf-ee5e-4c84-a737-dc9dd356e8af')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'19c44513-f0d6-4957-87f3-13365b12fbf0', N'7d17386f-ae6d-4d2a-aa36-edd066a74f29', N'ac7bf522-88a3-42fd-a20e-4e0d9e812aca')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'8ece84d5-0ba1-47fe-8398-13b4a06e426d', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'cb784f60-f151-4582-8333-61ac4728bd8a')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'8e601093-1b5f-470d-bb13-157d87bda96c', N'792bd5a1-ab64-479e-91c8-f6b018ba7fa2', N'87f7dacf-7af4-42aa-a4a9-e876c69ff022')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'89eda679-8bd8-4eab-8548-15d0b19e5dd3', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'b1ca4638-b008-45c5-965b-cdd0464593ef')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'828c5bea-ac88-4997-9a05-15d5b4241e65', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'ac247eed-0f38-4016-be64-753285b5dfc3')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'bcf8e1d6-6e5a-406f-8215-1691b7b94d3c', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'e2552fd7-878e-4dfa-a71f-2b4c36cc1db9')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'55cb0a34-38f9-400c-9794-16c1faf9f507', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'695aca49-37b8-4c69-ac2a-c78e660bc527')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'07e4211c-2869-4b1b-b209-16f8b06c0397', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'dc9ea1c3-61df-4da8-a7ee-0d3f9d07c545')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'2df38caf-267d-4845-8a84-19ab41bcefa3', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'3bfd15f2-6dd0-4806-b7e4-075e49507df9')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'445cb8cb-770f-4b3b-93b4-1aff4a03c4f6', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'ac247eed-0f38-4016-be64-753285b5dfc3')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'a81d2ad9-d330-41f9-816a-1b26b6de90f9', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'92e5c20f-a34d-4eb1-afb2-2be7a912b54b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'db5794ee-a779-4f17-9f2a-1b5f4d072d45', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'54567cd8-4682-4411-af17-5e68713f5861')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'c971fe96-f4d1-4132-9913-1be8ef0e243d', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'4bd61bc5-919f-4af0-9bf3-ecfa44ccca92')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'f5e5452e-bcaf-4aee-af17-1c48e2ce9f23', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'970ddadb-8b98-4648-bf7a-9bdd218e61be')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'20a73fc6-0f31-4ffb-b975-1d47fb1e5bee', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'b1ca4638-b008-45c5-965b-cdd0464593ef')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'611e3c77-d5df-4a95-bcfc-1df9e67e9d64', N'792bd5a1-ab64-479e-91c8-f6b018ba7fa2', N'23fdc8b8-ea89-4ac4-9ec7-b5b48fa76859')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'94bfc4fc-9de7-41a7-9d76-1e2627a57992', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'e2552fd7-878e-4dfa-a71f-2b4c36cc1db9')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'bf266ec2-b724-4ffa-894c-1eb7f873ad1f', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'391853fe-fe57-4bd8-bad3-b740f93ec275')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'1d8137e6-2cf0-4241-991f-204a0dee66a0', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'70955be1-398f-4c67-9d40-b9f643a91b9d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'e38eeb81-9081-4b2a-9c16-2056190913df', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'febf1199-f618-4e3e-b1f7-9e403e80bf80')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'ce8b2b93-55b5-45f0-be47-207298ae498a', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'abaafd8b-d9ed-49e9-a4e9-62df9df41625')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'c5e3425f-74f7-440e-9997-21cf0d31f832', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'afc6ed5b-c15c-4938-8a1e-dccb00e73104')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'7481b6c1-a4d6-40b7-9de8-21f136a72024', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'26350420-b968-4d4c-b06d-4ab14dea005b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'8d4acea3-c029-4282-b88d-224c5a1db2b2', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'f2f2224e-ca3c-482a-b2ae-13e6929300a8')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'c393882c-e02d-44f8-a48e-22edbef628c8', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'cb784f60-f151-4582-8333-61ac4728bd8a')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'f136f6ef-8aa7-4ee0-8597-2477e19b727d', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'134bf0a3-c4eb-4a52-bafd-96a6630b869d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'bd670e27-6e7d-4ac9-9977-24b3e7cc37c9', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'54567cd8-4682-4411-af17-5e68713f5861')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'e21cd4ec-c88e-4d20-989b-26f7df438ee1', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'962001b4-62c2-427a-91fa-8728626e1832')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'07d81519-6d6d-4561-aed1-271b8a33aef7', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'c5a0d07a-1d45-471a-acb7-977e37894a3d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'e1af97ad-4e5f-4f64-a974-27783ed36cb9', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'94603926-580a-4f1c-9598-56be23eb2c2d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'cf0ded63-0dad-449d-a538-289bba8dc23e', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'9e1bb115-c9a7-45d4-93e5-36b35a3050d1')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'0f7cd934-7c56-462c-8f90-2ba6e3a875aa', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'0311974e-fa33-4046-940b-b22fb04d86e7')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'd0adfb1a-8e63-4085-a868-2c90773ff059', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'8a040fd5-89bb-4bc1-a6b7-855a70c0bf0e')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'ceea568a-8f01-4f58-973f-2d40ce9eda65', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'23fdc8b8-ea89-4ac4-9ec7-b5b48fa76859')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'a0ae8fbf-e1cd-4c47-95c7-2dbbd9874050', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'7db019d0-60c2-4b3b-9881-1871cefccff0')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'247680fb-a1cd-4b6c-b825-2e7021ac3c99', N'7d17386f-ae6d-4d2a-aa36-edd066a74f29', N'23fdc8b8-ea89-4ac4-9ec7-b5b48fa76859')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'720ee3c8-849a-4efc-8bac-302703fc1a5b', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'6ee8c500-bdd8-446e-9d6c-1e7feb0d1749')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'b4bd15a6-0e8c-43f6-8010-30563f1d3a46', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'921e27ed-b53e-40a0-b7a0-91012c47b4c0')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'3a2e4b84-f9dc-4ba7-b33b-30720c17aff7', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'beffe19e-eea7-43f7-bc81-514050be483e')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'7057a6c3-b6f8-46f8-bd36-30bcf1eed028', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'be41d524-a635-4407-a797-e4d5dea0ac4c')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'73139c2f-7437-44b5-80ab-31da3bc5985d', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'f52f632c-9620-4c51-9328-5f5b3dd6147b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'5bc89913-e42f-4b6c-b158-32c13403dbf7', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'bc733344-5d99-4eb1-9484-d9ca500069a3')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'ea9db75e-84a3-4f99-8e3c-33bba2b76625', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'054ae6cf-ee5e-4c84-a737-dc9dd356e8af')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'1eefc6f1-a6db-46b4-868d-359f69eb6e17', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'a3186a0d-72f7-4c72-a583-2252f0797d62')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'd71bf18e-4a91-4d85-99d7-37ddae83754c', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'fcbeb8ce-b515-499d-a10b-22e36aaba0c6')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'15fd9c68-cd4b-4128-8750-3ba396592db9', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'a3186a0d-72f7-4c72-a583-2252f0797d62')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'aa8695f2-a44b-44fd-8d8a-3e3cc4cce205', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'26350420-b968-4d4c-b06d-4ab14dea005b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'5308eb5a-74f2-400e-9526-3f5d74b35d35', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'eba4f878-33a7-4516-b95f-8cfa430c9ead')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'834b18a6-0602-4d6c-9925-3fd34a50ba5e', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'ecf304f4-d1f3-4bcf-8088-e759463344b5')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'f800cbc3-0369-4951-85bf-414ec4e4b847', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'c2e03eed-89d5-4d15-948d-b66a3661d579')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'31ca8dac-abe2-42fa-bdd4-41ec9db49000', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'ecf304f4-d1f3-4bcf-8088-e759463344b5')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'4fbb3400-b74e-4dfc-bcd1-4413da718afd', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'134bf0a3-c4eb-4a52-bafd-96a6630b869d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'22a18ad4-533e-4691-baab-47fe70126e80', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'f8565d84-01e5-4c95-9013-7ddc95d8536b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'824613df-5c1b-438a-a609-4ca1471f3dc7', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'054ae6cf-ee5e-4c84-a737-dc9dd356e8af')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'aec1244d-c893-40cf-b959-4d3541b94600', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'bc733344-5d99-4eb1-9484-d9ca500069a3')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'20ec3d9b-3682-4b42-b913-4e28a243088e', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'8d74332e-2927-413a-91a6-0188729e32ce')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'0c17a080-8ea2-4598-a926-4ee45858b535', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'4bd61bc5-919f-4af0-9bf3-ecfa44ccca92')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'3b152ea8-3ab4-4eb2-b451-4f28fef5b190', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'10be71f9-e316-4be9-9823-103ac5fdf8c4')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'23b9514c-4190-4ccd-9816-5004bc93c16d', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'4bd61bc5-919f-4af0-9bf3-ecfa44ccca92')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'9cb2e80a-2c33-4bc1-b150-5199028d3d58', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'e12c4b0f-0912-4cbe-b758-573aac862a2d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'8406b05d-edfd-4aa5-92fc-5212c6ebc5e8', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'dfe41067-203b-4ad0-9056-6f5240d639ca')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'5eec690e-6e8e-4ebf-9491-523ad9b541ac', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'867b67dc-039c-48c6-b74a-10da7aa493da')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'02c5226a-4891-411d-b443-525bd8ab79e5', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'695aca49-37b8-4c69-ac2a-c78e660bc527')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'182dcbb8-cda1-410d-8182-52611278ce17', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'a1e99614-24b3-431e-bef3-c3c55776dde5')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'51830f1f-25f1-4790-8776-52e9d50c3464', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'6ee8c500-bdd8-446e-9d6c-1e7feb0d1749')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'f6e11a28-aeb4-42ff-af7b-53816fbc6a48', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'6ee8c500-bdd8-446e-9d6c-1e7feb0d1749')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'3e6262c4-d5f3-4380-8656-57aba2b49ace', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'a2fe4b36-1fcd-4203-ad4d-d7090da768a6')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'adc40078-8aef-47e3-908b-57ad3ee2bc36', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'202f747d-a1fc-4054-ac58-e2a8f861296a')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'67b1d1c1-7858-4d13-865b-589993031376', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'dfe41067-203b-4ad0-9056-6f5240d639ca')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'1181f57e-ceed-46db-bb81-58a5da54b73b', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'8a040fd5-89bb-4bc1-a6b7-855a70c0bf0e')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'997d7142-ef26-452a-8cc8-5925de2f2fad', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'4ceb51df-abbd-4688-ac2f-e8ce1bd4a7ed')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'eeefc9e5-74db-4392-9be9-592f9ef76ead', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'8d74332e-2927-413a-91a6-0188729e32ce')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'f30cfd76-e423-49d5-af94-5a67d7fc74e4', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'2ebb9293-af47-49e5-a593-372abab7f299')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'701064a5-b4ed-4ce2-a3eb-5c9e5c976a6c', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'c2e03eed-89d5-4d15-948d-b66a3661d579')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'09cc7ab0-10ba-426c-8cd0-5ca1223ab94e', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'f2f2224e-ca3c-482a-b2ae-13e6929300a8')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'74132093-f1d1-4803-8233-5e6c75d23513', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'29e692c4-fb03-4d82-b611-670c37d746e1')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'23332166-8a15-4b95-9332-5e797b5bd57e', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'29e692c4-fb03-4d82-b611-670c37d746e1')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'01bbd26e-d611-473b-bfbe-624c59a49f44', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'6ee8c500-bdd8-446e-9d6c-1e7feb0d1749')
GO
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'4bb03fdc-ec2c-4586-9057-6363ccd4a6fa', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'1464f7ed-0675-4013-a0b0-dbf5b012533d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'd4a4a1bb-016b-4480-abac-63cffe57a691', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'c3ec2606-daa8-4cd4-9d74-bfa55bda83f3')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'739255ef-54a3-4fd3-b76f-64edf26e45bb', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'afc6ed5b-c15c-4938-8a1e-dccb00e73104')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'df6b6294-bc8d-487f-8c8d-64f34964a236', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'e12c4b0f-0912-4cbe-b758-573aac862a2d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'a2db720f-af54-4da1-a21f-652a71ba2c66', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'0471564e-d1a1-4055-b392-957ab3aef06c')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'a7926989-0f39-404d-9dc0-6591c4cf6184', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'6ae184b6-a1c7-43a7-8567-5d9fa60e04a3')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'7b55256a-1d16-475a-82d3-66633dbfb797', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'2ebb9293-af47-49e5-a593-372abab7f299')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'37179b65-3a31-43cd-b405-66aac8543cfe', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'e12c4b0f-0912-4cbe-b758-573aac862a2d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'232c12e4-6744-478f-bfb5-671ebe3ccfd0', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'70955be1-398f-4c67-9d40-b9f643a91b9d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'c5db3384-e4ae-4426-a354-684b44f4162a', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'a3186a0d-72f7-4c72-a583-2252f0797d62')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'1f6c3ede-5558-494c-aaa2-68f5a42664c7', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'391853fe-fe57-4bd8-bad3-b740f93ec275')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'c650705f-53a1-4963-b6c8-6b392e834355', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'b1ca4638-b008-45c5-965b-cdd0464593ef')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'ec312098-370b-42b6-a340-6da989bf1609', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'102c117a-fdcf-4cde-a2ac-009a99896952')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'45a2e24b-d1e7-42c6-b7ea-6f81986b38fe', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'10be71f9-e316-4be9-9823-103ac5fdf8c4')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'bf65a34b-a5d4-4d82-97a3-701a5ea1f9ec', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'4bd61bc5-919f-4af0-9bf3-ecfa44ccca92')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'c1fc120d-a613-49e2-b844-71bf984592ea', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'9df733a7-7816-4ab8-b2a7-62a40599f9d6')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'b22f17f3-a514-48fd-b952-74b6ab35b3e5', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'bba8381f-078e-4aad-aade-9f3f1e0d0276')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'9cb1fe35-d94d-48bd-8912-75cf45350e1c', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'c2e03eed-89d5-4d15-948d-b66a3661d579')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'a0084cac-f885-4c4d-81db-776deb46dbed', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'71765d4c-5c9a-4564-9607-5c7e949cdf05')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'18bfd9b3-a7d3-40c3-b326-77c4747807e9', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'3bfd15f2-6dd0-4806-b7e4-075e49507df9')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'95218043-ebfa-4f46-92f6-78091aa12926', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'17939a92-50ef-4c39-9de5-457c67e6ca16')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'30352add-1dea-40b7-ab38-78856d018c61', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'559c029a-97d9-4e7b-90b8-62c69524c911')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'40372452-21a9-4af4-ac6d-793c6f7ab006', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'94603926-580a-4f1c-9598-56be23eb2c2d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'50634bb1-49d2-40ad-a439-79401704ef25', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'eba4f878-33a7-4516-b95f-8cfa430c9ead')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'0de73bb5-1b82-45fc-b05d-7a722d4853b7', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'0471564e-d1a1-4055-b392-957ab3aef06c')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'31e5a500-d5bc-4626-903a-7cafacd86d18', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'f52f632c-9620-4c51-9328-5f5b3dd6147b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'53960649-247c-4c53-bb11-7d4622b7df8c', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'e48469b3-1368-4d7b-962d-64410cfd698f')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'80f49457-58d8-440d-bea0-7da12ce2180a', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'e48469b3-1368-4d7b-962d-64410cfd698f')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'bce36781-e563-4db6-942b-7f012e1e268c', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'23fdc8b8-ea89-4ac4-9ec7-b5b48fa76859')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'b0a5c051-8172-4f67-9e97-7f018c97ef1b', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'102c117a-fdcf-4cde-a2ac-009a99896952')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'de494472-756b-4545-98de-7f3395ebcf8d', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'391853fe-fe57-4bd8-bad3-b740f93ec275')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'19be52bb-4e80-4b34-85bb-83a68c01c368', N'792bd5a1-ab64-479e-91c8-f6b018ba7fa2', N'a1e99614-24b3-431e-bef3-c3c55776dde5')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'83b5bd47-cfaf-45d4-9b2f-87d494ac67e0', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'ee9feafd-c4c5-414c-99e9-e5290622cbb1')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'38f2559f-33a3-4a4b-97c1-880080d5b326', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'be41d524-a635-4407-a797-e4d5dea0ac4c')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'15e28ec3-8791-4c79-ab5a-887972145838', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'867b67dc-039c-48c6-b74a-10da7aa493da')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'912a7fd4-c353-4907-9c91-892b27bac05a', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'ac247eed-0f38-4016-be64-753285b5dfc3')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'2c07a44d-9907-49d3-a2b7-893ca56ad81d', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'ac247eed-0f38-4016-be64-753285b5dfc3')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'32d5cba3-89c9-4f52-b485-896644ca41ee', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'f8565d84-01e5-4c95-9013-7ddc95d8536b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'6fa4861a-f1dd-4dce-b549-898c8e97f0e2', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'87f7dacf-7af4-42aa-a4a9-e876c69ff022')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'8f08480c-f8a3-48c8-8ae4-89f23af02e63', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'f2f2224e-ca3c-482a-b2ae-13e6929300a8')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'706019e9-6adf-4b50-8ac2-8c0bd6552047', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'6ee8c500-bdd8-446e-9d6c-1e7feb0d1749')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'039f554f-e2ba-4cf9-9d36-8c6dff0510ab', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'ac7bf522-88a3-42fd-a20e-4e0d9e812aca')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'd59096cd-b2f8-4163-a7cc-8ce9348baca6', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'febf1199-f618-4e3e-b1f7-9e403e80bf80')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'15bf04c5-dde4-4189-9fe1-8dae5248a360', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'cb784f60-f151-4582-8333-61ac4728bd8a')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'4bb9a4b0-e56a-434e-b940-8deafc214ba6', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'f52f632c-9620-4c51-9328-5f5b3dd6147b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'a4653121-5dd5-4853-a4e0-8df90e695a9f', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'c2e03eed-89d5-4d15-948d-b66a3661d579')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'82b24824-88bf-4759-918b-8e89196e7d5e', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'6ae184b6-a1c7-43a7-8567-5d9fa60e04a3')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'4006d5fd-a109-41f1-b5d6-8f4054ec08ba', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'9df733a7-7816-4ab8-b2a7-62a40599f9d6')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'b9d809d3-a663-428b-958d-90df67d2ca13', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'202f747d-a1fc-4054-ac58-e2a8f861296a')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'5e05c8d8-97f3-4d7a-8f3a-910f55507908', N'792bd5a1-ab64-479e-91c8-f6b018ba7fa2', N'29fb2e4f-d66c-44b9-ba7d-2afa2355366b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'343b31dc-52ae-4716-b49d-9245f974baae', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'867b67dc-039c-48c6-b74a-10da7aa493da')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'19f33169-1a44-4d05-94d5-92cfaf99b42d', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'ecf304f4-d1f3-4bcf-8088-e759463344b5')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'93c0f657-efac-4e9d-8ecf-9360f6334764', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'0311974e-fa33-4046-940b-b22fb04d86e7')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'5fc57da4-39b9-4d98-803d-94ecfd45ffd8', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'9df733a7-7816-4ab8-b2a7-62a40599f9d6')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'9ef1b18b-f46e-41bf-a7c7-95146b7fe63e', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'87f7dacf-7af4-42aa-a4a9-e876c69ff022')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'4c592baa-61f5-481b-8cae-952f5c70f1c3', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'c6008a45-01d1-4621-b47f-dd2865ab3d09')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'9510fe19-ea67-4fdd-92b0-95ae01e9a432', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'7db019d0-60c2-4b3b-9881-1871cefccff0')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'90cfe88f-711f-4c27-a688-95b8190863ec', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'50bd3e2f-6177-4f6c-9bce-73aad5edc991')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'62d0d186-e70c-4151-a984-96d6dde0b150', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'fcbeb8ce-b515-499d-a10b-22e36aaba0c6')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'1f4bcadb-c59d-4b0e-95b6-9778927aa3b7', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'26350420-b968-4d4c-b06d-4ab14dea005b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'7aa989c1-6aaf-4656-b51b-980de731bd47', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'9df733a7-7816-4ab8-b2a7-62a40599f9d6')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'62efd63f-3489-47f0-857f-9a3e8b0c9a95', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'a3186a0d-72f7-4c72-a583-2252f0797d62')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'eba3b0ca-fec8-43c1-87f6-9a663cd291ed', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'391853fe-fe57-4bd8-bad3-b740f93ec275')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'a4c0eeeb-beb8-4f0d-8d01-9c3f0c036891', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'eba4f878-33a7-4516-b95f-8cfa430c9ead')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'c823904a-4537-4bd6-89bd-9c41bea52b5b', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'134bf0a3-c4eb-4a52-bafd-96a6630b869d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'a97e0a83-e936-4cff-9d34-9c55801652e5', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'962001b4-62c2-427a-91fa-8728626e1832')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'5f06cbf1-0403-4561-9e26-9cbe34ac8dfd', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'9e1bb115-c9a7-45d4-93e5-36b35a3050d1')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'ece8af0e-63bd-4228-8e14-9d904705340d', N'7d17386f-ae6d-4d2a-aa36-edd066a74f29', N'be41d524-a635-4407-a797-e4d5dea0ac4c')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'b6f5d807-6e44-4862-9f14-9f64aa803575', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'87f7dacf-7af4-42aa-a4a9-e876c69ff022')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'95c73fba-58a2-4ae8-8667-a0304a6c65f3', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'4ceb51df-abbd-4688-ac2f-e8ce1bd4a7ed')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'dfcc1e32-8c19-45cf-93bb-a0c4cd060c29', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'695aca49-37b8-4c69-ac2a-c78e660bc527')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'1dc33e1c-d3fb-42ef-b348-a1667ae57eb9', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'ee9feafd-c4c5-414c-99e9-e5290622cbb1')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'0eae30bb-9e4b-4e4f-be33-a2a79fa712c8', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'4ceb51df-abbd-4688-ac2f-e8ce1bd4a7ed')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'37ceb57c-f557-45a8-a30f-a354e30eb709', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'1464f7ed-0675-4013-a0b0-dbf5b012533d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'9d9cf261-d96b-4af4-b062-a467998fc834', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'54567cd8-4682-4411-af17-5e68713f5861')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'524aaaeb-4229-46d8-8ccb-a791489a6ac2', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'0311974e-fa33-4046-940b-b22fb04d86e7')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'135859b7-0044-4628-a13e-a87fd417cd48', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'a2fe4b36-1fcd-4203-ad4d-d7090da768a6')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'6dcbd4d5-7761-4c38-b625-a8d5362744a8', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'422a2df9-97d0-47f0-88f3-ad47bd9d18b0')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'4815da97-a7da-440a-a480-a95ed582bd48', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'422a2df9-97d0-47f0-88f3-ad47bd9d18b0')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'27292b1d-d005-406d-b68b-a96274fee2ba', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'ecf304f4-d1f3-4bcf-8088-e759463344b5')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'd9b52d0d-151d-4609-9ecc-aa5793cc81b8', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'abaafd8b-d9ed-49e9-a4e9-62df9df41625')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'91d97870-7ec6-4647-b6b7-aafe68400d7a', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'e2552fd7-878e-4dfa-a71f-2b4c36cc1db9')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'ee8cb71e-d53c-4db9-96b3-ab5243012b3d', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'17939a92-50ef-4c39-9de5-457c67e6ca16')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'12b666cf-e8d6-4121-b62b-ac7ebef77514', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'17939a92-50ef-4c39-9de5-457c67e6ca16')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'beaa4dd8-71da-4d18-8ecf-ad07c880089f', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'f8565d84-01e5-4c95-9013-7ddc95d8536b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'c5a0a6ad-c392-4329-91ea-ad5ea1ef1d3c', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'391853fe-fe57-4bd8-bad3-b740f93ec275')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'ea358df4-c393-49e0-a33d-adb4c29da094', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'92e5c20f-a34d-4eb1-afb2-2be7a912b54b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'1f908c10-740b-4df9-a120-ae0a9655f41c', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'c3ec2606-daa8-4cd4-9d74-bfa55bda83f3')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'67cbb446-330f-4754-88b8-ae91a725790d', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'8a040fd5-89bb-4bc1-a6b7-855a70c0bf0e')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'eec8b0ab-80cd-4a34-893a-b1b00f23b24b', N'792bd5a1-ab64-479e-91c8-f6b018ba7fa2', N'f8565d84-01e5-4c95-9013-7ddc95d8536b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'1f7d7ab4-d654-4002-b2e9-b1b4bca1b92f', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'10be71f9-e316-4be9-9823-103ac5fdf8c4')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'7d0448af-683d-4cc3-bd1f-b1f1355eb17f', N'792bd5a1-ab64-479e-91c8-f6b018ba7fa2', N'422a2df9-97d0-47f0-88f3-ad47bd9d18b0')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'72949cc3-a73d-4b73-b5dd-b2d12cca74dc', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'202f747d-a1fc-4054-ac58-e2a8f861296a')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'63ca88ba-4d6b-4dfa-ac67-b5b55d63d053', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'202f747d-a1fc-4054-ac58-e2a8f861296a')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'68177acf-0db2-4c67-85d5-b62fb2c779eb', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'bba8381f-078e-4aad-aade-9f3f1e0d0276')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'421f3888-6def-4b51-badb-b70eda3d749f', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'1464f7ed-0675-4013-a0b0-dbf5b012533d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'a7101381-ec31-4f7b-8f9e-b73c548fb589', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'422a2df9-97d0-47f0-88f3-ad47bd9d18b0')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'00ebc04b-eee2-4570-b459-b9c9ddc158f2', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'102c117a-fdcf-4cde-a2ac-009a99896952')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'65875235-3485-4bdf-a51e-ba0fecf10e0e', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'695aca49-37b8-4c69-ac2a-c78e660bc527')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'21b7fa24-bc94-4834-9861-ba3e8f518cad', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'a1e99614-24b3-431e-bef3-c3c55776dde5')
GO
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'3c3b60a4-4560-4195-b84b-bac07068f56a', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'9e1bb115-c9a7-45d4-93e5-36b35a3050d1')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'd13f48d0-31dd-42b9-8df0-bae4311207e9', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'bc733344-5d99-4eb1-9484-d9ca500069a3')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'79664dc1-1fa2-487a-9c86-bc1cc0dbfb20', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'71765d4c-5c9a-4564-9607-5c7e949cdf05')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'65f8dc0d-b639-48a7-85d4-bcd6ef49e4d9', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'be41d524-a635-4407-a797-e4d5dea0ac4c')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'7da4b423-9e89-4984-a7b4-bd1629778df8', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'1464f7ed-0675-4013-a0b0-dbf5b012533d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'92bd9690-178a-47f3-820c-beedac70a61e', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'422a2df9-97d0-47f0-88f3-ad47bd9d18b0')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'87f67a8e-b675-4b7d-8ceb-bf85c3acd3b4', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'50bd3e2f-6177-4f6c-9bce-73aad5edc991')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'728f5f0c-695a-4c38-aeab-c099f3ba7ce2', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'422a2df9-97d0-47f0-88f3-ad47bd9d18b0')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'2ff8543c-ed3f-447f-8b6c-c0a4ea2aa8ef', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'867b67dc-039c-48c6-b74a-10da7aa493da')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'd70a3510-5335-4a25-a7e7-c0df3818b945', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'921e27ed-b53e-40a0-b7a0-91012c47b4c0')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'b2295d39-2a95-428c-a0ac-c118b31e984e', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'559c029a-97d9-4e7b-90b8-62c69524c911')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'3c92afb6-1443-4d7f-9014-c18e87d79221', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'970ddadb-8b98-4648-bf7a-9bdd218e61be')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'5344c663-553b-4432-b366-c1d0e47009ac', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'febf1199-f618-4e3e-b1f7-9e403e80bf80')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'f48b1b87-0b57-4fcd-a779-c230be6f1e1c', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'f52f632c-9620-4c51-9328-5f5b3dd6147b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'e1a690c3-42e9-4d1c-9cd5-c23d2e46d7d4', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'3bfd15f2-6dd0-4806-b7e4-075e49507df9')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'52e373c6-56f6-4335-abe1-c3793d1c928e', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'abaafd8b-d9ed-49e9-a4e9-62df9df41625')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'574a6fcd-bde3-4d84-9c41-c37a4071fe8f', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'559c029a-97d9-4e7b-90b8-62c69524c911')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'ab1b23e4-e158-45d1-b983-c4ca39047d1d', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'be41d524-a635-4407-a797-e4d5dea0ac4c')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'0cb142a8-3a7a-4772-abe1-c4d41876dfed', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'dfe41067-203b-4ad0-9056-6f5240d639ca')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'1cbab2cb-85b0-4cbc-90fb-c4ebde134071', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'23fdc8b8-ea89-4ac4-9ec7-b5b48fa76859')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'16628086-2fbd-4f1d-a9cf-c5d017f6d33a', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'ee9feafd-c4c5-414c-99e9-e5290622cbb1')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'c768a436-2a73-4094-b280-c928cdc031b1', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'bba8381f-078e-4aad-aade-9f3f1e0d0276')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'1776f514-1751-41f5-8a2e-ca5e6b5e9d22', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'94603926-580a-4f1c-9598-56be23eb2c2d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'7468e0a3-b2b8-4c79-99b6-ca9959e17248', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'fcbeb8ce-b515-499d-a10b-22e36aaba0c6')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'f9a8d367-c850-47b5-aeb4-cad9a619147a', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'beffe19e-eea7-43f7-bc81-514050be483e')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'b3365bc7-c636-4fcd-bf54-caeb355c0191', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'70955be1-398f-4c67-9d40-b9f643a91b9d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'9da9a13f-77e2-49b6-b353-cb8ee9b4be5e', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'8d74332e-2927-413a-91a6-0188729e32ce')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'477314ac-eb25-4521-8176-cd0882c5f50d', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'134bf0a3-c4eb-4a52-bafd-96a6630b869d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'8103b1a6-d5a0-4dc5-ab4c-ce9907529d23', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'eba4f878-33a7-4516-b95f-8cfa430c9ead')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'70ec1932-370a-4ca2-85b8-cf28fe12179e', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'94603926-580a-4f1c-9598-56be23eb2c2d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'78fe58f7-ea0a-4d76-a47f-d01c7d03e4b6', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'71765d4c-5c9a-4564-9607-5c7e949cdf05')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'fee7ad4d-43b3-4fa1-a812-d0a4df69408a', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'970ddadb-8b98-4648-bf7a-9bdd218e61be')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'a1883813-3b9b-4a93-b58a-d181c233bc21', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'ee9feafd-c4c5-414c-99e9-e5290622cbb1')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'ae05e357-9d38-4b87-913e-d186dbc36c10', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'a2fe4b36-1fcd-4203-ad4d-d7090da768a6')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'6611d77c-f31a-4e37-ab1b-d1d2277010eb', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'e2552fd7-878e-4dfa-a71f-2b4c36cc1db9')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'b655383c-1cb5-4146-9957-d407bfb40a7d', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'dc9ea1c3-61df-4da8-a7ee-0d3f9d07c545')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'3c619491-6c7c-4a7c-8968-d82cb9e86ef5', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'4ceb51df-abbd-4688-ac2f-e8ce1bd4a7ed')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'59e9a7f3-4fb3-49a8-809e-d83893e9d8db', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'50bd3e2f-6177-4f6c-9bce-73aad5edc991')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'ba5973ae-0dc8-4bc5-ba89-da274382155f', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'92e5c20f-a34d-4eb1-afb2-2be7a912b54b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'c9b702a4-8651-4eee-a6ef-daad273807af', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'70955be1-398f-4c67-9d40-b9f643a91b9d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'1ece9526-ef46-43f0-b2b4-dc496daa1b1a', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'50bd3e2f-6177-4f6c-9bce-73aad5edc991')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'700e4d6e-8424-4c2f-988a-de2ca0c1138d', N'7d17386f-ae6d-4d2a-aa36-edd066a74f29', N'f8565d84-01e5-4c95-9013-7ddc95d8536b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'82bfbcf4-614a-46b3-a6fd-de8a2d14fe1b', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'bba8381f-078e-4aad-aade-9f3f1e0d0276')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'587d6b3c-1a76-4ff4-be7f-de9249b2c8a6', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'c93ea36f-8adf-40b9-b954-f80d60d20bfe')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'72c112d4-8d9f-443f-bf97-def563ca6995', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'10be71f9-e316-4be9-9823-103ac5fdf8c4')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'146392bd-ca9a-4090-aa32-df384b02c964', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'0471564e-d1a1-4055-b392-957ab3aef06c')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'a7a4e6ad-1257-4600-8ddb-e1adc1385002', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'4ceb51df-abbd-4688-ac2f-e8ce1bd4a7ed')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'f64a38a4-ff19-4b6a-854c-e259587e6d6f', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'8a040fd5-89bb-4bc1-a6b7-855a70c0bf0e')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'd33c7bee-c191-47e5-b7f4-e3c807e37579', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'134bf0a3-c4eb-4a52-bafd-96a6630b869d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'0b209d67-6030-42b9-acb8-e3f5f0bae7cd', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'10be71f9-e316-4be9-9823-103ac5fdf8c4')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'f509412b-d556-4254-85e4-e4661aa622c3', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'202f747d-a1fc-4054-ac58-e2a8f861296a')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'771d0a81-46ce-47f9-9ba6-e49406f560ff', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'afc6ed5b-c15c-4938-8a1e-dccb00e73104')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'2e38d90e-8151-4679-b998-e4cc16fa425e', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'c2e03eed-89d5-4d15-948d-b66a3661d579')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'c1253f81-ce17-4a55-82e1-e5a6c6e8a941', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'695aca49-37b8-4c69-ac2a-c78e660bc527')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'7132e83b-ca04-4e87-891e-e9ad94d5030a', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'f8565d84-01e5-4c95-9013-7ddc95d8536b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'7a457e3b-15dc-4fd3-a4d3-e9af05ff8dd0', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'bc733344-5d99-4eb1-9484-d9ca500069a3')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'6560ec3c-ec8b-43b3-a23c-ea1a44c224a8', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'eba4f878-33a7-4516-b95f-8cfa430c9ead')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'2d620fe0-393d-47e6-b742-ea65ca652aeb', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'c93ea36f-8adf-40b9-b954-f80d60d20bfe')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'26ff8d6d-d86e-42c9-b327-ea7b3ff63fcb', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'054ae6cf-ee5e-4c84-a737-dc9dd356e8af')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'866ad33a-4313-4dcd-8be6-eaa82a864a74', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'c5a0d07a-1d45-471a-acb7-977e37894a3d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'3976321d-97f6-40e0-a67e-eb43552610b1', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'f8565d84-01e5-4c95-9013-7ddc95d8536b')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'e60231e5-deb9-4175-839a-eb50f0b2fa51', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'c5a0d07a-1d45-471a-acb7-977e37894a3d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'95ea0613-1211-4d5c-ab4d-ed487e643194', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'c5a0d07a-1d45-471a-acb7-977e37894a3d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'd6bc37d7-76c9-40ab-82da-ed875d1a00a0', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'17939a92-50ef-4c39-9de5-457c67e6ca16')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'b7e324b8-cf1b-4b01-9c46-edc9ddb6be99', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'dc9ea1c3-61df-4da8-a7ee-0d3f9d07c545')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'2bb95942-6f5e-4a18-910d-ee2203d91ad5', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'e2552fd7-878e-4dfa-a71f-2b4c36cc1db9')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'79c0989f-5769-41ae-996f-ee875450c39c', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'970ddadb-8b98-4648-bf7a-9bdd218e61be')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'3ea84016-48a8-4016-87fe-ef7e67ed358d', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'c5a0d07a-1d45-471a-acb7-977e37894a3d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'6dbb36aa-e8f1-4dd2-b553-efa333a8dae7', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'ac7bf522-88a3-42fd-a20e-4e0d9e812aca')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'dcaaf3ea-4784-47ce-adbf-efd0165132f3', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'2ebb9293-af47-49e5-a593-372abab7f299')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'238571d8-34bb-4c9d-9f21-f08f77fe2dbf', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'921e27ed-b53e-40a0-b7a0-91012c47b4c0')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'857e6155-52c8-4131-9d25-f139a22752bd', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'6ae184b6-a1c7-43a7-8567-5d9fa60e04a3')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'a2b273c6-86d9-4c35-ba8c-f1fc76164b54', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'f2f2224e-ca3c-482a-b2ae-13e6929300a8')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'ab86f16c-0991-480f-af34-f296d7fa8b7e', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'29e692c4-fb03-4d82-b611-670c37d746e1')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'6cc378ac-7505-4df5-afc6-f2a6b5356a02', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'17939a92-50ef-4c39-9de5-457c67e6ca16')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'a2bbf01c-36f2-44b2-b33b-f39055d8133b', N'792bd5a1-ab64-479e-91c8-f6b018ba7fa2', N'134bf0a3-c4eb-4a52-bafd-96a6630b869d')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'9e3b5fd2-1c6c-4571-9e07-f5e263582dd1', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'c6008a45-01d1-4621-b47f-dd2865ab3d09')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'b8f65328-67fe-488c-a829-f602e0ac65dd', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'962001b4-62c2-427a-91fa-8728626e1832')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'587b7a32-e19b-47be-b265-f79c361c0bd4', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'c93ea36f-8adf-40b9-b954-f80d60d20bfe')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'9ae0eb3c-99cc-4432-9182-f7c3ecb3ccb3', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'102c117a-fdcf-4cde-a2ac-009a99896952')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'be32bad4-73cd-4c49-a8ba-f8c663bbc6c1', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'29e692c4-fb03-4d82-b611-670c37d746e1')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'2b5ae777-5d45-4c40-9996-f9b0d526acd3', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'962001b4-62c2-427a-91fa-8728626e1832')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'a3e7eebc-d0e5-4dc9-90e5-fa75630adeb0', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'ca09051e-3817-4341-9482-866f6f6b2901')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'743908ad-8c7c-44e8-8ada-fabca0e1ae68', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'a1e99614-24b3-431e-bef3-c3c55776dde5')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'4a22ce8c-f18d-4d5e-a945-fc611a50f373', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'ca09051e-3817-4341-9482-866f6f6b2901')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'be257d3b-4702-4791-9d04-fc812db5d91f', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'ac247eed-0f38-4016-be64-753285b5dfc3')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'77249732-2250-4283-8370-fcb4266f0002', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'102c117a-fdcf-4cde-a2ac-009a99896952')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'279646e4-3464-439d-acc1-fce13e4b2081', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'6ae184b6-a1c7-43a7-8567-5d9fa60e04a3')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'730d3153-0cb8-4907-b857-fdc4b6b9edc2', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'ee9feafd-c4c5-414c-99e9-e5290622cbb1')
INSERT [dbo].[PropertyAmenity] ([PropertyAmenityId], [PropertyId], [AmenityId]) VALUES (N'b968c4c2-f951-4c32-84c5-fdf42cf18f65', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'ca09051e-3817-4341-9482-866f6f6b2901')
GO
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'ca155c7c-2ecb-4486-a2f4-04ef843f0770', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'637712753182764481_55844031_4_am_07_18_03_9_FdG8UVQ_600_900.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-10-31T11:08:38.497' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'bbc4aa42-dad4-4b95-93af-1391f5dab9ed', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'Revanta_Brochure.pdf', 2, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-10-22T14:29:05.620' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'ecffcded-7878-4c99-8a3b-1a6ea57f088d', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'637712767167842381_avenue_slide_2_5xRwZTTSd.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-10-31T11:31:56.810' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'5cb0d5bd-06ea-4e62-8594-2a9ae4df5bdb', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'637712753182805783_55844031_6_am_04_final_02_Final-17_UwlKYoINg0_600_900.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-10-31T11:08:38.497' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'33288794-2eab-4fae-919f-2d27abe9efb8', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'637705472186331788_04Overall-Swimingpool-CP_View_Edit-scaled.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-10-22T13:33:25.660' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'5c91bdd5-4675-41a3-9738-4889e8dda4ec', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'637705472186316888_02.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-10-22T13:33:25.610' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'a06607f7-755f-4b4d-b130-5fb6bd813a04', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'637712598148056176_ananta 3.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-10-31T06:50:14.890' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'd4cf9c24-0c94-480c-a127-734faac38cde', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'637712767167878248_DSC_1555_tddAlEUBN.jpg', 2, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-10-31T11:31:56.810' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'8f170253-8ffa-45a9-a03e-7f5462e35aa0', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'637712598147969833_ananta 2.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-10-31T06:50:14.890' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'b8df2b6a-59ee-4226-be88-8ae9da0d24fa', N'792bd5a1-ab64-479e-91c8-f6b018ba7fa2', N'1.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-07-10T01:26:49.663' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'2b7c4db0-47b8-402a-89e1-941b5dfefdd0', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'637713685014365612_55844031_1_hivalik-Sharda-Park-View-2-8_600_900.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-11-01T13:01:41.647' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'2fa2df06-084d-45a2-849a-94c1ef449475', N'792bd5a1-ab64-479e-91c8-f6b018ba7fa2', N'2.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-07-10T01:26:51.440' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'08730a5e-e16e-46a0-9e59-9e889c8d5f5e', N'7d17386f-ae6d-4d2a-aa36-edd066a74f29', N'1.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-07-10T01:29:39.953' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'ff4bd2ef-3751-482a-917c-a040e9cccc26', N'b54469c2-a83a-4674-8c8d-e98745d2a345', N'637712598148124905_anata.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-10-31T06:50:14.890' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'cfe53ffb-3b50-46f3-b9e2-b78c4ebd69b5', N'4a5dfa5e-3398-4f17-b36a-d3788dba410a', N'637712767167899584_DSC_1564_3Ip4CNlSK.jpg', 2, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-10-31T11:31:56.810' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'366cca0a-6b3d-4fb4-9f36-c4fb208cba0f', N'7d17386f-ae6d-4d2a-aa36-edd066a74f29', N'2.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-07-10T01:29:41.217' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'8a7c6557-b653-442f-97e6-c627f8483f3c', N'cbe14b11-2ea0-4f80-8a29-7499c85f04ce', N'637712753182726381_55844031_1_hivalik-Sharda-Park-View-2-8_600_900.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-10-31T11:08:38.487' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'4fff1069-b651-48c8-b93e-d399638f3cf3', N'd2eb52c5-0ac9-4c70-bc62-61cdff5c2ec4', N'637713685014383913_55844031_4_am_07_18_03_9_FdG8UVQ_600_900.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-11-01T13:01:41.660' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'a66d5288-4fc5-464f-acda-e8bafca45182', N'792bd5a1-ab64-479e-91c8-f6b018ba7fa2', N'3.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-07-10T01:26:52.460' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'088aae89-e859-4bcf-9ba5-f17ae5855e1c', N'7d17386f-ae6d-4d2a-aa36-edd066a74f29', N'3.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-07-10T01:29:43.300' AS DateTime))
INSERT [dbo].[PropertyImage] ([PropertyImageId], [PropertyId], [ImageName], [ImageType], [CreatedBy], [CreatedDate]) VALUES (N'3abbd05b-dd13-4009-a968-f669b40737d1', N'2fed6ac9-5547-4340-b038-7e8f7405030e', N'637705472186316888_01.jpg', 1, N'6d089da9-98ce-4e44-971d-e304ad74af53', CAST(N'2021-10-22T13:33:25.660' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PropertyStatus] ON 

INSERT [dbo].[PropertyStatus] ([PropertyStatusId], [PropertyStatusName], [Status]) VALUES (1, N'For Buy', 0)
INSERT [dbo].[PropertyStatus] ([PropertyStatusId], [PropertyStatusName], [Status]) VALUES (2, N'For Sale', 1)
INSERT [dbo].[PropertyStatus] ([PropertyStatusId], [PropertyStatusName], [Status]) VALUES (3, N'For Rent', 1)
SET IDENTITY_INSERT [dbo].[PropertyStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyType] ON 

INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName], [IsCommarcial], [Status]) VALUES (1, N'Residential Apartment', 0, 1)
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName], [IsCommarcial], [Status]) VALUES (2, N'House/Villa', 0, 1)
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName], [IsCommarcial], [Status]) VALUES (3, N'Plot/Land', 0, 1)
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName], [IsCommarcial], [Status]) VALUES (4, N'Farm house', 0, 1)
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName], [IsCommarcial], [Status]) VALUES (5, N'Studio Apartment', 0, 1)
INSERT [dbo].[PropertyType] ([PropertyTypeId], [PropertyTypeName], [IsCommarcial], [Status]) VALUES (6, N'Serviced Apartment', 0, 1)
SET IDENTITY_INSERT [dbo].[PropertyType] OFF
GO
SET IDENTITY_INSERT [dbo].[Test] ON 

INSERT [dbo].[Test] ([Id], [FirstName], [LastName]) VALUES (1, N'asd', NULL)
INSERT [dbo].[Test] ([Id], [FirstName], [LastName]) VALUES (2, N'werwer', NULL)
INSERT [dbo].[Test] ([Id], [FirstName], [LastName]) VALUES (3, N'asdasd', NULL)
INSERT [dbo].[Test] ([Id], [FirstName], [LastName]) VALUES (4, N'asdasdasd', NULL)
INSERT [dbo].[Test] ([Id], [FirstName], [LastName]) VALUES (5, N'ww', NULL)
INSERT [dbo].[Test] ([Id], [FirstName], [LastName]) VALUES (6, N'wwW', NULL)
SET IDENTITY_INSERT [dbo].[Test] OFF
GO
INSERT [dbo].[User] ([id], [email], [passwordhash], [passwordsalt], [emailverificationlink], [emailverified], [emailverifieddate], [firstname], [middlename], [lastname], [profilephoto], [gender], [birthdate], [displayofficialbadge], [status], [createdby], [createddate], [modifiedby], [modifieddate]) VALUES (N'9744c21b-f467-4cef-a220-0d7268da7490', N'kgajjar200@gmail.com', N'6HSbGt7rMuSnLKJ8DYEaQRnEVpv7J/joGrFCjMhGuJA=', N'NyaDNd1pMQRb3N+SYj/4GaZCRLU9DnRtQ4eXNJ1NpXg=', NULL, 0, NULL, N'Kaushal', NULL, N'Gajjar', NULL, NULL, NULL, 0, 0, NULL, CAST(N'2021-03-05T18:31:48.810' AS DateTime), NULL, NULL)
INSERT [dbo].[User] ([id], [email], [passwordhash], [passwordsalt], [emailverificationlink], [emailverified], [emailverifieddate], [firstname], [middlename], [lastname], [profilephoto], [gender], [birthdate], [displayofficialbadge], [status], [createdby], [createddate], [modifiedby], [modifieddate]) VALUES (N'56d8332f-3ebe-47a6-a5ad-1a91810fddc9', N'kgajjar2000@gmail.com', N'6HSbGt7rMuSnLKJ8DYEaQRnEVpv7J/joGrFCjMhGuJA=', N'NyaDNd1pMQRb3N+SYj/4GaZCRLU9DnRtQ4eXNJ1NpXg=', NULL, 0, NULL, N'Kaushal', NULL, N'Gajjar', NULL, NULL, NULL, 0, 0, NULL, CAST(N'2021-03-05T18:37:03.343' AS DateTime), NULL, NULL)
INSERT [dbo].[User] ([id], [email], [passwordhash], [passwordsalt], [emailverificationlink], [emailverified], [emailverifieddate], [firstname], [middlename], [lastname], [profilephoto], [gender], [birthdate], [displayofficialbadge], [status], [createdby], [createddate], [modifiedby], [modifieddate]) VALUES (N'6d089da9-98ce-4e44-971d-e304ad74af53', N'kgajjar20@gmail.com', N'6HSbGt7rMuSnLKJ8DYEaQRnEVpv7J/joGrFCjMhGuJA=', N'NyaDNd1pMQRb3N+SYj/4GaZCRLU9DnRtQ4eXNJ1NpXg=', NULL, 1, CAST(N'2021-02-13T03:03:58.793' AS DateTime), N'Kaushal', N'A', N'Gajjar', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL)
GO
ALTER TABLE [dbo].[Amenities] ADD  CONSTRAINT [DF_Table_1_AmenitiesId]  DEFAULT (newid()) FOR [AmenityId]
GO
ALTER TABLE [dbo].[Amenities] ADD  CONSTRAINT [DF_amenities_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ConstructionStatus] ADD  CONSTRAINT [DF_ConstructionStatus_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_ContactId]  DEFAULT (newid()) FOR [ContactId]
GO
ALTER TABLE [dbo].[Property] ADD  CONSTRAINT [DF_Property_PropertyId]  DEFAULT (newid()) FOR [PropertyId]
GO
ALTER TABLE [dbo].[Property] ADD  CONSTRAINT [DF_Property_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[PropertyAmenity] ADD  CONSTRAINT [DF_PropertyAmenity_PropertyAmenityId]  DEFAULT (newid()) FOR [PropertyAmenityId]
GO
ALTER TABLE [dbo].[PropertyFloorPlan] ADD  CONSTRAINT [DF_PropertyFloorPlan_PropertyFloorPlanId]  DEFAULT (newid()) FOR [PropertyFloorPlanId]
GO
ALTER TABLE [dbo].[PropertyImage] ADD  CONSTRAINT [DF_PropertyImage_PropertyImageId]  DEFAULT (newid()) FOR [PropertyImageId]
GO
ALTER TABLE [dbo].[PropertyStatus] ADD  CONSTRAINT [DF_PropertyStatus_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[PropertyType] ADD  CONSTRAINT [DF_PropertyType_IsCommarcial]  DEFAULT ((0)) FOR [IsCommarcial]
GO
ALTER TABLE [dbo].[PropertyType] ADD  CONSTRAINT [DF_PropertyType_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_user_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_user_emailverified]  DEFAULT ((0)) FOR [emailverified]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_user_displayofficialbadge]  DEFAULT ((0)) FOR [displayofficialbadge]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_user_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_ConstructionStatus] FOREIGN KEY([ConstructionStatusId])
REFERENCES [dbo].[ConstructionStatus] ([ConstructionStatusId])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_ConstructionStatus]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([PropertyId])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_Property]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_PropertyStatus] FOREIGN KEY([PropertyStatusId])
REFERENCES [dbo].[PropertyStatus] ([PropertyStatusId])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_PropertyStatus]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_PropertyType] FOREIGN KEY([PropertyTypeId])
REFERENCES [dbo].[PropertyType] ([PropertyTypeId])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_PropertyType]
GO
ALTER TABLE [dbo].[PropertyAmenity]  WITH CHECK ADD  CONSTRAINT [FK_PropertyAmenity_amenities] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenities] ([AmenityId])
GO
ALTER TABLE [dbo].[PropertyAmenity] CHECK CONSTRAINT [FK_PropertyAmenity_amenities]
GO
ALTER TABLE [dbo].[PropertyAmenity]  WITH CHECK ADD  CONSTRAINT [FK_PropertyAmenity_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([PropertyId])
GO
ALTER TABLE [dbo].[PropertyAmenity] CHECK CONSTRAINT [FK_PropertyAmenity_Property]
GO
ALTER TABLE [dbo].[PropertyFloorPlan]  WITH CHECK ADD  CONSTRAINT [FK_PropertyFloorPlan_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([PropertyId])
GO
ALTER TABLE [dbo].[PropertyFloorPlan] CHECK CONSTRAINT [FK_PropertyFloorPlan_Property]
GO
ALTER TABLE [dbo].[PropertyImage]  WITH CHECK ADD  CONSTRAINT [FK_PropertyImage_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([PropertyId])
GO
ALTER TABLE [dbo].[PropertyImage] CHECK CONSTRAINT [FK_PropertyImage_Property]
GO
