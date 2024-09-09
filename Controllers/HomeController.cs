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

    public IActionResult ConfigurarJuego()
    {
        Juego.InicializarJuego();
        ViewBag.DatosCategorias = BD.ObtenerCategorias();
        ViewBag.DatosDificultades = BD.ObtenerDificultades();
        return View();
    }

    public IActionResult Comenzar(string username, int dificultad, int categoria)
    {
        Juego.CargarPartida(username, dificultad, categoria);
        
        if (BD.ObtenerPreguntas(dificultad, categoria) == null)
        {
            return RedirectToAction("ConfigurarJuego");
        }
        return RedirectToAction("Jugar");
    }

    public IActionResult Jugar()
    {
        ViewBag.Usuario = Juego.Username;
        ViewBag.puntaje = Juego.puntajeActual;
        ViewBag.DatosPreguntaActual = Juego.ObtenerProximaPregunta();
        
        if (ViewBag.DatosPreguntaActual == null)
        {
            return View("Fin");
        }
        else
        {
            int nuevoIdPreg = ViewBag.DatosPreguntaActual.IdPregunta;
            ViewBag.DatosRespuestas = Juego.ObtenerProximasRespuestas(nuevoIdPreg);
            switch (ViewBag.DatosPreguntaActual.IdCategoria)
        {
            case 1:
                ViewBag.fondoCSS = "fondoArte";
                break;
            case 2:
                ViewBag.fondoCSS = "fondoCiencia";
                break;
            case 3:
                ViewBag.fondoCSS = "fondoDeporte";
                break;
            case 4:
                ViewBag.fondoCSS = "fondoEntretenimiento";
                break;
            case 5:
                ViewBag.fondoCSS = "fondoGeografia";
                break;
            case 6:
                ViewBag.fondoCSS = "fondoHistoria";
                break;
        }
            return View("Juego");
        }

    }

    [HttpPost]
    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
{
    Respuesta respuestaCorrecta = Juego.VerificarRespuesta(idPregunta, idRespuesta);
    ViewBag.RespuestaCorrecta = respuestaCorrecta;
    ViewBag.EsCorrecta = respuestaCorrecta.IdRespuesta == idRespuesta;
    if(ViewBag.EsCorrecta){
        ViewBag.fondoRta = "correcta";
    }
    else
    {
      ViewBag.fondoRta = "incorrecta";  
    }
    
    return View("Respuesta");
}
}
