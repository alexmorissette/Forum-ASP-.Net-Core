using ForumW24_V2.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ForumW24_V2.Models
{
    public class SujetCnt
    {
        [Key, Column(Order=0)]
        public int SujetId { get; set; }
        public string SujetTitre { get; set; }
        public string SujetTexte { get; set; }
        public DateTime SujetDate { get; set; }
        public int? SujetVues { get; set; }
        public bool SujetActif { get; set; }
        public string User { get; set; }
        public string CatNom { get; set; }
        public int? FkCatId { get; set; }
        public virtual Category Cat { get; set; }
        public int MessagesCount { get; set; }
        public int MessagesCountSuj { get; set; }

    }
}