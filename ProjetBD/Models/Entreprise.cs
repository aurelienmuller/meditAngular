//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProjetBD.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Entreprise
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Entreprise()
        {
            this.Emplois = new HashSet<Emploi>();
            this.Personnes = new HashSet<Personne>();
        }
    
        public decimal numeroEntreprise { get; set; }
        public string denomination { get; set; }
        public string adresse { get; set; }
        public string numtel { get; set; }
        public decimal nbTravailleursSoumis { get; set; }
        public decimal nbTravailleursNonSoumis { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Emploi> Emplois { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Personne> Personnes { get; set; }
    }
}
