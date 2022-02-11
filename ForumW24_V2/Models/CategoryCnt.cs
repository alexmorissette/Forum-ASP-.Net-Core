using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ForumW24_V2.Models
{
    public class CategoryCnt
    {
        [Key, Column(Order=0)]
        public int CategoryId { get; set; }
        public string CategoryNom { get; set; }
        public string CategoryDesc { get; set; }
        public string CategoryImg { get; set; }
        public bool CategoryActif { get; set; }
        public int SujetsCount { get; set; }

    }
}