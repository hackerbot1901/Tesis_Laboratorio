using System;
using System.Collections.Generic;

namespace API_Laboratorio.Models;

public partial class Laboratorista
{
    public int LaboratoristaId { get; set; }

    public string? Nombre { get; set; }

    public string? Especialidad { get; set; }

    public int? LaboratorioId { get; set; }

    public virtual Laboratorio? Laboratorio { get; set; }

    public virtual ICollection<Muestra> Muestras { get; set; } = new List<Muestra>();
}
