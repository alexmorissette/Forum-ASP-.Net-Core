using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ForumW24_V2.Models;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;

namespace ForumW24_V2.Controllers
{
    public class MessagesController : Controller
    {
        private readonly ForumContext _context;

        public MessagesController(ForumContext context)
        {
            _context = context;

        }

        // GET: Messages
        public async Task<IActionResult> Index(int? id, int? numPage, int? itemsParPage)
        {

            ViewData["UserId"] = User.FindFirstValue(ClaimTypes.NameIdentifier);
            ViewData["UserName"] = User.FindFirstValue(ClaimTypes.Name);

           ViewData["MessagesCnt"] = _context.Messages.Where(m=>m.FkSujId == id && m.MesActif == true).Select(m=>m.MesId).Count();
            ViewData["TitreSujet"] = _context.Sujets.Where(s => s.SujId == id).Select(m=>m.SujTitre).FirstOrDefault();
            ViewData["idCatSujets"] = _context.Sujets.Where(s => s.SujId == id).Select(s => s.FkCatId).FirstOrDefault();
            ViewData["CatNom"] = _context.Sujets.Where(s => s.SujId == id).Select(c => c.FkCat.CatNom).FirstOrDefault();

            if (id == null)
            {
                
                var pageActuelle = numPage ?? 1;   
                    var pageSize = itemsParPage ?? 5;
                    if (pageSize != 5)
                    {
                        ViewData["itemsParPage"] = pageSize;  
                    }

                var messages = _context.Messages
                    .OrderByDescending(m=>m.MesDate)
                    .OrderByDescending(m => m.FkSuj.SujVues)
                    .Where(m => m.MesActif)
                    .Select(m =>
                     new MessageWithHead
                     {
                         MesId = m.MesId,
                         MesActif = m.MesActif,
                         MesDate = m.MesDate,
                         MesTexte = m.MesTexte,
                         FkUser = m.FkUser,
                         UserName = m.FkUserNavigation.UserName,
                         FkSuj = m.FkSuj,
                         FkSujId = m.FkSujId
            }).Take(5);

                return View(await PaginatedList<MessageWithHead>.CreateAsync(messages, pageActuelle, pageSize));

            }
            else
            {
                ViewData["FkSujId"] = id;

                // Nbr de vues pour le sujet
                Sujet sujViews = _context.Sujets.Where(s => s.SujId == id).Select(s=>s).Single();
                if(sujViews.SujVues == null)
                {
                    sujViews.SujVues = 0;
                }
                try
                {
                    sujViews.SujVues++; 
                    _context.Sujets.Update(sujViews);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException ex)
                {
                    throw new DbUpdateConcurrencyException(ex.Message);
                }

                // Pour la pagination
                var pageActuelle = numPage ?? 1; 
                    
                    var pageSize = itemsParPage ?? 5;
                    if (pageSize != 5)
                    {
                        ViewData["itemsParPage"] = pageSize;  
                    }

                var messages = _context.Messages
               .OrderByDescending(m => m.MesDate)
               .OrderByDescending(m => m.FkSuj.SujVues)
               .Where(m => m.MesActif && m.FkSujId == id)
               .Select(m =>
                new MessageWithHead
                {
                    MesId = m.MesId,
                    MesActif = m.MesActif,
                    MesDate = m.MesDate,
                    MesTexte = m.MesTexte,
                    FkUser = m.FkUser,
                    UserName = m.FkUserNavigation.UserName,
                    FkSuj = m.FkSuj,
                    FkSujId = m.FkSujId,
                });
                return View(await PaginatedList<MessageWithHead>.CreateAsync(messages, pageActuelle, pageSize));
            }
        }

        // GET: Messages/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var message = await _context.Messages
                .Include(m => m.FkSuj)
                .FirstOrDefaultAsync(m => m.MesId == id);
            if (message == null)
            {
                return NotFound();
            }

            return View(message);
        }

        // GET: Messages/Create
        [Authorize]
        public IActionResult Create(int? id) 
        {
            ViewData["FkSujId"] = id;
            ViewData["MesDate"] = DateTime.Now;
            ViewData["SujTitre"] = _context.Sujets.Where(s => s.SujId == id).Select(s => s.SujTitre).FirstOrDefault();

            return View();
        }

        // POST: Messages/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MesId,FkSujId,FkUser,MesTexte,MesDate,MesActif")] Message message)
        {
            if (ModelState.IsValid)
            {
                message.MesActif = true;
                message.FkUser = User.FindFirstValue(ClaimTypes.NameIdentifier);
                message.MesDate = DateTime.Now;
                _context.Add(message);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index", "Messages", new { id = message.FkSujId});
            }
            //ViewData["FkSujId"] = new SelectList(_context.Sujets.Where(s => s.SujActif == true), "SujId", "SujTitre", message.FkSujId);
            
            return View(message);
        }

        // GET: Messages/Edit/5
        [Authorize(Roles = "User")]
        public async Task<IActionResult> Edit(int? id)
        {
            ViewData["SujTitre"] = _context.Messages.Where(m => m.MesId == id).Select(s=>s.FkSuj.SujTitre).FirstOrDefault();
            ViewData["FkSujId"] = _context.Messages.Where(m => m.MesId == id).Select(s => s.FkSuj.SujId).FirstOrDefault();

            if (id == null)
            {
                return NotFound();
            }

            var message = await _context.Messages.FindAsync(id);
            if (message == null)
            {
                return NotFound();
            }
            ViewData["FkSujId"] = message.FkSujId;
            return View(message);
        }

        // POST: Messages/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "User")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("MesId,FkSujId,FkUser,MesTexte,MesDate,MesActif")] Message message)
        {
            ViewData["FkSujId"] = message.FkSujId;

            if (id != message.MesId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                { 
                    _context.Update(message);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MessageExists(message.MesId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction("Index", new { id = message.FkSujId });
            }
            ViewData["FkSujId"] = message.FkSujId;

            return View(message);
        }

        // GET: Messages/Delete/5
        [Authorize]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var message = await _context.Messages
                .Include(m => m.FkSuj)
                .FirstOrDefaultAsync(m => m.MesId == id);
            if (message == null)
            {
                return NotFound();
            }

            return View(message);
        }

        // POST: Messages/Delete/5
        [Authorize]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var message = await _context.Messages.FindAsync(id);
            message.MesActif = false;
            _context.Messages.Update(message);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index", new { id = message.FkSujId });
        }

        private bool MessageExists(int id)
        {
            return _context.Messages.Any(e => e.MesId == id);
        }
    }
}
