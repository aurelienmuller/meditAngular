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
    public class LieuxController : ApiController
    {
        private DBIG3B4Entities db = new DBIG3B4Entities();

        // GET: api/Lieux
        public IQueryable<Lieu> GetLieux()
        {
            return db.Lieux;
        }

        // GET: api/Lieux/5
        [ResponseType(typeof(Lieu))]
        public IHttpActionResult GetLieu(decimal id)
        {
            Lieu lieu = db.Lieux.Find(id);
            if (lieu == null)
            {
                return NotFound();
            }

            return Ok(lieu);
        }

        // PUT: api/Lieux/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutLieu(decimal id, Lieu lieu)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != lieu.idLieu)
            {
                return BadRequest();
            }

            db.Entry(lieu).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LieuExists(id))
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

        // POST: api/Lieux
        [ResponseType(typeof(Lieu))]
        public IHttpActionResult PostLieu(Lieu lieu)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Lieux.Add(lieu);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (LieuExists(lieu.idLieu))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = lieu.idLieu }, lieu);
        }

        // DELETE: api/Lieux/5
        [ResponseType(typeof(Lieu))]
        public IHttpActionResult DeleteLieu(decimal id)
        {
            Lieu lieu = db.Lieux.Find(id);
            if (lieu == null)
            {
                return NotFound();
            }

            db.Lieux.Remove(lieu);
            db.SaveChanges();

            return Ok(lieu);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool LieuExists(decimal id)
        {
            return db.Lieux.Count(e => e.idLieu == id) > 0;
        }
    }
}