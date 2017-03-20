using System.Collections.Generic;
using System.Linq;
using System.Web.Management;
using Xeromatic.Models;
using Xeromatic.Repository;

namespace Xeromatic.Services
{
    public class TweetService : ITweetService
    {
        private readonly TweetRepository _tweetRepo;

        public TweetService()
        {
            _tweetRepo = new TweetRepository();
        }

        public IEnumerable<TweetOutput> GetAllTweets()
        {
            return _tweetRepo.GetAllTweets();
        }

        public IEnumerable<TweetOutput> GetTweetsByUser(string author)
        {
            //Upper case all the tweet text
            var result = _tweetRepo.GetTweetsByUser(author);
            var tweetsByUser = result as IList<TweetOutput> ?? result.ToList();
            foreach (var item in tweetsByUser)
            {
                item.TweetText = item.TweetText.ToUpper();
            }

            return tweetsByUser;
        }

        public void InsertTweet(TweetInput tweet)
        {
            _tweetRepo.Insert(tweet);
        }

        public void DeleteTweet(string tweetId)
        {
            _tweetRepo.Delete(tweetId);
        }
    }
}