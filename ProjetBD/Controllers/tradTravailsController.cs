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
    public class tradTravailsController : ApiController
    {
        private DBIG3B4Entities db = new DBIG3B4Entities();

        // GET: api/tradTravails
        public IQueryable<tradTravail> GettradTravails()
        {
            return db.tradTravails;
        }

        // GET: api/tradTravails/5
        [ResponseType(typeof(tradTravail))]
        public IHttpActionResult GettradTravail(decimal id)
        {
            tradTravail tradTravail = db.tradTravails.Find(id);
            if (tradTravail == null)
            {
                return NotFound();
            }

            return Ok(tradTravail);
        }

        // PUT: api/tradTravails/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PuttradTravail(decimal id, tradTravail tradTravail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tradTravail.idTradTravail)
            {
                return BadRequest();
            }

            db.Entry(tradTravail).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!tradTravailExists(id))
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

        // POST: api/tradTravails
        [ResponseType(typeof(tradTravail))]
        public IHttpActionResult PosttradTravail(tradTravail tradTravail)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.tradTravails.Add(tradTravail);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (tradTravailExists(tradTravail.idTradTravail))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = tradTravail.idTradTravail }, tradTravail);
        }

        // DELETE: api/tradTravails/5
        [ResponseType(typeof(tradTravail))]
        public IHttpActionResult DeletetradTravail(decimal id)
        {
            tradTravail tradTravail = db.tradTravails.Find(id);
            if (tradTravail == null)
            {
                return NotFound();
            }

            db.tradTravails.Remove(tradTravail);
            db.SaveChanges();

            return Ok(tradTravail);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool tradTravailExists(decimal id)
        {
            return db.tradTravails.Count(e => e.idTradTravail == id) > 0;
        }
    }
}