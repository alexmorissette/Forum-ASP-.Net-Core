using System;
using System.Collections.Generic;

#nullable disable

namespace ForumW24_V2.Models
{
    public partial class Category
    {
        public Category()
        {
            Sujets = new HashSet<Sujet>();
        }

        public int CatId { get; set; }
        public string CatNom { get; set; }
        public string CatDesc { get; set; }
        public string CatImg { get; set; }
        public bool CatActif { get; set; }

        public virtual ICollection<Sujet> Sujets { get; set; }
    }
}
