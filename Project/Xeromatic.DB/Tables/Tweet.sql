CREATE TABLE [dbo].[Tweets] (
    [Id]           BIGINT         NOT NULL,
    [Author]         NVARCHAR (140) NOT NULL,
    [TweetText]         NVARCHAR (200) NOT NULL,
    [RetweetCount] INT            NULL,
    [FavouriteCount] INT            NULL,
    [TweetImage]        NVARCHAR (140) NULL,
    [CreationTime]         NVARCHAR (50) NULL,
    CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED ([Id] ASC)
);

