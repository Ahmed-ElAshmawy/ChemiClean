using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ChemiClean.Web.DTOs
{
    public class ApiResponse
    {
        public ApiResponse()
        {
            Success = true;
        }

        public dynamic Data { get; set; }
        public bool Success { get; set; }
    }
}