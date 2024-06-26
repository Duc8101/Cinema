USE [master]
GO
/****** Object:  Database [CinemaSpringBoot]    Script Date: 2024-03-10 3:41:55 PM ******/
CREATE DATABASE [CinemaSpringBoot]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CinemaSpringBoot', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLDEV\MSSQL\DATA\CinemaSpringBoot.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CinemaSpringBoot_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLDEV\MSSQL\DATA\CinemaSpringBoot_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CinemaSpringBoot] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CinemaSpringBoot].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CinemaSpringBoot] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET ARITHABORT OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CinemaSpringBoot] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CinemaSpringBoot] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CinemaSpringBoot] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CinemaSpringBoot] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET RECOVERY FULL 
GO
ALTER DATABASE [CinemaSpringBoot] SET  MULTI_USER 
GO
ALTER DATABASE [CinemaSpringBoot] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CinemaSpringBoot] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CinemaSpringBoot] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CinemaSpringBoot] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CinemaSpringBoot] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CinemaSpringBoot] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CinemaSpringBoot', N'ON'
GO
ALTER DATABASE [CinemaSpringBoot] SET QUERY_STORE = ON
GO
ALTER DATABASE [CinemaSpringBoot] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CinemaSpringBoot]
GO
/****** Object:  Table [dbo].[bookings]    Script Date: 2024-03-10 3:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookings](
	[booking_id] [int] IDENTITY(1,1) NOT NULL,
	[show_id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[seat_status] [varchar](1000) NOT NULL,
	[amount] [money] NOT NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[countries]    Script Date: 2024-03-10 3:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries](
	[country_code] [nchar](3) NOT NULL,
	[country_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[country_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[films]    Script Date: 2024-03-10 3:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[films](
	[film_id] [int] IDENTITY(1,1) NOT NULL,
	[genre_id] [int] NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[year] [int] NOT NULL,
	[country_code] [nchar](3) NOT NULL,
 CONSTRAINT [PK_Films] PRIMARY KEY CLUSTERED 
(
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genres]    Script Date: 2024-03-10 3:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genres](
	[genre_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rooms]    Script Date: 2024-03-10 3:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rooms](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[number_rows] [int] NOT NULL,
	[number_cols] [int] NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shows]    Script Date: 2024-03-10 3:41:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shows](
	[show_id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [int] NOT NULL,
	[film_id] [int] NOT NULL,
	[show_date] [date] NOT NULL,
	[price] [money] NOT NULL,
	[status] [bit] NOT NULL,
	[slot] [int] NOT NULL,
 CONSTRAINT [PK_Shows] PRIMARY KEY CLUSTERED 
(
	[show_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bookings] ON 

INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (1, 3, N'Lien', N'0011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 10.0000)
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (2, 3, N'Lam', N'1100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 10.0000)
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (3, 5, N'Lan', N'0000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 20.0000)
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (4, 5, N'Kien', N'0011100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 30.0000)
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (5, 5, N'Minh', N'0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 10.0000)
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (6, 5, N'Huong', N'1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 10.0000)
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (7, 3, N'Mai', N'0000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 10.0000)
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (8, 6, N'huong', N'1110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 30.0000)
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (9, 9, N'lan', N'1110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 30.0000)
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (10, 11, N'k', N'1110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 30.0000)
SET IDENTITY_INSERT [dbo].[bookings] OFF
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ABW', N'Aruba')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'AFG', N'Afghanistan')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'AGO', N'Angola')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'AIA', N'Anguilla')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ALB', N'Albania')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'AND', N'Andorra')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ANT', N'Netherlands Antilles')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ARE', N'United Arab Emirates')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ARG', N'Argentina')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ARM', N'Armenia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ASM', N'American Samoa')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ATA', N'Antarctica')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ATG', N'Antigua and Barbuda')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'AUS', N'Australia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'AUT', N'Austria')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'AZE', N'Azerbaijan')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BDI', N'Burundi')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BEL', N'Belgium')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BEN', N'Benin')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BFA', N'Burkina Faso')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BGD', N'Bangladesh')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BGR', N'Bulgaria')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BHR', N'Bahrain')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BHS', N'Bahamas')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BIH', N'Bosnia and Herzegovina')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BLM', N'Saint Barthelemy')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BLR', N'Belarus')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BLZ', N'Belize')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BMU', N'Bermuda')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BOL', N'Bolivia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BRA', N'Brazil')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BRB', N'Barbados')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BRN', N'Brunei')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BTN', N'Bhutan')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BWA', N'Botswana')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CAF', N'Central African Republic')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CAN', N'Canada')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CCK', N'Cocos (Keeling) Islands')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CHE', N'Switzerland')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CHL', N'Chile')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CHN', N'China')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CIV', N'Ivory Coast')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CMR', N'Cameroon')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'COD', N'Democratic Republic of the Congo')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'COG', N'Republic of the Congo')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'COK', N'Cook Islands')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'COL', N'Colombia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'COM', N'Comoros')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CPV', N'Cape Verde')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CRC', N'Costa Rica')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CUB', N'Cuba')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CXR', N'Christmas Island')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CYM', N'Cayman Islands')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CYP', N'Cyprus')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CZE', N'Czech Republic')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'DEU', N'Germany')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'DJI', N'Djibouti')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'DMA', N'Dominica')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'DNK', N'Denmark')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'DOM', N'Dominican Republic')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'DZA', N'Algeria')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ECU', N'Ecuador')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'EGY', N'Egypt')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ERI', N'Eritrea')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ESH', N'Western Sahara')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ESP', N'Spain')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'EST', N'Estonia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ETH', N'Ethiopia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'FIN', N'Finland')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'FJI', N'Fiji')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'FLK', N'Falkland Islands')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'FRA', N'France')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'FRO', N'Faroe Islands')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'FSM', N'Micronesia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GAB', N'Gabon')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GBR', N'United Kingdom')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GEO', N'Georgia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GHA', N'Ghana')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GIB', N'Gibraltar')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GIN', N'Guinea')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GMB', N'Gambia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GNB', N'Guinea-Bissau')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GNQ', N'Equatorial Guinea')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GRC', N'Greece')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GRD', N'Grenada')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GRL', N'Greenland')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GTM', N'Guatemala')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GUM', N'Guam')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GUY', N'Guyana')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'HKG', N'Hong Kong')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'HND', N'Honduras')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'HRV', N'Croatia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'HTI', N'Haiti')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'HUN', N'Hungary')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'IDN', N'Indonesia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'IMN', N'Isle of Man')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'IND', N'India')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'IOT', N'British Indian Ocean Territory')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'IRL', N'Ireland')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'IRN', N'Iran')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'IRQ', N'Iraq')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ISR', N'Israel')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ITA', N'Italy')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'JAM', N'Jamaica')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'JEY', N'Jersey')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'JOR', N'Jordan')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'JPN', N'Japan')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'KAZ', N'Kazakhstan')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'KEN', N'Kenya')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'KGZ', N'Kyrgyzstan')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'KHM', N'Cambodia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'KIR', N'Kiribati')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'KNA', N'Saint Kitts and Nevis')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'KOR', N'South Korea')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'KWT', N'Kuwait')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LAO', N'Laos')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LBN', N'Lebanon')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LBR', N'Liberia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LBY', N'Libya')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LCA', N'Saint Lucia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LIE', N'Liechtenstein')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LKA', N'Sri Lanka')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LSO', N'Lesotho')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LTU', N'Lithuania')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LUX', N'Luxembourg')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LVA', N'Latvia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MAC', N'Macau')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MAF', N'Saint Martin')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MAR', N'Morocco')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MCO', N'Monaco')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MDA', N'Moldova')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MDG', N'Madagascar')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MDV', N'Maldives')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MEX', N'Mexico')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MHL', N'Marshall Islands')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MKD', N'Macedonia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MLI', N'Mali')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MLT', N'Malta')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MMR', N'Burma (Myanmar)')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MNE', N'Montenegro')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MNG', N'Mongolia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MNP', N'Northern Mariana Islands')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MOZ', N'Mozambique')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MRT', N'Mauritania')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MSR', N'Montserrat')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MUS', N'Mauritius')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MWI', N'Malawi')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MYS', N'Malaysia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MYT', N'Mayotte')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NAM', N'Namibia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NCL', N'New Caledonia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NER', N'Niger')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NFK', N'Norfolk Island')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NGA', N'Nigeria')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NIC', N'Nicaragua')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NIU', N'Niue')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NLD', N'Netherlands')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NOR', N'Norway')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NPL', N'Nepal')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NRU', N'Nauru')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NZL', N'New Zealand')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'OMN', N'Oman')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PAK', N'Pakistan')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PAN', N'Panama')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PCN', N'Pitcairn Islands')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PER', N'Peru')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PHL', N'Philippines')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PLW', N'Palau')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PNG', N'Papua New Guinea')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'POL', N'Poland')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PRI', N'Puerto Rico')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PRK', N'North Korea')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PRT', N'Portugal')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PRY', N'Paraguay')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PYF', N'French Polynesia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'QAT', N'Qatar')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ROU', N'Romania')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'RUS', N'Russia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'RWA', N'Rwanda')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SAU', N'Saudi Arabia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SDN', N'Sudan')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SEN', N'Senegal')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SGP', N'Singapore')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SHN', N'Saint Helena')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SJM', N'Svalbard')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SLB', N'Solomon Islands')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SLE', N'Sierra Leone')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SLV', N'El Salvador')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SMR', N'San Marino')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SOM', N'Somalia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SPM', N'Saint Pierre and Miquelon')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SRB', N'Serbia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'STP', N'Sao Tome and Principe')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SUR', N'Suriname')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SVK', N'Slovakia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SVN', N'Slovenia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SWE', N'Sweden')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SWZ', N'Swaziland')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SYC', N'Seychelles')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SYR', N'Syria')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TCA', N'Turks and Caicos Islands')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TCD', N'Chad')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TGO', N'Togo')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'THA', N'Thailand')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TJK', N'Tajikistan')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TKL', N'Tokelau')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TKM', N'Turkmenistan')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TLS', N'Timor-Leste')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TON', N'Tonga')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TTO', N'Trinidad and Tobago')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TUN', N'Tunisia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TUR', N'Turkey')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TUV', N'Tuvalu')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TWN', N'Taiwan')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TZA', N'Tanzania')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'UGA', N'Uganda')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'UKR', N'Ukraine')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'URY', N'Uruguay')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'USA', N'United States')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'UZB', N'Uzbekistan')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'VAT', N'Holy See (Vatican City)')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'VCT', N'Saint Vincent and the Grenadines')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'VEN', N'Venezuela')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'VGB', N'British Virgin Islands')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'VIR', N'US Virgin Islands')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'VNM', N'Vietnam')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'VUT', N'Vanuatu')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'WLF', N'Wallis and Futuna')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'WSM', N'Samoa')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'YEM', N'Yemen')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ZAF', N'South Africa')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ZMB', N'Zambia')
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ZWE', N'Zimbabwe')
GO
SET IDENTITY_INSERT [dbo].[films] ON 

INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (1, 1, N'Iron man I', 2010, N'USA')
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (2, 1, N'Impossible mission', 2010, N'USA')
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (3, 1, N't2', 2010, N'USA')
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (4, 1, N'God father II', 2010, N'USA')
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (5, 3, N'The best enterprise', 2010, N'USA')
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (6, 1, N'Hello AS', 2010, N'USA')
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (7, 1, N'Huong', 2010, N'USA')
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (8, 1, N'Hello AS', 2010, N'USA')
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (9, 1, N'gh', 2010, N'ESP')
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (10, 1, N'kl', 2010, N'ESP')
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (11, 1, N'Hello', 2010, N'ESP')
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (12, 1, N'Hello anh', 2010, N'ESP')
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (13, 1, N't7', 2010, N'USA')
SET IDENTITY_INSERT [dbo].[films] OFF
GO
SET IDENTITY_INSERT [dbo].[genres] ON 

INSERT [dbo].[genres] ([genre_id], [name]) VALUES (1, N'Action')
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (2, N'Adventure')
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (3, N'Business')
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (4, N'Children''s/Family')
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (5, N'Comedy')
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (6, N'Comedy Drama')
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (7, N'Crime')
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (8, N'Culture & Socienty')
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (9, N'Drama')
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (10, N'Education')
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (11, N'Family & Personal Relationship')
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (12, N'Helth & Fitness')
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (13, N'Historical Film')
SET IDENTITY_INSERT [dbo].[genres] OFF
GO
SET IDENTITY_INSERT [dbo].[rooms] ON 

INSERT [dbo].[rooms] ([room_id], [name], [number_rows], [number_cols]) VALUES (1, N'Theatre A', 10, 10)
INSERT [dbo].[rooms] ([room_id], [name], [number_rows], [number_cols]) VALUES (2, N'Theatre B', 10, 15)
INSERT [dbo].[rooms] ([room_id], [name], [number_rows], [number_cols]) VALUES (3, N'Theatre C', 10, 20)
SET IDENTITY_INSERT [dbo].[rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[shows] ON 

INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (1, 1, 1, CAST(N'2014-09-20' AS Date), 7.0000, 0, 1)
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (2, 1, 1, CAST(N'2014-09-20' AS Date), 6.0000, 0, 2)
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (3, 1, 1, CAST(N'2014-09-20' AS Date), 5.0000, 0, 3)
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (4, 1, 1, CAST(N'2014-09-19' AS Date), 9.0000, 0, 1)
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (5, 1, 1, CAST(N'2014-09-19' AS Date), 10.0000, 0, 2)
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (6, 1, 1, CAST(N'2020-05-02' AS Date), 10.0000, 0, 4)
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (7, 1, 3, CAST(N'2020-05-02' AS Date), 20.0000, 0, 2)
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (8, 1, 4, CAST(N'2020-05-02' AS Date), 20.0000, 0, 7)
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (9, 1, 1, CAST(N'2020-05-02' AS Date), 10.0000, 0, 9)
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (10, 1, 3, CAST(N'2020-05-02' AS Date), 10.0000, 0, 1)
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (11, 1, 1, CAST(N'2020-05-02' AS Date), 10.0000, 1, 3)
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (12, 2, 1, CAST(N'2020-05-02' AS Date), 10.0000, 1, 1)
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (13, 1, 1, CAST(N'2020-06-23' AS Date), 10.0000, 0, 1)
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (14, 1, 1, CAST(N'2020-06-23' AS Date), 10.0000, 1, 8)
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (15, 2, 1, CAST(N'2020-05-02' AS Date), 10.0000, 1, 3)
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (16, 1, 1, CAST(N'2020-10-29' AS Date), 10.0000, 0, 1)
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (17, 1, 1, CAST(N'2020-11-12' AS Date), 10.0000, 0, 1)
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (18, 1, 1, CAST(N'2021-03-31' AS Date), 10.0000, 0, 1)
SET IDENTITY_INSERT [dbo].[shows] OFF
GO
ALTER TABLE [dbo].[bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Shows] FOREIGN KEY([show_id])
REFERENCES [dbo].[shows] ([show_id])
GO
ALTER TABLE [dbo].[bookings] CHECK CONSTRAINT [FK_Bookings_Shows]
GO
ALTER TABLE [dbo].[films]  WITH CHECK ADD  CONSTRAINT [FK_Films_Countries] FOREIGN KEY([country_code])
REFERENCES [dbo].[countries] ([country_code])
GO
ALTER TABLE [dbo].[films] CHECK CONSTRAINT [FK_Films_Countries]
GO
ALTER TABLE [dbo].[films]  WITH CHECK ADD  CONSTRAINT [FK_Films_Genres] FOREIGN KEY([genre_id])
REFERENCES [dbo].[genres] ([genre_id])
GO
ALTER TABLE [dbo].[films] CHECK CONSTRAINT [FK_Films_Genres]
GO
ALTER TABLE [dbo].[shows]  WITH CHECK ADD  CONSTRAINT [FK_Shows_Films] FOREIGN KEY([film_id])
REFERENCES [dbo].[films] ([film_id])
GO
ALTER TABLE [dbo].[shows] CHECK CONSTRAINT [FK_Shows_Films]
GO
ALTER TABLE [dbo].[shows]  WITH CHECK ADD  CONSTRAINT [FK_Shows_Rooms] FOREIGN KEY([room_id])
REFERENCES [dbo].[rooms] ([room_id])
GO
ALTER TABLE [dbo].[shows] CHECK CONSTRAINT [FK_Shows_Rooms]
GO
USE [master]
GO
ALTER DATABASE [CinemaSpringBoot] SET  READ_WRITE 
GO
