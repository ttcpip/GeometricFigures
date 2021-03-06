USE [my_test_database]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 20.05.2021 15:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](1024) NOT NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 20.05.2021 15:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](1024) NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products_categories]    Script Date: 20.05.2021 15:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[categoryId] [int] NOT NULL,
 CONSTRAINT [PK_products_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name]) VALUES (1, N'Категория1')
INSERT [dbo].[categories] ([id], [name]) VALUES (2, N'Категория2')
INSERT [dbo].[categories] ([id], [name]) VALUES (3, N'Категория3')
INSERT [dbo].[categories] ([id], [name]) VALUES (4, N'Категория4')
INSERT [dbo].[categories] ([id], [name]) VALUES (5, N'Категория5')
INSERT [dbo].[categories] ([id], [name]) VALUES (6, N'Категория6')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [name]) VALUES (1, N'Продукт1')
INSERT [dbo].[products] ([id], [name]) VALUES (2, N'Продукт2')
INSERT [dbo].[products] ([id], [name]) VALUES (3, N'Продукт3')
INSERT [dbo].[products] ([id], [name]) VALUES (4, N'Продукт4')
INSERT [dbo].[products] ([id], [name]) VALUES (5, N'Продукт5')
INSERT [dbo].[products] ([id], [name]) VALUES (6, N'Продукт6')
INSERT [dbo].[products] ([id], [name]) VALUES (7, N'Продукт7')
INSERT [dbo].[products] ([id], [name]) VALUES (8, N'Продукт8')
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[products_categories] ON 

INSERT [dbo].[products_categories] ([id], [productId], [categoryId]) VALUES (1, 1, 1)
INSERT [dbo].[products_categories] ([id], [productId], [categoryId]) VALUES (2, 2, 1)
INSERT [dbo].[products_categories] ([id], [productId], [categoryId]) VALUES (11, 4, 1)
INSERT [dbo].[products_categories] ([id], [productId], [categoryId]) VALUES (22, 5, 1)
INSERT [dbo].[products_categories] ([id], [productId], [categoryId]) VALUES (15, 1, 2)
INSERT [dbo].[products_categories] ([id], [productId], [categoryId]) VALUES (5, 2, 2)
INSERT [dbo].[products_categories] ([id], [productId], [categoryId]) VALUES (23, 5, 2)
INSERT [dbo].[products_categories] ([id], [productId], [categoryId]) VALUES (7, 6, 2)
INSERT [dbo].[products_categories] ([id], [productId], [categoryId]) VALUES (16, 1, 3)
INSERT [dbo].[products_categories] ([id], [productId], [categoryId]) VALUES (8, 2, 3)
INSERT [dbo].[products_categories] ([id], [productId], [categoryId]) VALUES (10, 4, 3)
INSERT [dbo].[products_categories] ([id], [productId], [categoryId]) VALUES (9, 6, 3)
INSERT [dbo].[products_categories] ([id], [productId], [categoryId]) VALUES (18, 2, 4)
INSERT [dbo].[products_categories] ([id], [productId], [categoryId]) VALUES (4, 3, 4)
INSERT [dbo].[products_categories] ([id], [productId], [categoryId]) VALUES (14, 4, 4)
SET IDENTITY_INSERT [dbo].[products_categories] OFF
GO
/****** Object:  Index [IX_products_categories]    Script Date: 20.05.2021 15:29:12 ******/
ALTER TABLE [dbo].[products_categories] ADD  CONSTRAINT [IX_products_categories] UNIQUE NONCLUSTERED 
(
	[categoryId] ASC,
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[products_categories]  WITH CHECK ADD  CONSTRAINT [FK_products_categories_categories] FOREIGN KEY([categoryId])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[products_categories] CHECK CONSTRAINT [FK_products_categories_categories]
GO
ALTER TABLE [dbo].[products_categories]  WITH CHECK ADD  CONSTRAINT [FK_products_categories_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[products_categories] CHECK CONSTRAINT [FK_products_categories_products]
GO
USE [master]
GO
ALTER DATABASE [my_test_database] SET  READ_WRITE 
GO
