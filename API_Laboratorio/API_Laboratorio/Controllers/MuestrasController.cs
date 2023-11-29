using API_Laboratorio.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Linq;

namespace API_Laboratorio.Controllers
{
    [ApiController]
    [Route("muestras")]
    public class MuestrasController : ControllerBase
    {
        [HttpGet]
        [Route("infoPaciente")]
        public IActionResult ObtenerMuestrasPorCodigoDeBarras([FromQuery] string codigoDeBarras)
        {
            try
            {
  
                using (var contexto = new LaboratorioContext())
                {
                    var resultado = contexto.Muestras
                        .Where(m => m.CodigoBarras == codigoDeBarras)
                        .Select(m => new
                        {
                            Sucursal = m.Laboratorio.Sucursal,
                            CodigoBarras = m.CodigoBarras,
                            Nombres_Apellidos = m.Paciente.Nombre,
                            Sexo = m.Paciente.Sexo,
                            Urgencia = m.Urgencia,
                            Nombre_Examen = m.EstadoOrden.NombreExamen,
                            Estado_Examen = m.EstadoOrden.Estado,
                            Numero_Orden = m.EstadoOrden.NumeroOrden
                        }).FirstOrDefault();

                    if (resultado != null)
                    {
                        var response = new
                        {
                            Resultado = resultado,
                            Message = "Se encontró la muestra correspondiente al código de barras."
                        };

                        return Ok(response);
                    }
                    else
                    {
                        return NotFound("No se encontró ninguna muestra para el código de barras proporcionado.");
                    }
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Ocurrió un error al procesar la solicitud.");
            }
        }

    }
}
