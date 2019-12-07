using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Database;
using Theater.Models;

namespace Theater.Controllers
{
    public class DramataController : ApiController
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        // GET: api/Dramata
        public IQueryable<Drama> GetDramata()
        {
            return db.Dramata;
        }

        // GET: api/Dramata/5
        [ResponseType(typeof(Drama))]
        public async Task<IHttpActionResult> GetDrama(int id)
        {
            Drama drama = await db.Dramata.FindAsync(id);
            if (drama == null)
            {
                return NotFound();
            }

            return Ok(drama);
        }

        // PUT: api/Dramata/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutDrama(int id, Drama drama)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != drama.Id)
            {
                return BadRequest();
            }

            db.Entry(drama).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DramaExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Dramata
        [ResponseType(typeof(Drama))]
        public async Task<IHttpActionResult> PostDrama(Drama drama)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Dramata.Add(drama);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = drama.Id }, drama);
        }

        // DELETE: api/Dramata/5
        [ResponseType(typeof(Drama))]
        public async Task<IHttpActionResult> DeleteDrama(int id)
        {
            Drama drama = await db.Dramata.FindAsync(id);
            if (drama == null)
            {
                return NotFound();
            }

            db.Dramata.Remove(drama);
            await db.SaveChangesAsync();

            return Ok(drama);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool DramaExists(int id)
        {
            return db.Dramata.Count(e => e.Id == id) > 0;
        }
    }
}