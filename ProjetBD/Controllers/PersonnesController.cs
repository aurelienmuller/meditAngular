﻿using System;
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
    public class PersonnesController : ApiController
    {
        private DBIG3B4Entities3 db = new DBIG3B4Entities3();

        // GET: api/Personnes
        public IQueryable<Personne> GetPersonnes()
        {
            return db.Personnes;
        }

        // GET: api/Personnes/5
        [ResponseType(typeof(Personne))]
        public IHttpActionResult GetPersonne(int id)
        {
            Personne personne = db.Personnes.Find(id);
            if (personne == null)
            {
                return NotFound();
            }

            return Ok(personne);
        }

        // PUT: api/Personnes/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutPersonne(int id, Personne personne)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != personne.idPersonne)
            {
                return BadRequest();
            }

            db.Entry(personne).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PersonneExists(id))
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

        // POST: api/Personnes
        [ResponseType(typeof(Personne))]
        public IHttpActionResult PostPersonne(Personne personne)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Personnes.Add(personne);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = personne.idPersonne }, personne);
        }

        // DELETE: api/Personnes/5
        [ResponseType(typeof(Personne))]
        public IHttpActionResult DeletePersonne(int id)
        {
            Personne personne = db.Personnes.Find(id);
            if (personne == null)
            {
                return NotFound();
            }

            db.Personnes.Remove(personne);
            db.SaveChanges();

            return Ok(personne);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool PersonneExists(int id)
        {
            return db.Personnes.Count(e => e.idPersonne == id) > 0;
        }
    }
}