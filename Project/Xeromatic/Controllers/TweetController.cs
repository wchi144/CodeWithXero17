using System.Collections.Generic;
using Xeromatic.Models;
using Xeromatic.Services;
using System.Web.Http;

namespace Xeromatic.Controllers
{
    public class TweetController : ApiController
    {
        private readonly TweetService _tweetService;

        public TweetController()
        {
            _tweetService = new TweetService();
        }

        // Get all tweets from DB
        [HttpGet]
        [Route("tweets")]
        public IEnumerable<TweetOutput> GetAll()
        {
            return _tweetService.GetAllTweets();
        }

        // Get one tweet from DB by user
        [HttpGet]
        [Route("tweets/{author}")]
        public IEnumerable<TweetOutput> GetByUser(string author)
        {
            return _tweetService.GetTweetsByUser(author);
        }

        // Insert a tweet from DB
        [HttpPost]
        [Route("tweets")]
        public void Insert(TweetInput tweet)
        {
            _tweetService.InsertTweet(tweet);
        }

        // Delete a tweet from DB
        [HttpDelete]
        [Route("tweets/{id}")]
        public void Delete(string id)
        {
            _tweetService.DeleteTweet(id);
        }
    }
}
