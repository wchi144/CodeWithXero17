PRINT '[' + CONVERT(NVARCHAR(30), CAST(SYSUTCDATETIME() AS DATETIME2(3)), 121) + '] Deploying script: tweets.sql';

WITH SourceData(Id, TweetText, RetweetCount, TweetImage, CreationTime) AS (
SELECT '845284418910597100',N'@WaterratAccntnt High five 🙌🏼🎓^AD','0','NULL','25/03/2017 3:41 AM' UNION ALL
SELECT '845304487992549400',N'@JasonJosephNYC We recommend about 100 tracked items, however it''s not a hard limit. For more info, email support@xero.com. 👍🏼 ^AD','0','NULL','25/03/2017 5:01 AM' UNION ALL
SELECT '845310140920315900',N'@JasonJosephNYC if you''re looking to track that amount we’d normally recommend using one of the inventory apps: https://t.co/Lb2G2cHN4v ^AD','0','NULL','25/03/2017 5:23 AM' UNION ALL
SELECT '845314038246592500',N'@JasonJosephNYC Yeah, sure is. Take a look here for more info: https://t.co/AUYVYbejSy ^AD','0','NULL','25/03/2017 5:39 AM' UNION ALL
SELECT '845356770314858500',N'Here''s how companies are using @gsuite  + Xero to keep their finances on track https://t.co/TKvcGVjZYZ https://t.co/UERFJLVVRn','7','http://pbs.twimg.com/tweet_video_thumb/C7tPgGFWsAARixx.jpg','25/03/2017 8:28 AM' UNION ALL
SELECT '845632153870372900',N'@Broadaccounts @OCRexSoftware No fear! 👏 💪 ^OG','0','NULL','26/03/2017 2:43 AM' UNION ALL
SELECT '845638962958024700',N'@Tekkersit Appreciate this, including the bits to work on, thanks! 💙 ^OG','0','NULL','26/03/2017 3:10 AM' UNION ALL
SELECT '846257032990773200',N'@mikeytung @roddrury The mandate form authorises the bank feed. Have you reached out to bankfeeds@xero.com at all? Team will help out. ^AD','0','NULL','27/03/2017 8:06 PM' UNION ALL
SELECT '846270679309860900',N'#smallbiz funding is changing - find out how the financial web 🕸️ can help your business grow. Join us on 29 March… https://t.co/xAM0djQeTG','3','NULL','27/03/2017 9:00 PM' UNION ALL
SELECT '846293290861367300',N'How can the financial web help you work smarter, get paid faster &amp; access funds quicker? https://t.co/EjJCthhee2 https://t.co/HxN5HV38lU','8','http://pbs.twimg.com/media/C76jQwAXQAAhJbJ.jpg','27/03/2017 10:30 PM' UNION ALL
SELECT '846323509487964200',N'What''s the future of cloud accounting? @garyturner - Xero UK MD - discusses via @HotTopicsHT https://t.co/RkMU25u8bG https://t.co/uCgvcxuzgy','6','http://pbs.twimg.com/media/C76-voZX0AAk9H1.jpg','28/03/2017 12:30 AM' UNION ALL
SELECT '846361114552291300',N'@AliForoughiJr Should be a reverse charge one there, can check in Settings, Tax Rates. If not, can set up using thi… https://t.co/XsfWXX3jde','0','NULL','28/03/2017 2:59 AM' UNION ALL
SELECT '846429264018853900',N'Time is money for small businesses ⏳ so start saving your time and your money with these time-saving apps -… https://t.co/atj6XiDqNu','0','NULL','28/03/2017 7:30 AM'
)
INSERT INTO dbo.Tweets(Id, TweetText, RetweetCount, TweetImage, CreationTime)
SELECT
	sd.Id, sd.TweetText, sd.RetweetCount, sd.TweetImage, sd.CreationTime
FROM
	SourceData AS sd
WHERE
	NOT EXISTS(SELECT 1 FROM dbo.Tweets AS t WHERE t.Id = sd.Id)
GO