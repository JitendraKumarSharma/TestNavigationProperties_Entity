USE [master]
GO
/****** Object:  Database [EntityDatabase]    Script Date: 20-07-2018 23:44:51 ******/
CREATE DATABASE [EntityDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EntityDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EntityDatabase.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EntityDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EntityDatabase_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EntityDatabase] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EntityDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EntityDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EntityDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EntityDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EntityDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EntityDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [EntityDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EntityDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EntityDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EntityDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EntityDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EntityDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EntityDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EntityDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EntityDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EntityDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EntityDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EntityDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EntityDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EntityDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EntityDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EntityDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EntityDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EntityDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EntityDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [EntityDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EntityDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EntityDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EntityDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EntityDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EntityDatabase]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 20-07-2018 23:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeDetails]    Script Date: 20-07-2018 23:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeDetails](
	[EmpDetailId] [int] IDENTITY(1,1) NOT NULL,
	[Empld] [int] NULL,
	[Address1] [varchar](100) NULL,
	[ContactNumber] [varchar](15) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeProjects]    Script Date: 20-07-2018 23:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeProjects](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](100) NULL,
	[EmpId] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 20-07-2018 23:44:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Salary] [int] NULL,
	[Departmentld] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([ID], [Name], [Location]) VALUES (1, N'IT', N'Mumbai')
INSERT [dbo].[Departments] ([ID], [Name], [Location]) VALUES (2, N'HR', N'Pune')
INSERT [dbo].[Departments] ([ID], [Name], [Location]) VALUES (3, N'Payroll', N'Bangalore')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[EmployeeDetails] ON 

INSERT [dbo].[EmployeeDetails] ([EmpDetailId], [Empld], [Address1], [ContactNumber]) VALUES (1, 1, N'Lucknow', N'8888888888')
INSERT [dbo].[EmployeeDetails] ([EmpDetailId], [Empld], [Address1], [ContactNumber]) VALUES (2, 2, N'Kanpur', N'9999999999')
SET IDENTITY_INSERT [dbo].[EmployeeDetails] OFF
SET IDENTITY_INSERT [dbo].[EmployeeProjects] ON 

INSERT [dbo].[EmployeeProjects] ([ProjectId], [ProjectName], [EmpId]) VALUES (1, N'ShineCity', 1)
INSERT [dbo].[EmployeeProjects] ([ProjectId], [ProjectName], [EmpId]) VALUES (2, N'PG', 1)
INSERT [dbo].[EmployeeProjects] ([ProjectId], [ProjectName], [EmpId]) VALUES (3, N'RecipeCostion', 2)
INSERT [dbo].[EmployeeProjects] ([ProjectId], [ProjectName], [EmpId]) VALUES (4, N'FactorFox', 3)
SET IDENTITY_INSERT [dbo].[EmployeeProjects] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Gender], [Salary], [Departmentld]) VALUES (1, N'Akshay', N'Phadke', N'Male', 60000, 1)
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Gender], [Salary], [Departmentld]) VALUES (2, N'Milind', N'Daware', N'Male', 45000, 3)
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Gender], [Salary], [Departmentld]) VALUES (3, N'Raghvan', N'Nadar', N'Male', 70000, 1)
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Gender], [Salary], [Departmentld]) VALUES (4, N'Umesh', N'Thore', N'Male', 45000, 2)
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Gender], [Salary], [Departmentld]) VALUES (5, N'Kiran', N'Shinde', N'Female', 30000, 2)
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Gender], [Salary], [Departmentld]) VALUES (6, N'Valarie', N'Vikings', N'Female', 35000, 3)
SET IDENTITY_INSERT [dbo].[Employees] OFF
ALTER TABLE [dbo].[EmployeeDetails]  WITH CHECK ADD FOREIGN KEY([Empld])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[EmployeeProjects]  WITH CHECK ADD FOREIGN KEY([EmpId])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([Departmentld])
REFERENCES [dbo].[Departments] ([ID])
GO
USE [master]
GO
ALTER DATABASE [EntityDatabase] SET  READ_WRITE 
GO
