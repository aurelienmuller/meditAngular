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
    public class EmploisController : ApiController
    {
        private DBIG3B4Entities3 db = new DBIG3B4Entities3();

        // GET: api/Emplois
        public IQueryable<Emploi> GetEmplois()
        {
            return db.Emplois;
        }

        // GET: api/Emplois/5
        [ResponseType(typeof(Emploi))]
        public IHttpActionResult GetEmploi(int id)
        {
            Emploi emploi = db.Emplois.Find(id);
            if (emploi == null)
            {
                return NotFound();
            }

            return Ok(emploi);
        }

        // PUT: api/Emplois/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutEmploi(int id, Emploi emploi)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != emploi.idEmploi)
            {
                return BadRequest();
            }

            db.Entry(emploi).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EmploiExists(id))
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

        // POST: api/Emplois
        [ResponseType(typeof(Emploi))]
        public IHttpActionResult PostEmploi(Emploi emploi)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Emplois.Add(emploi);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = emploi.idEmploi }, emploi);
        }

        // DELETE: api/Emplois/5
        [ResponseType(typeof(Emploi))]
        public IHttpActionResult DeleteEmploi(int id)
        {
            Emploi emploi = db.Emplois.Find(id);
            if (emploi == null)
            {
                return NotFound();
            }

            db.Emplois.Remove(emploi);
            db.SaveChanges();

            return Ok(emploi);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool EmploiExists(int id)
        {
            return db.Emplois.Count(e => e.idEmploi == id) > 0;
        }
    }
}