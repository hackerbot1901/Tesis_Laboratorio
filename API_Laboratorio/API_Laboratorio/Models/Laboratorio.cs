using System;
using System.Collections.Generic;

namespace API_Laboratorio.Models;

public partial class Laboratorio
{
    public int LaboratorioId { get; set; }

    public string? Sucursal { get; set; }

    public string? Token { get; set; }

    public virtual ICollection<Laboratorista> Laboratorista { get; set; } = new List<Laboratorista>();

    public virtual ICollection<Muestra> Muestras { get; set; } = new List<Muestra>();
}
