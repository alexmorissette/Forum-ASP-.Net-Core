using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ForumW24_V2.Models
{
    public class UserActivity
    {
        [Key, Column(Order=0)]
        public string Id { get; set; }
        public string UserName { get; set; }
        public int SujetsCnt { get; set; }
        public int MessagesCnt { get; set; }
        public DateTime LastActivity { get; set; }
    }
}