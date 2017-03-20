using System.Collections.Generic;
using System.Linq;
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
            //Modify Autho name
            //Modify Tweet text with a->CAT logic
            var result = _tweetRepo.GetAllTweets().ToList();
            foreach (var item in result)
            {
                item.Author = item.Author + " IS A COOL CAT!!";
                item.TweetText = item.TweetText.Replace("a", "CAT");
            }
            return result;
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