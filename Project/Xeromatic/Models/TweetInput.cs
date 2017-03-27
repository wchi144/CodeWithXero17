using System;

namespace Xeromatic.Models
{
    public class TweetInput
    {
        public long Id { get; set; } 
        public string TweetText { get; set; }
        public int RetweetCount { get; set; }
        public string TweetImage { get; set; }
        public string CreationTime { get; set; }
    }
}