USE [Promapping]
GO
/****** Object:  Table [dbo].[CustAddress]    Script Date: 03/09/2009 17:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustAddress](
	[locationID] [nvarchar](50) NOT NULL,
	[custLastName] [nvarchar](50) NOT NULL,
	[custFirstName] [nvarchar](50) NULL,
	[custAddr1] [nvarchar](50) NULL,
	[custAddr2] [nvarchar](50) NULL,
	[custCity] [nvarchar](50) NULL,
	[custState] [nvarchar](50) NULL,
	[custZip] [nvarchar](50) NULL,
	[custCountry] [nvarchar](50) NULL,
	[custURI] [nvarchar](50) NULL
) ON [PRIMARY]
GO
