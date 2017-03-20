using System.Collections.Generic;
using Xeromatic.Models;

namespace Xeromatic.Repository
{
    public interface ITweetRepository
    {
        IEnumerable<TweetOutput> GetAllTweets();
        IEnumerable<TweetOutput> GetTweetsByUser(string author);
        void Insert(TweetInput tweet);
        void Delete(string tweetId);
    }
}
