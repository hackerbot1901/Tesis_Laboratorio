using System;
using System.Collections.Generic;

namespace API_Laboratorio.Models;

public partial class EstadosOrden
{
    public int EstadoId { get; set; }

    public string? NombreExamen { get; set; }

    public string? Estado { get; set; }

    public int? NumeroOrden { get; set; }

    public virtual ICollection<Muestra> Muestras { get; set; } = new List<Muestra>();
}
