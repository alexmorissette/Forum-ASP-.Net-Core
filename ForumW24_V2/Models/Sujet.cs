using System;
using System.Collections.Generic;

#nullable disable

namespace ForumW24_V2.Models
{
    public partial class Sujet
    {
        public Sujet()
        {
            Messages = new HashSet<Message>();
        }

        public int SujId { get; set; }
        public int FkCatId { get; set; }
        public string FkUser { get; set; }
        public string SujTitre { get; set; }
        public string SujTexte { get; set; }
        public DateTime SujDate { get; set; }
        public int? SujVues { get; set; }
        public bool SujActif { get; set; }

        public virtual Category FkCat { get; set; }
        public virtual AspNetUser FkUserNavigation { get; set; }
        public virtual ICollection<Message> Messages { get; set; }
    }
}
