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
    public class LanguesController : ApiController
    {
        private DBIG3B4Entities1 db = new DBIG3B4Entities1();

        // GET: api/Langues
        public IQueryable<Langue> GetLangues()
        {
            return db.Langues;
        }

        // GET: api/Langues/5
        [ResponseType(typeof(Langue))]
        public IHttpActionResult GetLangue(decimal id)
        {
            Langue langue = db.Langues.Find(id);
            if (langue == null)
            {
                return NotFound();
            }

            return Ok(langue);
        }

        // PUT: api/Langues/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutLangue(decimal id, Langue langue)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != langue.codeLangue)
            {
                return BadRequest();
            }

            db.Entry(langue).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LangueExists(id))
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

        // POST: api/Langues
        [ResponseType(typeof(Langue))]
        public IHttpActionResult PostLangue(Langue langue)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Langues.Add(langue);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (LangueExists(langue.codeLangue))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = langue.codeLangue }, langue);
        }

        // DELETE: api/Langues/5
        [ResponseType(typeof(Langue))]
        public IHttpActionResult DeleteLangue(decimal id)
        {
            Langue langue = db.Langues.Find(id);
            if (langue == null)
            {
                return NotFound();
            }

            db.Langues.Remove(langue);
            db.SaveChanges();

            return Ok(langue);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool LangueExists(decimal id)
        {
            return db.Langues.Count(e => e.codeLangue == id) > 0;
        }
    }
}