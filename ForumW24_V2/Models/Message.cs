using System;
using System.Collections.Generic;

#nullable disable

namespace ForumW24_V2.Models
{
    public partial class Message
    {
        public int MesId { get; set; }
        public int FkSujId { get; set; }
        public string FkUser { get; set; }
        public string MesTexte { get; set; }
        public DateTime MesDate { get; set; }
        public bool MesActif { get; set; }

        public virtual Sujet FkSuj { get; set; }
        public virtual AspNetUser FkUserNavigation { get; set; }
    }
}
