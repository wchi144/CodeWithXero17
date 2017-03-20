namespace Xeromatic.Models
{
    public class TweetOutput
    {
        public long Id { get; set; } 
        public string Author { get; set; }
        public string TweetText { get; set; }
        public string TweetImage { get; set; }
        public string CreationTime { get; set; }
    }
}