PRINT '[' + CONVERT(NVARCHAR(30), CAST(SYSUTCDATETIME() AS DATETIME2(3)), 121) + '] Deploying script: tweets.sql';

WITH SourceData(Id, Author, TweetText, RetweetCount, FavouriteCount, TweetImage, CreationTime) AS (
	SELECT '832801378208608300','lindsay_jopson',N'I''ve officially found the best fried chicken. Jesus balls it''s good. https://t.co/trl4N7pZPb','0','1','http://pbs.twimg.com/media/C460b0cVcAAuFGr.jpg','18/02/2017 4:58 PM' UNION ALL
	SELECT '834983195414249500','ooblets',N'RT @gamespark: PC/XB1『Ooblets』は『ポケモン』『牧場物語』『どうぶつの森』を混ぜたような農業ゲーム https://t.co/iHapGAUyjv','115','0','NULL','24/02/2017 5:28 PM' UNION ALL
	SELECT '835215254288224300','ooblets',N'RT @destructoid: Double Fine picks up Ooblets, a real cute game about farming and creature collecting https://t.co/gagGrC41p8 https://t.co/','49','0','NULL','25/02/2017 8:50 AM' UNION ALL
	SELECT '835263271779328000','ooblets',N'RT @nonplayercat: When it rains it pours! I''m sorry for all the Ooblets stuff taking over your timelines today. To make up for it','64','0','NULL','25/02/2017 12:00 PM' UNION ALL
	SELECT '835511847486951400','ooblets',N'RT @nonplayercat: Hey. Hey you. Hi.  I picked this for you.  Hey https://t.co/lwPU8ljWj8','30','0','http://pbs.twimg.com/tweet_video_thumb/C5enaVmWAAE33p4.jpg','26/02/2017 4:28 AM' UNION ALL
	SELECT '836071507696603100','lindsay_jopson',N'Bringing up lunch off the rocks this weekend made for quite the picture... https://t.co/qLI8rokax5','0','8','http://pbs.twimg.com/media/C5pSmCJVMAAwSqJ.jpg','27/02/2017 5:32 PM' UNION ALL
	SELECT '837231558973009900','lindsay_jopson',N'RT @summeroftech: Hello, world! SoT2017 student registrations are officially OPEN! https://t.co/3Du57hZnjT https://t.co/lAJRNVqmEC','43','0','http://pbs.twimg.com/media/C53jQe5WAAIw6SY.png','2/03/2017 10:22 PM' UNION ALL
	SELECT '837331973177753600','ooblets',N'RT @ZackBellGames: playing the best of the best~ &lt;3 @ooblets @nonplayercat https://t.co/rcjlFGumaa','10','0','http://pbs.twimg.com/media/C53JmbgVAAEuZYX.jpg','3/03/2017 5:01 AM' UNION ALL
	SELECT '837851104293470200','teaAndDingus',N'@blackllama @jishaal https://t.co/6kSoG3icDm','0','1','http://pbs.twimg.com/media/C6ClIY8U0AA_LBJ.jpg','4/03/2017 3:24 PM' UNION ALL
	SELECT '837874048562417700','blackllama',N'Zen time. https://t.co/X8rY5JOAms','0','4','http://pbs.twimg.com/media/C6C54tbU0AAsNEn.jpg','4/03/2017 4:55 PM' UNION ALL
	SELECT '838301613945061400','teaAndDingus',N'Why you so unimpressed la? whydontyoujustplayonyournewexpensiveplayhouse itwassoexpensivethough https://t.co/KHW5UjDMDT','0','2','http://pbs.twimg.com/media/C6I-22qVUAAS6Wz.jpg','5/03/2017 9:14 PM' UNION ALL
	SELECT '838465966577156100','ooblets',N'RT @perplamps: Ooblets on the BIG screen! Coming to a theater near you (as long as that theater is the Alamo) https://t.co/9JFXQIjw2x','3','0','http://pbs.twimg.com/media/C5t1yBPU4AEDbS1.jpg','6/03/2017 8:07 AM' UNION ALL
	SELECT '839304917399396400','blackllama',N'Thanks @tipaddong! Omnomnomnomnomnom https://t.co/L2OPg0sb8J','0','2','http://pbs.twimg.com/media/C6XPUx5VMAEe9uw.jpg','8/03/2017 3:41 PM' UNION ALL
	SELECT '839552618976297000','blackllama',N'RT @TheSpinoffTV: A salute to the brilliant, invisible women of NZ science, by @SiouxsieW https://t.co/AvzidaNtvr','26','0','NULL','9/03/2017 8:05 AM' UNION ALL
	SELECT '839944933817491500','blackllama',N'Let''s do the things! https://t.co/BtbrjmDSmS','0','8','http://pbs.twimg.com/media/C6gVbApUoAAHepg.jpg','10/03/2017 10:04 AM' UNION ALL
	SELECT '840126348366557200','blackllama',N'@lukeee_h Yessss, welcome to the cat collection life. https://t.co/dQAN19hYIp','0','0','http://pbs.twimg.com/media/C6i6crwVoAAKPgz.jpg','10/03/2017 10:05 PM' UNION ALL
	SELECT '840729206988271600','lindsay_jopson',N'I had no idea this plant in my garden flowered. All this rain and now it chooses to show itself. Pretty rad though https://t.co/UeCZ1hDKTg','0','7','http://pbs.twimg.com/media/C6reuUXU0AALhvx.jpg','12/03/2017 2:00 PM' UNION ALL
	SELECT '840752183733760000','WonderWomanFilm',N'This June, witness the future of justice. #WonderWoman https://t.co/PAwQyH3RiQ','13953','17933','http://pbs.twimg.com/media/C6rjJHHUwAA5OCU.jpg','12/03/2017 3:31 PM' UNION ALL
	SELECT '841137699322966000','blackllama',N'Come join us as a grad @Xero! Cool people doing awesome things! https://t.co/a4JQFXckCk','0','4','NULL','13/03/2017 5:03 PM' UNION ALL
	SELECT '841381173888663600','blackllama',N'https://t.co/Iatt6N2CdV','0','5','http://pbs.twimg.com/media/C60vtf9U0AAwQNq.jpg','14/03/2017 9:11 AM' UNION ALL
	SELECT '841823280654762000','blackllama',N'Cat. Coffee. Two of my favourite things. Thanks @dorkable_munsun https://t.co/egc4OkWymM','0','8','http://pbs.twimg.com/media/C67ByDXU8AAbqz1.jpg','15/03/2017 2:28 PM' UNION ALL
	SELECT '842449304316854300','blackllama',N'This is @ichthys101 as a birb. In case you were wondering. https://t.co/rDvLmdbaVS','0','3','http://pbs.twimg.com/media/C7D7KpxVwAAxvj0.jpg','17/03/2017 7:55 AM' UNION ALL
	SELECT '842500101452914700','blackllama',N'Getting certified with @p99philip! https://t.co/rVI3Gb5my8','0','6','http://pbs.twimg.com/media/C7EpWlrU4AAJ-TC.jpg','17/03/2017 11:17 AM' UNION ALL
	SELECT '842921242877292500','blackllama',N'So tired. https://t.co/Dz3MQomBLa','0','6','http://pbs.twimg.com/media/C7KoXe6V0AA5KYA.jpg','18/03/2017 3:10 PM' UNION ALL
	SELECT '843470624899108900','ooblets',N'RT @shionyaa: saw this game and its literally the cutest i had to do a fanart !! @ooblets https://t.co/UXwAKnpaLR','54','0','http://pbs.twimg.com/media/C7PmBeqU8AEKx_3.jpg','20/03/2017 3:34 AM' UNION ALL
	SELECT '843470896014803000','ooblets',N'RT @nonplayercat: gamedev is just an excuse to make dollhouses for 💰 https://t.co/2wZoVQUdtJ','161','0','http://pbs.twimg.com/tweet_video_thumb/C7SLYraXwAAUjqF.jpg','20/03/2017 3:35 AM' UNION ALL
	SELECT '843470995818250200','ooblets',N'RT @summero: @nonplayercat @perplamps @ooblets some glumberland luv ! https://t.co/Zh7p1X7xHD','15','0','http://pbs.twimg.com/media/C7Pwd8kVsAARvGm.jpg','20/03/2017 3:35 AM' UNION ALL
	SELECT '843571178660905000','LuvKittensDaily',N'Day 21: they have accepted me as one of them https://t.co/Agc0ODHUyF','154','307','http://pbs.twimg.com/media/C7T3hAPWwAAHv5Q.jpg','20/03/2017 10:13 AM' UNION ALL
	SELECT '843582951715754000','LuvKittensDaily',N'The moment I realized my cat should''ve been a model 😍 https://t.co/qB4dAFJF8y','72','173','http://pbs.twimg.com/media/C7UCOQZXkAEkRce.jpg','20/03/2017 11:00 AM'
)
INSERT INTO dbo.Tweets(Id, Author, TweetText, RetweetCount, FavouriteCount, TweetImage, CreationTime)
SELECT
	sd.Id, sd.Author, sd.TweetText, sd.RetweetCount, sd.FavouriteCount, sd.TweetImage, sd.CreationTime
FROM
	SourceData AS sd
WHERE
	NOT EXISTS(SELECT 1 FROM dbo.Tweets AS t WHERE t.Id = sd.Id)
GO