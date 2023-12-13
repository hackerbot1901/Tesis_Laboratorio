using API_Laboratorio.Models;
using Microsoft.AspNetCore.Mvc;

namespace API_Laboratorio.Controllers
{
    [ApiController]
    [Route("laboratorio")]
    public class LaboratorioController : ControllerBase
    {
        [HttpGet]
        [Route("subdominio_token")]
        public IActionResult ObtenerMuestrasPorCodigoDeBarras([FromQuery] int id_laboratorio)
        {
            try
            {

                using (var contexto = new LaboratorioContext())
                {
                    var resultado = contexto.Laboratorios
                        .Where(laboratorio => laboratorio.LaboratorioId == id_laboratorio)
                        .Select(laboratorio => new
                        {
                            Sucursal = laboratorio.Sucursal,
                            Token = laboratorio.Token
                        }).FirstOrDefault();

                    if (resultado != null)
                    {
                        var response = new
                        {
                            Resultado = resultado,
                            Message = "Se encontró el laboratorio correspondiente al código de barras."
                        };

                        return Ok(response);
                    }
                    else
                    {
                        return NotFound("No se encontró ningun laboratorio para el código proporcionado.");
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
