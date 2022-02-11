using ForumW24_V2.Models;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ForumW24_V2.Models
{
    public class MessageWithHead
    {
        [Key, Column(Order=0)]
        public int MesId { get; set; }
        public bool MesActif { get; set; }
        public DateTime MesDate { get; set; }
        public string MesTexte { get; set; }
        public string FkUser { get; set; }
        public string UserName { get; set; }
        public Sujet FkSuj { get; set; }
        public int FkSujId { get; set; }
    }
}