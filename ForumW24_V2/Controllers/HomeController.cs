using ForumW24_V2.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace ForumW24_V2.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ForumContext _context;


        public HomeController(ILogger<HomeController> logger, ForumContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {

            var catSujTop3 = _context.Categories.Select(c =>
            new catSujetsTop3
            {
                CatId = c.CatId,
                CatNom = c.CatNom,
                CatDesc = c.CatDesc,
                CatImg = c.CatImg,
                CatActif = c.CatActif,
                SujetsCount = _context.Sujets.
                    Where(s => s.FkCatId == c.CatId && s.SujActif == true)
                    .Count(),
                SujetsTop3 = _context.Sujets
                    .Where(s => s.FkCatId == c.CatId && s.SujActif == true && c.CatActif == true)
                    .OrderByDescending(s=>s.SujDate).Take(3).ToList()
            });

            return View(catSujTop3.ToList());

        }

        public IActionResult Reglements()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
