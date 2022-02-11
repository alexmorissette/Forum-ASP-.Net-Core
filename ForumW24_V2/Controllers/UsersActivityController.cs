using ForumW24_V2.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;


namespace ForumW24_V2.Controllers
{
    public class UsersActivityController : Controller
    {
        private readonly ForumContext _context;

        public UsersActivityController(ForumContext context)
        {
            _context = context;
        }

        [Authorize(Roles ="Admin")]
        public async Task<IActionResult> Index()
        {
            var UsersActivity = from u in _context.AspNetUsers
                                select new UserActivity
                                {
                                    Id = u.Id,
                                    UserName = u.UserName,
                                    SujetsCnt = _context.Sujets.Where(s => s.FkUser == u.Id).Count(),
                                    MessagesCnt = _context.Messages.Where(s => s.FkUser == u.Id).Count(),
                                    LastActivity = ((from s in _context.Sujets
                                                     where s.FkUser == u.Id
                                                    select s.SujDate).OrderByDescending(m => m)
                                                    .Union(from m in _context.Messages
                                                           where m.FkUser == u.Id
                                                            select m.MesDate).OrderByDescending(m => m)).FirstOrDefault()
                                };

            return View(await UsersActivity.ToListAsync());
        }
    }
}
