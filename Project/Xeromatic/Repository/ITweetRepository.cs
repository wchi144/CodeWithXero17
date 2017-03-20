using System.Collections.Generic;
using Xeromatic.Models;

namespace Xeromatic.Repository
{
    public interface ITweetRepository
    {
        IEnumerable<TweetOutput> GetAllTweets();
        void Insert(TweetInput tweet);
        void Delete(string tweetId);
    }
}
