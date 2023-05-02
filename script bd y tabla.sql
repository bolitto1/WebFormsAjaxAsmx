--primero crear la base de datos: Instituto

USE [instituto]
GO
/****** Object:  Table [dbo].[Estudiantes]    Script Date: 01/05/2023 11:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiantes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](50) NULL,
	[Apellidos] [nvarchar](50) NULL,
	[Cedula] [nchar](13) NULL,
	[FechaNac] [datetime] NULL,
	[edad] [int] NULL,
 CONSTRAINT [PK_Estudiantes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Estudiantes] ON 
GO
INSERT [dbo].[Estudiantes] ([id], [Nombres], [Apellidos], [Cedula], [FechaNac], [edad]) VALUES (8, N'MARIA', N'MENDOZA', N'0703243155   ', CAST(N'1976-12-18T00:00:00.000' AS DateTime), 46)
GO
INSERT [dbo].[Estudiantes] ([id], [Nombres], [Apellidos], [Cedula], [FechaNac], [edad]) VALUES (9, N'VERONICA DEL ROCIO', N'MENDOZA MORAN', N'0703243156   ', CAST(N'1978-06-06T00:00:00.000' AS DateTime), 44)
GO
INSERT [dbo].[Estudiantes] ([id], [Nombres], [Apellidos], [Cedula], [FechaNac], [edad]) VALUES (11, N'BOLIVAR MAURICIO', N'MENDOZA', N'0713243154   ', CAST(N'1976-12-18T00:00:00.000' AS DateTime), 46)
GO
INSERT [dbo].[Estudiantes] ([id], [Nombres], [Apellidos], [Cedula], [FechaNac], [edad]) VALUES (13, N'MAYRA ISABEL', N'PEÑA VERA', N'0703245577   ', CAST(N'1990-07-05T00:00:00.000' AS DateTime), 32)
GO
SET IDENTITY_INSERT [dbo].[Estudiantes] OFF
GO
USE [master]
GO
ALTER DATABASE [instituto] SET  READ_WRITE 
GO
