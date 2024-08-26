using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP07_Dominguez_Minuchin.Models;

namespace TP07_Dominguez_Minuchin.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }  

    public  IActionResult ConfigurarJuego() 
    { 
       Juego.InicializarJuego();  
        ViewBag.DatosCategorias = BD.ObtenerCategorias(); 
        ViewBag.DatosDificultades = BD.ObtenerDificultades(); 
        return View();
    }  

    public IActionResult Comenzar(string username, int dificultad, int categoria) 
    {
        Juego.CargarPartida(username, dificultad, categoria); 
        return View("Jugar"); 
        /* Recibe el username, dificultad y categoría elegidas por el usuario,
         invoca al método CargarPartida de la clase Juego y, siempre y cuando lleguen preguntas de la base de datos,
          redirige el sitio al ActionResult Jugar. En caso de elegir una configuración sin preguntas en base de datos, 
          debe redirigir nuevamente al ActionResult ConfigurarJuego. 
          A CHECKEAR
           */ 
    } 

    public IActionResult Jugar() 
    {
        ViewBag.DatosPreguntaActual = Juego.ObtenerProximaPregunta();  
        if (DatosPreguntaActual.Count == 0 )
        {
            return View("Fin")
        } 
        else 
        {
            ViewBag.DatosRespuestas = Juego.ObtenerProximasRespuestas(int IdPregunta);  
            return View("Juego")
        }

    } 

    public [HttpPost] IActionResult VerificarRespuesta(int idPregunta, int idRespuesta) 
    {
        ViewBag.Respuesta = Juego.VerificarRespuesta();   
        return View("Respuesta");

    }
}
