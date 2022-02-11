using ForumW24_V2.Models;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ForumW24_V2.Models
{
    public class catSujetsTop3
    {
        [Key, Column(Order = 0)]
        public int CatId { get; set; }
        public string CatNom { get; set; }
        public string CatDesc { get; set; }
        public string CatImg { get; set; }
        public bool CatActif { get; set; }
        public int SujetsCount { get; set; }
        public List<Sujet> SujetsTop3 { get; set; }
    }
}