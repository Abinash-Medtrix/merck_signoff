USE [merckslide]
GO

/****** Object:  Table [dbo].[slidetracking]    Script Date: 26-12-2017 17:23:50 ******/
DROP TABLE [dbo].[slidetracking]
GO

/****** Object:  Table [dbo].[slidetracking]    Script Date: 26-12-2017 17:23:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[slidetracking](
	[slideid] [bigint] NOT NULL,
	[searched] [bigint] NOT NULL CONSTRAINT [DF_slidetracking_searched]  DEFAULT ((0)),
	[viewed] [bigint] NOT NULL CONSTRAINT [DF_slidetracking_viewed]  DEFAULT ((0)),
	[downloaded] [bigint] NOT NULL CONSTRAINT [DF_slidetracking_downloaded]  DEFAULT ((0)),
	[datecreated] [date] NOT NULL CONSTRAINT [DF_slidetracking_datecreated]  DEFAULT (getdate()),
	[userid] [bigint] NOT NULL CONSTRAINT [DF_slidetracking_userid]  DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[updateUserPresentation]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[updateUserPresentation]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[updateUserPresentation]
GO
/****** Object:  StoredProcedure [dbo].[updatePresentation]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[updatePresentation]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[updatePresentation]
GO
/****** Object:  StoredProcedure [dbo].[searchSlides]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[searchSlides]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[searchSlides]
GO
/****** Object:  StoredProcedure [dbo].[getTrackedSlides]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getTrackedSlides]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getTrackedSlides]
GO
/****** Object:  StoredProcedure [dbo].[getSlideReport]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getSlideReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getSlideReport]
GO
/****** Object:  StoredProcedure [dbo].[getPresentations]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getPresentations]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getPresentations]
GO
/****** Object:  StoredProcedure [dbo].[getMetatag]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getMetatag]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getMetatag]
GO
/****** Object:  StoredProcedure [dbo].[getFolders]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getFolders]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getFolders]
GO
/****** Object:  StoredProcedure [dbo].[getCategory]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getCategory]
GO
/****** Object:  StoredProcedure [dbo].[getAllSlides]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllSlides]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getAllSlides]
GO
/****** Object:  StoredProcedure [dbo].[getActiveSlides]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getActiveSlides]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getActiveSlides]
GO
/****** Object:  StoredProcedure [dbo].[deleteUserSlide]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteUserSlide]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[deleteUserSlide]
GO
/****** Object:  StoredProcedure [dbo].[deleteAdminSlide]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteAdminSlide]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[deleteAdminSlide]
GO
/****** Object:  StoredProcedure [dbo].[deleteAdminPresentation]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteAdminPresentation]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[deleteAdminPresentation]
GO
/****** Object:  StoredProcedure [dbo].[createSlide]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[createSlide]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[createSlide]
GO
/****** Object:  StoredProcedure [dbo].[createPresentation]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[createPresentation]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[createPresentation]
GO
/****** Object:  StoredProcedure [dbo].[createFolder]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[createFolder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[createFolder]
GO
/****** Object:  StoredProcedure [dbo].[createCategory]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[createCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[createCategory]
GO
/****** Object:  StoredProcedure [dbo].[addUserSlide]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addUserSlide]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[addUserSlide]
GO
/****** Object:  StoredProcedure [dbo].[addTrackingEntry]    Script Date: 26-12-2017 17:28:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addTrackingEntry]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[addTrackingEntry]
GO
/****** Object:  StoredProcedure [dbo].[addTrackingEntry]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addTrackingEntry]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[addTrackingEntry] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[addTrackingEntry]
	-- Add the parameters for the stored procedure here
	@slideid bigint,
	@searched bigint,
	@viewed bigint,
	@downloaded bigint,
	@userid bigint

AS
BEGIN
	DECLARE @slideExists int
	SET @slideExists = 0
	SET @slideExists = (Select COUNT(*) from slidetracking where slideid = @slideid and userid = @userid and datecreated = cast(GETDATE() as DATE))
	
	IF(@slideExists = 0)
	BEGIN
		INSERT into slidetracking(slideid,userid) values(@slideid, @userid)
	END

	Update slidetracking set 
	viewed = viewed + @viewed,
	searched = searched + @searched,
	downloaded = downloaded + @downloaded
	where slideid = @slideid and userid = @userid and datecreated = cast(GETDATE() as DATE)

	  
END



GO
/****** Object:  StoredProcedure [dbo].[addUserSlide]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addUserSlide]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[addUserSlide] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[addUserSlide]
	-- Add the parameters for the stored procedure here
	@userid bigint,
	@slideid bigint,
	@ordernumber int

AS
BEGIN
	Declare @presentationid bigint
	SET @presentationid = 0
	Select @presentationid = presentationid from userpresentation where userid = @userid AND status = 0

	if(@presentationid = 0)
		BEGIN
			Insert into userpresentation(userid) VALUES(@userid)
			SET @presentationid = @@IDENTITY
		END

	Declare @slide bigint
	SET @slide = 0
	Select @slide = COUNT(*) From userslides where presentationid = @presentationid AND slideid = @slideid

	IF(@slide = 0)
		BEGIN
		Insert into userslides(presentationid,slideid,ordernumber) VALUES(@presentationid,@slideid,@ordernumber)
		END
	else
		BEGIN
		update userslides set ordernumber = @ordernumber where @presentationid = presentationid AND slideid = @slideid
		END
END



GO
/****** Object:  StoredProcedure [dbo].[createCategory]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[createCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[createCategory] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[createCategory]
	-- Add the parameters for the stored procedure here
	@categoryname nvarchar(500)
AS
BEGIN
	declare @count int
	set @count = 0

	Select @count = categoryid from category where categoryname like @categoryname

	if(@count = 0)
	BEGIN
		Insert into category(categoryname) values(@categoryname)
	END
END



GO
/****** Object:  StoredProcedure [dbo].[createFolder]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[createFolder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[createFolder] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[createFolder]
	-- Add the parameters for the stored procedure here
	@foldername nvarchar(500)
AS
BEGIN
	declare @count int
	set @count = 0

	Select @count = folderid from folder where foldername like @foldername

	if(@count = 0)
	BEGIN
		Insert into folder(foldername) values(@foldername)
	END
END



GO
/****** Object:  StoredProcedure [dbo].[createPresentation]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[createPresentation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[createPresentation] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[createPresentation]
	-- Add the parameters for the stored procedure here
	@presentationname nvarchar(500),
	@categoryid bigint,
	@description varchar(MAX),
	@metatag varchar(MAX),
	@type varchar(50),
	@filename nvarchar(500)

AS
BEGIN
	Insert into presentation(presentationname, categoryid, [description], metatag, [type], [filename]) values(@presentationname, @categoryid, @description, @metatag, @type, @filename)
	SELECT presentationid from presentation where presentationid = @@IDENTITY
END



GO
/****** Object:  StoredProcedure [dbo].[createSlide]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[createSlide]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[createSlide] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[createSlide]
	-- Add the parameters for the stored procedure here
	@slidename nvarchar(500),
	@presentationid bigint,
	@slideindex int
AS
BEGIN
	Declare @slideid bigint
	Insert into slides(slidename, presentationid, slideindex) values(@slidename,@presentationid, @slideindex)
	SET @slideid = @@IDENTITY

	Insert into slidetracking(slideid) Values(@slideid)

	SELECT slideid from slides where slideid = @slideid
END



GO
/****** Object:  StoredProcedure [dbo].[deleteAdminPresentation]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteAdminPresentation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[deleteAdminPresentation] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[deleteAdminPresentation]
	-- Add the parameters for the stored procedure here
	@presentationid bigint

AS
BEGIN
	delete from slides where presentationid = @presentationid
	delete from presentation where presentationid = @presentationid
END



GO
/****** Object:  StoredProcedure [dbo].[deleteAdminSlide]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteAdminSlide]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[deleteAdminSlide] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[deleteAdminSlide]
	-- Add the parameters for the stored procedure here
	@slideid bigint

AS
BEGIN
	delete from slides where slideid = @slideid
	delete from slidetracking where slideid = @slideid
END



GO
/****** Object:  StoredProcedure [dbo].[deleteUserSlide]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deleteUserSlide]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[deleteUserSlide] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>f
-- =============================================
ALTER PROCEDURE [dbo].[deleteUserSlide]
	-- Add the parameters for the stored procedure here
	@userid bigint,
	@slideid bigint

AS
BEGIN
	Declare @presentationid bigint
	SET @presentationid = 0
	Select @presentationid = presentationid from userpresentation where userid = @userid AND status = 0
	
	update userslides set ordernumber = ordernumber - 1 from userslides where ordernumber > (select ordernumber from userslides where presentationid = @presentationid AND slideid = @slideid) AND presentationid = @presentationid
	delete from userslides where slideid = @slideid and presentationid = @presentationid

END



GO
/****** Object:  StoredProcedure [dbo].[getActiveSlides]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getActiveSlides]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getActiveSlides] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[getActiveSlides]
	-- Add the parameters for the stored procedure here
	@userid bigint
AS
BEGIN
	Select slides.slideid, slides.slidename, slides.slideindex, slides.presentationid, presentation.type,userslides.ordernumber, userslides.presentationid as userpresentaitionid  from userslides 
	inner join slides on slides.slideid = userslides.slideid
	inner join presentation on slides.presentationid = presentation.presentationid
	where userslides.presentationid in (select presentationid from userpresentation where userid = @userid AND status = 0) order by ordernumber
 END



GO
/****** Object:  StoredProcedure [dbo].[getAllSlides]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllSlides]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getAllSlides] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[getAllSlides]
	@presentationid bigint
	-- Add the parameters for the stored procedure here
AS
BEGIN

	if(@presentationid = 0)
	BEGIN
		Select slides.slideid, slidename, category.categoryname, slides.createddate, ISNULL(slidetracking.searched, 0) as searched, ISNULL(slidetracking.viewed,0) as viewed , ISNULL(slidetracking.downloaded,0) as downloaded from slides 
		inner join presentation on presentation.presentationid = slides.presentationid
		inner join category on category.categoryid = presentation.categoryid
		left join slidetracking on slidetracking.slideid = slides.slideid
		where presentation.status = 1 order by slides.createddate desc
	END
	else
	BEGIN
		Select slides.slideid, slidename, category.categoryname, slides.createddate, ISNULL(slidetracking.searched, 0) as searched, ISNULL(slidetracking.viewed,0) as viewed , ISNULL(slidetracking.downloaded,0) as downloaded from slides 
		inner join presentation on presentation.presentationid = slides.presentationid
		inner join category on category.categoryid = presentation.categoryid
		left join slidetracking on slidetracking.slideid = slides.slideid
		where presentation.status = 1 AND presentation.presentationid = @presentationid order by slides.createddate desc
	END
END



GO
/****** Object:  StoredProcedure [dbo].[getCategory]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getCategory] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[getCategory]
AS
BEGIN
	Select categoryid, categoryname from category
END



GO
/****** Object:  StoredProcedure [dbo].[getFolders]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getFolders]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getFolders] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[getFolders]
AS
BEGIN
	Select  folderid, foldername from folder
END



GO
/****** Object:  StoredProcedure [dbo].[getMetatag]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getMetatag]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getMetatag] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[getMetatag]
AS
BEGIN
	Select tagid, tagname from metatag
END



GO
/****** Object:  StoredProcedure [dbo].[getPresentations]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getPresentations]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getPresentations] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[getPresentations]
AS
BEGIN
	Select  presentationid, presentationname, metatag, [filename], category.categoryname, createddate, [type] from presentation
	left join category on category.categoryid = presentation.categoryid
	where presentation.status = 1
END



GO
/****** Object:  StoredProcedure [dbo].[getSlideReport]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getSlideReport]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getSlideReport] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[getSlideReport]
AS
BEGIN
	Select  slidename AS [Slide Name], presentation.presentationname + presentation.type AS [Presentation Name] , category.categoryname AS [Category Name], CONVERT(VARCHAR(12), slides.createddate , 106) as [Uploaded Date], ISNULL(slidetracking.searched, 0) as [No of Searches], ISNULL(slidetracking.viewed,0) as [No of Views] , ISNULL(slidetracking.downloaded,0) as [No of Downloads] from slides 
		inner join presentation on presentation.presentationid = slides.presentationid
		inner join category on category.categoryid = presentation.categoryid
		left join slidetracking on slidetracking.slideid = slides.slideid
		where presentation.status = 1 order by slides.createddate desc
END



GO
/****** Object:  StoredProcedure [dbo].[getTrackedSlides]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getTrackedSlides]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getTrackedSlides] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[getTrackedSlides]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	Select RecentlySearched.slideid, slidename, category.categoryname, RecentlySearched.createddate from slides as RecentlySearched
	inner join presentation on presentation.presentationid = RecentlySearched.presentationid
	inner join category on category.categoryid = presentation.categoryid
	left join slidetracking on slidetracking.slideid = RecentlySearched.slideid
	where presentation.status = 1 order by slidetracking.searched desc, RecentlySearched.createddate desc

	Select RecentlyViewed.slideid, slidename, category.categoryname, RecentlyViewed.createddate from slides as RecentlyViewed
	inner join presentation on presentation.presentationid = RecentlyViewed.presentationid
	inner join category on category.categoryid = presentation.categoryid
	left join slidetracking on slidetracking.slideid = RecentlyViewed.slideid
	where presentation.status = 1 order by slidetracking.viewed desc, RecentlyViewed.createddate desc

	Select RecentlyDownloaded.slideid, slidename, category.categoryname, RecentlyDownloaded.createddate from slides as RecentlyDownloaded
	inner join presentation on presentation.presentationid = RecentlyDownloaded.presentationid
	inner join category on category.categoryid = presentation.categoryid
	left join slidetracking on slidetracking.slideid = RecentlyDownloaded.slideid
	where presentation.status = 1 order by slidetracking.downloaded desc, RecentlyDownloaded.createddate desc
END



GO
/****** Object:  StoredProcedure [dbo].[searchSlides]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[searchSlides]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[searchSlides] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[searchSlides]
	-- Add the parameters for the stored procedure here
	@category varchar(MAX),
	@name varchar(500)
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX)
	IF(@category = '' AND @name = '')
	BEGIN
	Select slides.slideid, slidename, category.categoryname, slides.createddate,ISNULL(SUM(slidetracking.searched), 0) as searched, ISNULL(SUM(slidetracking.viewed),0) as viewed , ISNULL(SUM(slidetracking.downloaded),0) as downloaded from slides 
		inner join presentation on presentation.presentationid = slides.presentationid
		inner join category on category.categoryid = presentation.categoryid
		left join slidetracking on slidetracking.slideid = slides.slideid
		where presentation.status = 1 
		group by slidetracking.slideid, slides.slideid, slidename, category.categoryname, slides.createddate
		order by slides.createddate desc
	END
ELSE IF(@category = '' AND @name != '')
	BEGIN
	Select slides.slideid, slidename, category.categoryname, slides.createddate,ISNULL(SUM(slidetracking.searched), 0) as searched, ISNULL(SUM(slidetracking.viewed),0) as viewed , ISNULL(SUM(slidetracking.downloaded),0) as downloaded from slides 
		inner join presentation on presentation.presentationid = slides.presentationid
		inner join category on category.categoryid = presentation.categoryid
		left join slidetracking on slidetracking.slideid = slides.slideid
		where presentation.status = 1 and (presentation.presentationname like '%' + @name + '%' OR slidename like '%' + @name + '%' OR presentation.metatag like '%' + @name + '%')
		group by slidetracking.slideid, slides.slideid, slidename, category.categoryname, slides.createddate
		order by slides.createddate desc
	END
ELSE IF(@category != '' AND @name = '')
	BEGIN
	select @sql = 'Select slides.slideid, slidename, category.categoryname, slides.createddate,ISNULL(SUM(slidetracking.searched), 0) as searched, ISNULL(SUM(slidetracking.viewed),0) as viewed , ISNULL(SUM(slidetracking.downloaded),0) as downloaded from slides' 
		+' inner join presentation on presentation.presentationid = slides.presentationid'
		+' inner join category on category.categoryid = presentation.categoryid'
		+' left join slidetracking on slidetracking.slideid = slides.slideid'
		+' where presentation.status = 1 and category.categoryname in(''' + replace(@category,',',''',''') + ''')' 
		+' group by slidetracking.slideid, slides.slideid, slidename, category.categoryname, slides.createddate'
		+' order by slides.createddate desc'

	exec sp_executesql  @sql
	END
ELSE IF(@category != '' AND @name != '')
	BEGIN
	select @sql = 'Select slides.slideid, slidename, category.categoryname, slides.createddate,ISNULL(SUM(slidetracking.searched), 0) as searched, ISNULL(SUM(slidetracking.viewed),0) as viewed , ISNULL(SUM(slidetracking.downloaded),0) as downloaded from slides' 
		+' inner join presentation on presentation.presentationid = slides.presentationid'
		+' inner join category on category.categoryid = presentation.categoryid'
		+' left join slidetracking on slidetracking.slideid = slides.slideid'
		+' where presentation.status = 1'
		+' and category.categoryname in(''' + replace(@category,',',''',''') + ''')'
		+' and (presentation.presentationname like''' +'%' + @name + '%''' + 'OR slidename like''' +'%' + @name + '%''' + ' OR presentation.metatag like''' +'%' + @name + '%''' + ')'
		+' group by slidetracking.slideid, slides.slideid, slidename, category.categoryname, slides.createddate'
		+' order by slides.createddate desc'

	exec sp_executesql  @sql
	END
END



GO
/****** Object:  StoredProcedure [dbo].[updatePresentation]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[updatePresentation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[updatePresentation] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[updatePresentation]
	-- Add the parameters for the stored procedure here
	@status int,
	@presentationid bigint,
	@percentage int


AS
BEGIN
	IF @status != 0
	   BEGIN
			Update presentation Set status = @status Where presentationid = @presentationid
	   END
	ELSE IF @percentage != 0
		BEGIN
			Update presentation Set percentagecompleted = @percentage Where presentationid = @presentationid
		END
	ELSE IF @status != 0 AND  @percentage != 0
		BEGIN
			Update presentation Set percentagecompleted = @percentage,status = @status  Where presentationid = @presentationid
		END
END



GO
/****** Object:  StoredProcedure [dbo].[updateUserPresentation]    Script Date: 26-12-2017 17:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[updateUserPresentation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[updateUserPresentation] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[updateUserPresentation]
	-- Add the parameters for the stored procedure here
	@status int,
	@presentationid bigint

AS
BEGIN
	Update userpresentation Set status = @status Where presentationid = @presentationid
END



GO
