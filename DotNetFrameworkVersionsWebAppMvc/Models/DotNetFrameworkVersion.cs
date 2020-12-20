using System;
using System.Collections.Generic;

#nullable disable

namespace DotNetFrameworkVersionsWebAppMvc.Models
{
    public partial class DotNetFrameworkVersion
    {
        public int Id { get; set; }
        public string ReleaseDword { get; set; }
        public string WindowsVersion { get; set; }
        public string FrameworkVersion { get; set; }
        public string Description { get; set; }
    }
}
