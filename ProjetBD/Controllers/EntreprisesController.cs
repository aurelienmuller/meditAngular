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
    public class EntreprisesController : ApiController
    {
        private DBIG3B4Entities db = new DBIG3B4Entities();

        // GET: api/Entreprises
        public IQueryable<Entreprise> GetEntreprises()
        {
            return db.Entreprises;
        }

        // GET: api/Entreprises/5
        [ResponseType(typeof(Entreprise))]
        public IHttpActionResult GetEntreprise(decimal id)
        {
            Entreprise entreprise = db.Entreprises.Find(id);
            if (entreprise == null)
            {
                return NotFound();
            }

            return Ok(entreprise);
        }

        // PUT: api/Entreprises/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutEntreprise(decimal id, Entreprise entreprise)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != entreprise.numeroEntreprise)
            {
                return BadRequest();
            }

            db.Entry(entreprise).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EntrepriseExists(id))
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

        // POST: api/Entreprises
        [ResponseType(typeof(Entreprise))]
        public IHttpActionResult PostEntreprise(Entreprise entreprise)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Entreprises.Add(entreprise);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (EntrepriseExists(entreprise.numeroEntreprise))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = entreprise.numeroEntreprise }, entreprise);
        }

        // DELETE: api/Entreprises/5
        [ResponseType(typeof(Entreprise))]
        public IHttpActionResult DeleteEntreprise(decimal id)
        {
            Entreprise entreprise = db.Entreprises.Find(id);
            if (entreprise == null)
            {
                return NotFound();
            }

            db.Entreprises.Remove(entreprise);
            db.SaveChanges();

            return Ok(entreprise);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool EntrepriseExists(decimal id)
        {
            return db.Entreprises.Count(e => e.numeroEntreprise == id) > 0;
        }
    }
}