USE [master]
GO
/****** Object:  Database [ExaminationOnline]    Script Date: 10/27/2020 8:04:51 PM ******/
CREATE DATABASE [ExaminationOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExaminationOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ExaminationOnline.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ExaminationOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ExaminationOnline_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ExaminationOnline] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExaminationOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExaminationOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExaminationOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExaminationOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExaminationOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExaminationOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExaminationOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExaminationOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExaminationOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExaminationOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExaminationOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExaminationOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExaminationOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExaminationOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExaminationOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExaminationOnline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ExaminationOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExaminationOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExaminationOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExaminationOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExaminationOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExaminationOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExaminationOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExaminationOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [ExaminationOnline] SET  MULTI_USER 
GO
ALTER DATABASE [ExaminationOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExaminationOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExaminationOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExaminationOnline] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ExaminationOnline] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExaminationOnline', N'ON'
GO
USE [ExaminationOnline]
GO
/****** Object:  Table [dbo].[answers]    Script Date: 10/27/2020 8:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answers](
	[answer_id] [int] IDENTITY(1,1) NOT NULL,
	[exam_id] [int] NOT NULL,
	[question] [varchar](45) NOT NULL,
	[answer] [varchar](45) NOT NULL,
	[correct_answer] [varchar](45) NOT NULL,
	[status] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[answer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 10/27/2020 8:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[course_name] [varchar](25) NOT NULL,
	[total_marks] [int] NOT NULL,
	[time] [varchar](45) NOT NULL,
	[course_id] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exams]    Script Date: 10/27/2020 8:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exams](
	[exam_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [varchar](45) NOT NULL,
	[total_marks] [varchar](45) NOT NULL,
	[obt_marks] [varchar](45) NULL,
	[date] [varchar](45) NOT NULL,
	[start_time] [varchar](45) NOT NULL,
	[end_time] [varchar](45) NULL,
	[exam_time] [varchar](45) NULL,
	[status] [varchar](45) NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_exams] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[questions]    Script Date: 10/27/2020 8:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[questions](
	[question_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [varchar](45) NOT NULL,
	[question] [varchar](255) NOT NULL,
	[opt1] [varchar](85) NOT NULL,
	[opt2] [varchar](85) NOT NULL,
	[opt3] [varchar](85) NOT NULL,
	[opt4] [varchar](85) NOT NULL,
	[correct] [varchar](85) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test]    Script Date: 10/27/2020 8:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[name] [varchar](25) NOT NULL,
	[age] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10/27/2020 8:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](45) NOT NULL,
	[last_name] [varchar](45) NULL,
	[user_name] [varchar](45) NOT NULL,
	[email] [varchar](45) NOT NULL,
	[password] [varchar](45) NOT NULL,
	[user_type] [varchar](45) NOT NULL,
	[contact_no] [varchar](45) NULL,
	[city] [varchar](45) NULL,
	[address] [varchar](45) NULL,
	[isGmailLogin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[exams] ADD  DEFAULT (NULL) FOR [obt_marks]
GO
ALTER TABLE [dbo].[exams] ADD  DEFAULT (NULL) FOR [end_time]
GO
ALTER TABLE [dbo].[exams] ADD  DEFAULT (NULL) FOR [exam_time]
GO
ALTER TABLE [dbo].[exams] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [dbo].[test] ADD  DEFAULT (NULL) FOR [age]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [last_name]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [contact_no]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [city]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [address]
GO
ALTER TABLE [dbo].[answers]  WITH CHECK ADD FOREIGN KEY([exam_id])
REFERENCES [dbo].[exams] ([exam_id])
GO
ALTER TABLE [dbo].[exams]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([course_id])
GO
ALTER TABLE [dbo].[exams]  WITH CHECK ADD  CONSTRAINT [FK_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[exams] CHECK CONSTRAINT [FK_user]
GO
ALTER TABLE [dbo].[questions]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([course_id])
GO
USE [master]
GO
ALTER DATABASE [ExaminationOnline] SET  READ_WRITE 
GO
