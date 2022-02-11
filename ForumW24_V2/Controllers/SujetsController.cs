using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ForumW24_V2.Models;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;

namespace ForumW24_V2.Controllers
{
    public class SujetsController : Controller
    {
        private readonly ForumContext _context;

        public SujetsController(ForumContext context)
        {
            _context = context;
        }

        // GET: Sujets 
        public async Task<IActionResult> Index(int? id)
        {

            // User
            var UserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var UserName = User.FindFirstValue(ClaimTypes.Name);
            ViewData["UserId"] = UserId;
            ViewData["UserName"] = UserName;
            ViewData["FkCatId"] = id;

            if (id == null)
            {
                ViewData["CatNom"] = "Top sujets";

                var sujetsCinq = _context.Sujets
                    .Where(s => s.SujActif == true)
                    .OrderByDescending(s=>s.SujVues)
                    .Select(
                s => new SujetCat
                {
                    SujId = s.SujId,
                    SujTitre = s.SujTitre,
                    SujTexte = s.SujTexte,
                    SujDate = s.SujDate,
                    SujVues = s.SujVues,
                    SujActif = s.SujActif,
                    FkCat = s.FkCat,
                    FkCatId = s.FkCatId,
                    FkUser = s.FkUserNavigation.UserName,
                    FkUserNavigation = s.FkUserNavigation,
                    MessCnt = _context.Messages
                        .Where(m => m.FkSujId == s.SujId && m.MesActif).Count(),
                    LastMessage = (from m in _context.Messages
                                   where s.SujId == m.FkSujId
                                   orderby m.MesDate descending
                                   select m).FirstOrDefault()
                }).Take(5);
                return View(await sujetsCinq.ToListAsync());
            }
            else
            {
               ViewData["CatNom"] = _context.Categories.Where(c => c.CatId == id).Select(c=>c.CatNom).FirstOrDefault();

                var sujetsCat = _context.Sujets
                    .Where(s => s.SujActif == true && s.FkCatId == id)
                    .Select(
                    s => new SujetCat
                    {
                        SujId = s.SujId,
                        SujTitre = s.SujTitre,
                        SujTexte = s.SujTexte,
                        SujDate = s.SujDate,
                        SujVues = s.SujVues,
                        SujActif = s.SujActif,
                        FkCat = s.FkCat,
                        FkCatId = s.FkCatId,
                        FkUser = s.FkUserNavigation.UserName,
                        FkUserNavigation = s.FkUserNavigation,
                        MessCnt = _context.Messages
                            .Where(m => m.FkSujId == s.SujId && m.MesActif).Count(),
                        LastMessage = (from m in _context.Messages
                                       where s.SujId == m.FkSujId
                                       orderby m.MesDate descending
                                       select m).FirstOrDefault()
                    });
                return View(await sujetsCat.ToListAsync());
            }
        }

        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var sujet = await _context.Sujets
                .Include(s => s.FkCat)
                .FirstOrDefaultAsync(m => m.SujId == id);
            if (sujet == null || sujet.FkCat.CatActif == false)
            {
                return NotFound();
            }

            return View(sujet);
        }

        // GET: Sujets/Create
        [Authorize]
        public IActionResult Create(int? id)
        {

                ViewData["FkCatId"] = id;
                ViewData["SujDate"] = DateTime.Now;
                ViewData["CatNom"] = _context.Categories.Where(c => c.CatId == id).Select(c=> c.CatNom).FirstOrDefault();
                ViewData["FkCat"] = _context.Sujets.Where(s => s.FkCatId == id).Select(s => s.FkCat).FirstOrDefault();
                ViewData["FkUserNavigation"] = _context.Sujets.Where(s => s.FkCatId == id).Select(s => s.FkUserNavigation).FirstOrDefault();

                return View();
        }

        // POST: Sujets/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("SujId,FkCatId,FkUser,SujTitre,SujTexte,SujDate,SujVues,SujActif")] Sujet sujet)
        {
            
            if (ModelState.IsValid)
            {
                sujet.SujActif = true;
                sujet.FkUser = User.FindFirstValue(ClaimTypes.NameIdentifier);
                sujet.SujDate = DateTime.Now;
                _context.Add(sujet);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index", "Sujets", new { id = sujet.FkCatId });
            }
            ViewData["FkCatId"] = new SelectList(_context.Categories.Where(c => c.CatActif == true), "CatId", "CatNom");

            return View(sujet);
        }

        // GET: Sujets/Edit/5
        [Authorize(Roles = "User")]

        public async Task<IActionResult> Edit(int? id)
        {

            if (id == null)
            {
                return NotFound();
            }

            var sujet = await _context.Sujets.FindAsync(id);
            if (sujet == null)
            {
                return NotFound();
            }
            ViewData["FkCatId"] = sujet.FkCatId;
            return View(sujet);
        }

        // POST: Sujets/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "User")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("SujId,FkCatId,FkUser,SujTitre,SujTexte,SujDate,SujVues,SujActif")] Sujet sujet)
        {
            ViewData["FkCatId"] = sujet.FkCatId;
            if (id != sujet.SujId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(sujet);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SujetExists(sujet.SujId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction("Index", new { id = sujet.FkCatId});
            }
            ViewData["FkCatId"] = new SelectList(_context.Categories, "CatId", "CatNom", sujet.FkCatId);
            return View(sujet);
        }

        // GET: Sujets/Delete/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var sujet = await _context.Sujets
                .Include(s => s.FkCat)
                .FirstOrDefaultAsync(m => m.SujId == id);
            if (sujet == null)
            {
                return NotFound();
            }

            return View(sujet);
        }

        // POST: Sujets/Delete/5
        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var sujet = await _context.Sujets.FindAsync(id);
            sujet.SujActif = false;
            _context.Sujets.Update(sujet);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index", new { id = sujet.FkCatId });
        }

        private bool SujetExists(int id)
        {
            return _context.Sujets.Any(e => e.SujId == id);
        }
    }
}
