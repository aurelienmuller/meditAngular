using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using ProjetBD.Models;

namespace ProjetBD.Controllers
{
    public class ProfessionsController : ApiController
    {
        private DBIG3B4Entities db = new DBIG3B4Entities();

        // GET: api/Professions
        public IQueryable<Profession> GetProfessions()
        {
            return db.Professions;
        }

        // GET: api/Professions/5
        [ResponseType(typeof(Profession))]
        public IHttpActionResult GetProfession(decimal id)
        {
            Profession profession = db.Professions.Find(id);
            if (profession == null)
            {
                return NotFound();
            }

            return Ok(profession);
        }

        // PUT: api/Professions/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutProfession(decimal id, Profession profession)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != profession.codeProfession)
            {
                return BadRequest();
            }

            db.Entry(profession).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProfessionExists(id))
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

        // POST: api/Professions
        [ResponseType(typeof(Profession))]
        public IHttpActionResult PostProfession(Profession profession)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Professions.Add(profession);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (ProfessionExists(profession.codeProfession))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = profession.codeProfession }, profession);
        }

        // DELETE: api/Professions/5
        [ResponseType(typeof(Profession))]
        public IHttpActionResult DeleteProfession(decimal id)
        {
            Profession profession = db.Professions.Find(id);
            if (profession == null)
            {
                return NotFound();
            }

            db.Professions.Remove(profession);
            db.SaveChanges();

            return Ok(profession);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProfessionExists(decimal id)
        {
            return db.Professions.Count(e => e.codeProfession == id) > 0;
        }
    }
}