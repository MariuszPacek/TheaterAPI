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
    public class SituationsController : ApiController
    {
        private ApplicationDbContext db = new ApplicationDbContext();

        // GET: api/Situations
        public IQueryable<Situation> GetSituations()
        {
            return db.Situations;
        }

        // GET: api/Situations/5
        [ResponseType(typeof(Situation))]
        public async Task<IHttpActionResult> GetSituation(int id)
        {
            Situation situation = await db.Situations.FindAsync(id);
            if (situation == null)
            {
                return NotFound();
            }

            return Ok(situation);
        }

        // PUT: api/Situations/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutSituation(int id, Situation situation)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != situation.Id)
            {
                return BadRequest();
            }

            db.Entry(situation).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SituationExists(id))
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

        // POST: api/Situations
        [ResponseType(typeof(Situation))]
        public async Task<IHttpActionResult> PostSituation(Situation situation)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Situations.Add(situation);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = situation.Id }, situation);
        }

        // DELETE: api/Situations/5
        [ResponseType(typeof(Situation))]
        public async Task<IHttpActionResult> DeleteSituation(int id)
        {
            Situation situation = await db.Situations.FindAsync(id);
            if (situation == null)
            {
                return NotFound();
            }

            db.Situations.Remove(situation);
            await db.SaveChangesAsync();

            return Ok(situation);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SituationExists(int id)
        {
            return db.Situations.Count(e => e.Id == id) > 0;
        }
    }
}