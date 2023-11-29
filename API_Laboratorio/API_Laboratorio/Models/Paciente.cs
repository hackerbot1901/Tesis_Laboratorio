using System;
using System.Collections.Generic;

namespace API_Laboratorio.Models;

public partial class Paciente
{
    public int PacienteId { get; set; }

    public string? Nombre { get; set; }

    public string? Sexo { get; set; }

    public virtual ICollection<Muestra> Muestras { get; set; } = new List<Muestra>();
}
