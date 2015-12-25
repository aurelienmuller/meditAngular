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
    public class EquipeMedsController : ApiController
    {
        private DBIG3B4Entities db = new DBIG3B4Entities();

        // GET: api/EquipeMeds
        public IQueryable<EquipeMed> GetEquipeMeds()
        {
            return db.EquipeMeds;
        }

        // GET: api/EquipeMeds/5
        [ResponseType(typeof(EquipeMed))]
        public IHttpActionResult GetEquipeMed(decimal id)
        {
            EquipeMed equipeMed = db.EquipeMeds.Find(id);
            if (equipeMed == null)
            {
                return NotFound();
            }

            return Ok(equipeMed);
        }

        // PUT: api/EquipeMeds/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutEquipeMed(decimal id, EquipeMed equipeMed)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != equipeMed.idEquipe)
            {
                return BadRequest();
            }

            db.Entry(equipeMed).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EquipeMedExists(id))
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

        // POST: api/EquipeMeds
        [ResponseType(typeof(EquipeMed))]
        public IHttpActionResult PostEquipeMed(EquipeMed equipeMed)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.EquipeMeds.Add(equipeMed);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (EquipeMedExists(equipeMed.idEquipe))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = equipeMed.idEquipe }, equipeMed);
        }

        // DELETE: api/EquipeMeds/5
        [ResponseType(typeof(EquipeMed))]
        public IHttpActionResult DeleteEquipeMed(decimal id)
        {
            EquipeMed equipeMed = db.EquipeMeds.Find(id);
            if (equipeMed == null)
            {
                return NotFound();
            }

            db.EquipeMeds.Remove(equipeMed);
            db.SaveChanges();

            return Ok(equipeMed);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool EquipeMedExists(decimal id)
        {
            return db.EquipeMeds.Count(e => e.idEquipe == id) > 0;
        }
    }
}