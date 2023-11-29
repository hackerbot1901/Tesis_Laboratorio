using System;
using System.Collections.Generic;

namespace API_Laboratorio.Models;

public partial class Muestra
{
    public int MuestraId { get; set; }

    public string CodigoBarras { get; set; } = null!;

    public DateOnly? FechaToma { get; set; }

    public int? PacienteId { get; set; }

    public int? LaboratorioId { get; set; }

    public int? LaboratoristaId { get; set; }

    public int? Edad { get; set; }

    public string? Urgencia { get; set; }

    public int? EstadoOrdenId { get; set; }

    public virtual EstadosOrden? EstadoOrden { get; set; }

    public virtual Laboratorio? Laboratorio { get; set; }

    public virtual Laboratorista? Laboratorista { get; set; }

    public virtual Paciente? Paciente { get; set; }
}
