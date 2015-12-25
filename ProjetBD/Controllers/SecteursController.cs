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
    public class SecteursController : ApiController
    {
        private DBIG3B4Entities db = new DBIG3B4Entities();

        // GET: api/Secteurs
        public IQueryable<Secteur> GetSecteurs()
        {
            return db.Secteurs;
        }

        // GET: api/Secteurs/5
        [ResponseType(typeof(Secteur))]
        public IHttpActionResult GetSecteur(decimal id)
        {
            Secteur secteur = db.Secteurs.Find(id);
            if (secteur == null)
            {
                return NotFound();
            }

            return Ok(secteur);
        }

        // PUT: api/Secteurs/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutSecteur(decimal id, Secteur secteur)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != secteur.codeSecteur)
            {
                return BadRequest();
            }

            db.Entry(secteur).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SecteurExists(id))
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

        // POST: api/Secteurs
        [ResponseType(typeof(Secteur))]
        public IHttpActionResult PostSecteur(Secteur secteur)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Secteurs.Add(secteur);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (SecteurExists(secteur.codeSecteur))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = secteur.codeSecteur }, secteur);
        }

        // DELETE: api/Secteurs/5
        [ResponseType(typeof(Secteur))]
        public IHttpActionResult DeleteSecteur(decimal id)
        {
            Secteur secteur = db.Secteurs.Find(id);
            if (secteur == null)
            {
                return NotFound();
            }

            db.Secteurs.Remove(secteur);
            db.SaveChanges();

            return Ok(secteur);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SecteurExists(decimal id)
        {
            return db.Secteurs.Count(e => e.codeSecteur == id) > 0;
        }
    }
}