USE [master]
GO
/****** Object:  Database [Cinema]    Script Date: 2024-08-09 10:06:15 PM ******/
CREATE DATABASE [Cinema]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cinema', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLDEV\MSSQL\DATA\Cinema.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cinema_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLDEV\MSSQL\DATA\Cinema_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Cinema] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cinema].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cinema] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cinema] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cinema] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cinema] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cinema] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cinema] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cinema] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cinema] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cinema] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cinema] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cinema] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cinema] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cinema] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cinema] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cinema] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Cinema] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cinema] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cinema] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cinema] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cinema] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cinema] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cinema] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cinema] SET RECOVERY FULL 
GO
ALTER DATABASE [Cinema] SET  MULTI_USER 
GO
ALTER DATABASE [Cinema] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cinema] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cinema] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cinema] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cinema] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cinema] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Cinema', N'ON'
GO
ALTER DATABASE [Cinema] SET QUERY_STORE = ON
GO
ALTER DATABASE [Cinema] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Cinema]
GO
/****** Object:  Table [dbo].[bookings]    Script Date: 2024-08-09 10:06:15 PM ******/
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
/****** Object:  Table [dbo].[countries]    Script Date: 2024-08-09 10:06:15 PM ******/
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
/****** Object:  Table [dbo].[films]    Script Date: 2024-08-09 10:06:15 PM ******/
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
/****** Object:  Table [dbo].[genres]    Script Date: 2024-08-09 10:06:15 PM ******/
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
/****** Object:  Table [dbo].[rooms]    Script Date: 2024-08-09 10:06:15 PM ******/
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
/****** Object:  Table [dbo].[shows]    Script Date: 2024-08-09 10:06:15 PM ******/
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
GO
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (1, 3, N'Lien', N'0011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 10.0000)
GO
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (2, 3, N'Lam', N'1100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 10.0000)
GO
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (3, 5, N'Lan', N'0000011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 20.0000)
GO
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (4, 5, N'Kien', N'0011100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 30.0000)
GO
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (5, 5, N'Minh', N'0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 10.0000)
GO
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (6, 5, N'Huong', N'1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 10.0000)
GO
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (7, 3, N'Mai', N'0000110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 10.0000)
GO
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (8, 6, N'huong', N'1110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 30.0000)
GO
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (9, 9, N'lan', N'1110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 30.0000)
GO
INSERT [dbo].[bookings] ([booking_id], [show_id], [name], [seat_status], [amount]) VALUES (10, 11, N'k', N'1110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 30.0000)
GO
SET IDENTITY_INSERT [dbo].[bookings] OFF
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ABW', N'Aruba')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'AFG', N'Afghanistan')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'AGO', N'Angola')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'AIA', N'Anguilla')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ALB', N'Albania')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'AND', N'Andorra')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ANT', N'Netherlands Antilles')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ARE', N'United Arab Emirates')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ARG', N'Argentina')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ARM', N'Armenia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ASM', N'American Samoa')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ATA', N'Antarctica')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ATG', N'Antigua and Barbuda')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'AUS', N'Australia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'AUT', N'Austria')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'AZE', N'Azerbaijan')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BDI', N'Burundi')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BEL', N'Belgium')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BEN', N'Benin')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BFA', N'Burkina Faso')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BGD', N'Bangladesh')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BGR', N'Bulgaria')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BHR', N'Bahrain')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BHS', N'Bahamas')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BIH', N'Bosnia and Herzegovina')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BLM', N'Saint Barthelemy')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BLR', N'Belarus')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BLZ', N'Belize')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BMU', N'Bermuda')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BOL', N'Bolivia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BRA', N'Brazil')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BRB', N'Barbados')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BRN', N'Brunei')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BTN', N'Bhutan')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'BWA', N'Botswana')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CAF', N'Central African Republic')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CAN', N'Canada')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CCK', N'Cocos (Keeling) Islands')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CHE', N'Switzerland')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CHL', N'Chile')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CHN', N'China')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CIV', N'Ivory Coast')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CMR', N'Cameroon')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'COD', N'Democratic Republic of the Congo')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'COG', N'Republic of the Congo')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'COK', N'Cook Islands')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'COL', N'Colombia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'COM', N'Comoros')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CPV', N'Cape Verde')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CRC', N'Costa Rica')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CUB', N'Cuba')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CXR', N'Christmas Island')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CYM', N'Cayman Islands')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CYP', N'Cyprus')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'CZE', N'Czech Republic')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'DEU', N'Germany')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'DJI', N'Djibouti')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'DMA', N'Dominica')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'DNK', N'Denmark')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'DOM', N'Dominican Republic')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'DZA', N'Algeria')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ECU', N'Ecuador')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'EGY', N'Egypt')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ERI', N'Eritrea')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ESH', N'Western Sahara')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ESP', N'Spain')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'EST', N'Estonia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ETH', N'Ethiopia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'FIN', N'Finland')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'FJI', N'Fiji')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'FLK', N'Falkland Islands')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'FRA', N'France')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'FRO', N'Faroe Islands')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'FSM', N'Micronesia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GAB', N'Gabon')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GBR', N'United Kingdom')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GEO', N'Georgia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GHA', N'Ghana')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GIB', N'Gibraltar')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GIN', N'Guinea')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GMB', N'Gambia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GNB', N'Guinea-Bissau')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GNQ', N'Equatorial Guinea')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GRC', N'Greece')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GRD', N'Grenada')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GRL', N'Greenland')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GTM', N'Guatemala')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GUM', N'Guam')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'GUY', N'Guyana')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'HKG', N'Hong Kong')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'HND', N'Honduras')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'HRV', N'Croatia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'HTI', N'Haiti')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'HUN', N'Hungary')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'IDN', N'Indonesia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'IMN', N'Isle of Man')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'IND', N'India')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'IOT', N'British Indian Ocean Territory')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'IRL', N'Ireland')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'IRN', N'Iran')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'IRQ', N'Iraq')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ISR', N'Israel')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ITA', N'Italy')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'JAM', N'Jamaica')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'JEY', N'Jersey')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'JOR', N'Jordan')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'JPN', N'Japan')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'KAZ', N'Kazakhstan')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'KEN', N'Kenya')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'KGZ', N'Kyrgyzstan')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'KHM', N'Cambodia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'KIR', N'Kiribati')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'KNA', N'Saint Kitts and Nevis')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'KOR', N'South Korea')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'KWT', N'Kuwait')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LAO', N'Laos')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LBN', N'Lebanon')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LBR', N'Liberia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LBY', N'Libya')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LCA', N'Saint Lucia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LIE', N'Liechtenstein')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LKA', N'Sri Lanka')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LSO', N'Lesotho')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LTU', N'Lithuania')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LUX', N'Luxembourg')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'LVA', N'Latvia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MAC', N'Macau')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MAF', N'Saint Martin')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MAR', N'Morocco')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MCO', N'Monaco')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MDA', N'Moldova')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MDG', N'Madagascar')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MDV', N'Maldives')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MEX', N'Mexico')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MHL', N'Marshall Islands')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MKD', N'Macedonia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MLI', N'Mali')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MLT', N'Malta')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MMR', N'Burma (Myanmar)')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MNE', N'Montenegro')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MNG', N'Mongolia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MNP', N'Northern Mariana Islands')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MOZ', N'Mozambique')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MRT', N'Mauritania')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MSR', N'Montserrat')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MUS', N'Mauritius')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MWI', N'Malawi')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MYS', N'Malaysia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'MYT', N'Mayotte')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NAM', N'Namibia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NCL', N'New Caledonia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NER', N'Niger')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NFK', N'Norfolk Island')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NGA', N'Nigeria')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NIC', N'Nicaragua')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NIU', N'Niue')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NLD', N'Netherlands')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NOR', N'Norway')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NPL', N'Nepal')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NRU', N'Nauru')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'NZL', N'New Zealand')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'OMN', N'Oman')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PAK', N'Pakistan')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PAN', N'Panama')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PCN', N'Pitcairn Islands')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PER', N'Peru')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PHL', N'Philippines')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PLW', N'Palau')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PNG', N'Papua New Guinea')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'POL', N'Poland')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PRI', N'Puerto Rico')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PRK', N'North Korea')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PRT', N'Portugal')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PRY', N'Paraguay')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'PYF', N'French Polynesia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'QAT', N'Qatar')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ROU', N'Romania')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'RUS', N'Russia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'RWA', N'Rwanda')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SAU', N'Saudi Arabia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SDN', N'Sudan')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SEN', N'Senegal')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SGP', N'Singapore')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SHN', N'Saint Helena')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SJM', N'Svalbard')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SLB', N'Solomon Islands')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SLE', N'Sierra Leone')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SLV', N'El Salvador')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SMR', N'San Marino')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SOM', N'Somalia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SPM', N'Saint Pierre and Miquelon')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SRB', N'Serbia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'STP', N'Sao Tome and Principe')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SUR', N'Suriname')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SVK', N'Slovakia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SVN', N'Slovenia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SWE', N'Sweden')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SWZ', N'Swaziland')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SYC', N'Seychelles')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'SYR', N'Syria')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TCA', N'Turks and Caicos Islands')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TCD', N'Chad')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TGO', N'Togo')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'THA', N'Thailand')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TJK', N'Tajikistan')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TKL', N'Tokelau')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TKM', N'Turkmenistan')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TLS', N'Timor-Leste')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TON', N'Tonga')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TTO', N'Trinidad and Tobago')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TUN', N'Tunisia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TUR', N'Turkey')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TUV', N'Tuvalu')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TWN', N'Taiwan')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'TZA', N'Tanzania')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'UGA', N'Uganda')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'UKR', N'Ukraine')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'URY', N'Uruguay')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'USA', N'United States')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'UZB', N'Uzbekistan')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'VAT', N'Holy See (Vatican City)')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'VCT', N'Saint Vincent and the Grenadines')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'VEN', N'Venezuela')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'VGB', N'British Virgin Islands')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'VIR', N'US Virgin Islands')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'VNM', N'Vietnam')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'VUT', N'Vanuatu')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'WLF', N'Wallis and Futuna')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'WSM', N'Samoa')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'YEM', N'Yemen')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ZAF', N'South Africa')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ZMB', N'Zambia')
GO
INSERT [dbo].[countries] ([country_code], [country_name]) VALUES (N'ZWE', N'Zimbabwe')
GO
SET IDENTITY_INSERT [dbo].[films] ON 
GO
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (1, 1, N'Iron man I', 2010, N'USA')
GO
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (2, 1, N'Impossible mission', 2010, N'USA')
GO
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (3, 1, N't2', 2010, N'USA')
GO
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (4, 1, N'God father II', 2010, N'USA')
GO
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (5, 3, N'The best enterprise', 2010, N'USA')
GO
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (6, 1, N'Hello AS', 2010, N'USA')
GO
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (7, 1, N'Huong', 2010, N'USA')
GO
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (8, 1, N'Hello AS', 2010, N'USA')
GO
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (9, 1, N'gh', 2010, N'ESP')
GO
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (10, 1, N'kl', 2010, N'ESP')
GO
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (11, 1, N'Hello', 2010, N'ESP')
GO
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (12, 1, N'Hello anh', 2010, N'ESP')
GO
INSERT [dbo].[films] ([film_id], [genre_id], [title], [year], [country_code]) VALUES (13, 1, N't7', 2010, N'USA')
GO
SET IDENTITY_INSERT [dbo].[films] OFF
GO
SET IDENTITY_INSERT [dbo].[genres] ON 
GO
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (1, N'Action')
GO
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (2, N'Adventure')
GO
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (3, N'Business')
GO
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (4, N'Children''s/Family')
GO
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (5, N'Comedy')
GO
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (6, N'Comedy Drama')
GO
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (7, N'Crime')
GO
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (8, N'Culture & Socienty')
GO
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (9, N'Drama')
GO
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (10, N'Education')
GO
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (11, N'Family & Personal Relationship')
GO
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (12, N'Helth & Fitness')
GO
INSERT [dbo].[genres] ([genre_id], [name]) VALUES (13, N'Historical Film')
GO
SET IDENTITY_INSERT [dbo].[genres] OFF
GO
SET IDENTITY_INSERT [dbo].[rooms] ON 
GO
INSERT [dbo].[rooms] ([room_id], [name], [number_rows], [number_cols]) VALUES (1, N'Theatre A', 10, 10)
GO
INSERT [dbo].[rooms] ([room_id], [name], [number_rows], [number_cols]) VALUES (2, N'Theatre B', 10, 15)
GO
INSERT [dbo].[rooms] ([room_id], [name], [number_rows], [number_cols]) VALUES (3, N'Theatre C', 10, 20)
GO
SET IDENTITY_INSERT [dbo].[rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[shows] ON 
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (1, 1, 1, CAST(N'2014-09-20' AS Date), 7.0000, 0, 1)
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (2, 1, 1, CAST(N'2014-09-20' AS Date), 6.0000, 0, 2)
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (3, 1, 1, CAST(N'2014-09-20' AS Date), 5.0000, 0, 3)
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (4, 1, 1, CAST(N'2014-09-19' AS Date), 9.0000, 0, 1)
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (5, 1, 1, CAST(N'2014-09-19' AS Date), 10.0000, 0, 2)
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (6, 1, 1, CAST(N'2020-05-02' AS Date), 10.0000, 0, 4)
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (7, 1, 3, CAST(N'2020-05-02' AS Date), 20.0000, 0, 2)
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (8, 1, 4, CAST(N'2020-05-02' AS Date), 20.0000, 0, 7)
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (9, 1, 1, CAST(N'2020-05-02' AS Date), 10.0000, 0, 9)
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (10, 1, 3, CAST(N'2020-05-02' AS Date), 10.0000, 0, 1)
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (11, 1, 1, CAST(N'2020-05-02' AS Date), 10.0000, 1, 3)
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (12, 2, 1, CAST(N'2020-05-02' AS Date), 10.0000, 1, 1)
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (13, 1, 1, CAST(N'2020-06-23' AS Date), 10.0000, 0, 1)
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (14, 1, 1, CAST(N'2020-06-23' AS Date), 10.0000, 1, 8)
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (15, 2, 1, CAST(N'2020-05-02' AS Date), 10.0000, 1, 3)
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (16, 1, 1, CAST(N'2020-10-29' AS Date), 10.0000, 0, 1)
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (17, 1, 1, CAST(N'2020-11-12' AS Date), 10.0000, 0, 1)
GO
INSERT [dbo].[shows] ([show_id], [room_id], [film_id], [show_date], [price], [status], [slot]) VALUES (18, 1, 1, CAST(N'2021-03-31' AS Date), 10.0000, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[shows] OFF
GO
ALTER TABLE [dbo].[bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Shows] FOREIGN KEY([show_id])
REFERENCES [dbo].[shows] ([show_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[bookings] CHECK CONSTRAINT [FK_Bookings_Shows]
GO
ALTER TABLE [dbo].[films]  WITH CHECK ADD  CONSTRAINT [FK_Films_Countries] FOREIGN KEY([country_code])
REFERENCES [dbo].[countries] ([country_code])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[films] CHECK CONSTRAINT [FK_Films_Countries]
GO
ALTER TABLE [dbo].[films]  WITH CHECK ADD  CONSTRAINT [FK_Films_Genres] FOREIGN KEY([genre_id])
REFERENCES [dbo].[genres] ([genre_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[films] CHECK CONSTRAINT [FK_Films_Genres]
GO
ALTER TABLE [dbo].[shows]  WITH CHECK ADD  CONSTRAINT [FK_Shows_Films] FOREIGN KEY([film_id])
REFERENCES [dbo].[films] ([film_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[shows] CHECK CONSTRAINT [FK_Shows_Films]
GO
ALTER TABLE [dbo].[shows]  WITH CHECK ADD  CONSTRAINT [FK_Shows_Rooms] FOREIGN KEY([room_id])
REFERENCES [dbo].[rooms] ([room_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[shows] CHECK CONSTRAINT [FK_Shows_Rooms]
GO
USE [master]
GO
ALTER DATABASE [Cinema] SET  READ_WRITE 
GO
