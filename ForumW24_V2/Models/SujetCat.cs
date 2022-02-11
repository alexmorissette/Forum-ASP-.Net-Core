using ForumW24_V2.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ForumW24_V2.Models
{
    public class SujetCat
    {
        [Key, Column(Order=0)]
        public int SujId { get; set; }
        public string SujTitre { get; set; }
        public string SujTexte { get; set; }
        public DateTime SujDate { get; set; }
        public int? SujVues { get; set; }
        public bool SujActif { get; set; }
        public Category FkCat { get; set; }
        public int FkCatId { get; set; }
        public string FkUser { get; set; }
        public AspNetUser FkUserNavigation { get; set; }
        public int MessCnt { get; set; }
        public Message LastMessage { get;  set; }
    }
}