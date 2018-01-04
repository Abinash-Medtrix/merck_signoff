USE [merckslide]
GO

/****** Object:  Table [dbo].[slidetracking]    Script Date: 12/18/2017 6:17:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[slidetracking](
	[slideid] [bigint] NOT NULL,
	[searched] [bigint] NOT NULL CONSTRAINT [DF_slidetracking_searched]  DEFAULT ((0)),
	[viewed] [bigint] NOT NULL CONSTRAINT [DF_slidetracking_viewed]  DEFAULT ((0)),
	[downloaded] [bigint] NOT NULL CONSTRAINT [DF_slidetracking_downloaded]  DEFAULT ((0))
) ON [PRIMARY]

GO


USE [merckslide]
GO
/****** Object:  StoredProcedure [dbo].[updateUserPresentation]    Script Date: 12/18/2017 6:33:58 PM ******/
DROP PROCEDURE [dbo].[updateUserPresentation]
GO
/****** Object:  StoredProcedure [dbo].[updatePresentation]    Script Date: 12/18/2017 6:33:58 PM ******/
DROP PROCEDURE [dbo].[updatePresentation]
GO
/****** Object:  StoredProcedure [dbo].[searchSlides]    Script Date: 12/18/2017 6:33:58 PM ******/
DROP PROCEDURE [dbo].[searchSlides]
GO
/****** Object:  StoredProcedure [dbo].[getTrackedSlides]    Script Date: 12/18/2017 6:33:58 PM ******/
DROP PROCEDURE [dbo].[getTrackedSlides]
GO
/****** Object:  StoredProcedure [dbo].[getMetatag]    Script Date: 12/18/2017 6:33:58 PM ******/
DROP PROCEDURE [dbo].[getMetatag]
GO
/****** Object:  StoredProcedure [dbo].[getFolders]    Script Date: 12/18/2017 6:33:58 PM ******/
DROP PROCEDURE [dbo].[getFolders]
GO
/****** Object:  StoredProcedure [dbo].[getCategory]    Script Date: 12/18/2017 6:33:58 PM ******/
DROP PROCEDURE [dbo].[getCategory]
GO
/****** Object:  StoredProcedure [dbo].[getAllSlides]    Script Date: 12/18/2017 6:33:58 PM ******/
DROP PROCEDURE [dbo].[getAllSlides]
GO
/****** Object:  StoredProcedure [dbo].[getActiveSlides]    Script Date: 12/18/2017 6:33:58 PM ******/
DROP PROCEDURE [dbo].[getActiveSlides]
GO
/****** Object:  StoredProcedure [dbo].[deleteUserSlide]    Script Date: 12/18/2017 6:33:58 PM ******/
DROP PROCEDURE [dbo].[deleteUserSlide]
GO
/****** Object:  StoredProcedure [dbo].[createSlide]    Script Date: 12/18/2017 6:33:58 PM ******/
DROP PROCEDURE [dbo].[createSlide]
GO
/****** Object:  StoredProcedure [dbo].[createPresentation]    Script Date: 12/18/2017 6:33:58 PM ******/
DROP PROCEDURE [dbo].[createPresentation]
GO
/****** Object:  StoredProcedure [dbo].[createFolder]    Script Date: 12/18/2017 6:33:58 PM ******/
DROP PROCEDURE [dbo].[createFolder]
GO
/****** Object:  StoredProcedure [dbo].[createCategory]    Script Date: 12/18/2017 6:33:58 PM ******/
DROP PROCEDURE [dbo].[createCategory]
GO
/****** Object:  StoredProcedure [dbo].[addUserSlide]    Script Date: 12/18/2017 6:33:58 PM ******/
DROP PROCEDURE [dbo].[addUserSlide]
GO
/****** Object:  StoredProcedure [dbo].[addTrackingEntry]    Script Date: 12/18/2017 6:33:58 PM ******/
DROP PROCEDURE [dbo].[addTrackingEntry]
GO
/****** Object:  StoredProcedure [dbo].[addTrackingEntry]    Script Date: 12/18/2017 6:33:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addTrackingEntry]
	-- Add the parameters for the stored procedure here
	@slideid bigint,
	@searched bigint,
	@viewed bigint,
	@downloaded bigint

AS
BEGIN
	DECLARE @slideExists int
	SET @slideExists = 0
	SET @slideExists = (Select COUNT(*) from slidetracking where slideid = @slideid)
	
	IF(@slideExists = 0)
	BEGIN
		INSERT into slidetracking(slideid) values(@slideid)
	END

	Update slidetracking set 
	viewed = viewed + @viewed,
	searched = searched + @searched,
	downloaded = downloaded + @downloaded
	where slideid = @slideid

	  
END


GO
/****** Object:  StoredProcedure [dbo].[addUserSlide]    Script Date: 12/18/2017 6:33:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addUserSlide]
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
/****** Object:  StoredProcedure [dbo].[createCategory]    Script Date: 12/18/2017 6:33:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[createCategory]
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
/****** Object:  StoredProcedure [dbo].[createFolder]    Script Date: 12/18/2017 6:33:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[createFolder]
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
/****** Object:  StoredProcedure [dbo].[createPresentation]    Script Date: 12/18/2017 6:33:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[createPresentation]
	-- Add the parameters for the stored procedure here
	@presentationname nvarchar(500),
	@categoryid bigint,
	@folderid bigint,
	@description varchar(MAX),
	@metatag varchar(MAX),
	@type varchar(50)

AS
BEGIN
	Insert into presentation(presentationname, categoryid, folderid, [description], metatag, [type]) values(@presentationname, @categoryid, @folderid, @description, @metatag, @type)
	SELECT presentationid from presentation where presentationid = @@IDENTITY
END


GO
/****** Object:  StoredProcedure [dbo].[createSlide]    Script Date: 12/18/2017 6:33:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[createSlide]
	-- Add the parameters for the stored procedure here
	@slidename nvarchar(500),
	@presentationid bigint,
	@slideindex int
AS
BEGIN
	Insert into slides(slidename, presentationid, slideindex) values(@slidename,@presentationid, @slideindex)
	SELECT slideid from slides where slideid = @@IDENTITY
END


GO
/****** Object:  StoredProcedure [dbo].[deleteUserSlide]    Script Date: 12/18/2017 6:33:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteUserSlide]
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
/****** Object:  StoredProcedure [dbo].[getActiveSlides]    Script Date: 12/18/2017 6:33:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getActiveSlides]
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
/****** Object:  StoredProcedure [dbo].[getAllSlides]    Script Date: 12/18/2017 6:33:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllSlides]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	Select slideid, slidename, category.categoryname, slides.createddate from slides 
	inner join presentation on presentation.presentationid = slides.presentationid
	inner join category on category.categoryid = presentation.categoryid
	where presentation.status = 1 order by slides.createddate desc
END


GO
/****** Object:  StoredProcedure [dbo].[getCategory]    Script Date: 12/18/2017 6:33:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getCategory]
AS
BEGIN
	Select categoryid, categoryname from category
END


GO
/****** Object:  StoredProcedure [dbo].[getFolders]    Script Date: 12/18/2017 6:33:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getFolders]
AS
BEGIN
	Select  folderid, foldername from folder
END


GO
/****** Object:  StoredProcedure [dbo].[getMetatag]    Script Date: 12/18/2017 6:33:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getMetatag]
AS
BEGIN
	Select tagid, tagname from metatag
END


GO
/****** Object:  StoredProcedure [dbo].[getTrackedSlides]    Script Date: 12/18/2017 6:33:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getTrackedSlides]
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
/****** Object:  StoredProcedure [dbo].[searchSlides]    Script Date: 12/18/2017 6:33:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[searchSlides]
	-- Add the parameters for the stored procedure here
	@category varchar(MAX),
	@name varchar(500)
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX)
	IF(@category = '' AND @name = '')
	BEGIN
	Select slideid, slidename, category.categoryname, slides.createddate from slides 
		inner join presentation on presentation.presentationid = slides.presentationid
		inner join category on category.categoryid = presentation.categoryid
		where presentation.status = 1 
		order by slides.createddate desc
	END
ELSE IF(@category = '' AND @name != '')
	BEGIN
	Select slideid, slidename, category.categoryname, slides.createddate from slides 
		inner join presentation on presentation.presentationid = slides.presentationid
		inner join category on category.categoryid = presentation.categoryid
		where presentation.status = 1 and (slidename like '%' + @name + '%' OR presentation.metatag like '%' + @name + '%')
		order by slides.createddate desc
	END
ELSE IF(@category != '' AND @name = '')
	BEGIN
	select @sql = 'Select slideid, slidename, category.categoryname, slides.createddate from slides' 
		+' inner join presentation on presentation.presentationid = slides.presentationid'
		+' inner join category on category.categoryid = presentation.categoryid'
		+' where presentation.status = 1 and category.categoryname in(''' + replace(@category,',',''',''') + ''')' 
		+' order by slides.createddate desc'

	exec sp_executesql  @sql
	END
ELSE IF(@category != '' AND @name != '')
	BEGIN
	select @sql = 'Select slideid, slidename, category.categoryname, slides.createddate from slides' 
		+' inner join presentation on presentation.presentationid = slides.presentationid'
		+' inner join category on category.categoryid = presentation.categoryid'
		+' where presentation.status = 1'
		+' and category.categoryname in(''' + replace(@category,',',''',''') + ''')'
		+' and (slidename like''' +'%' + @name + '%''' + ' OR presentation.metatag like''' +'%' + @name + '%''' + ')'
		+' order by slides.createddate desc'

	exec sp_executesql  @sql
	END
END


GO
/****** Object:  StoredProcedure [dbo].[updatePresentation]    Script Date: 12/18/2017 6:33:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updatePresentation]
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
/****** Object:  StoredProcedure [dbo].[updateUserPresentation]    Script Date: 12/18/2017 6:33:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateUserPresentation]
	-- Add the parameters for the stored procedure here
	@status int,
	@presentationid bigint

AS
BEGIN
	Update userpresentation Set status = @status Where presentationid = @presentationid
END


GO
