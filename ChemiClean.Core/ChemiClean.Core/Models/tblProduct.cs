//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ChemiClean.Core.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class tblProduct
    {
        public int Id { get; set; }

        [Required]
        public string ProductName { get; set; }

        public string SupplierName { get; set; }

        [Required]
        [DataType(DataType.Url)]
        public string Url { get; set; }

        public string UserName { get; set; }

        [DataType(DataType.Password)]
        public string Password { get; set; }

        public bool DocumentAvailable { get; set; }
    
        public virtual tblProductDocument tblProductDocument { get; set; }
    }
}